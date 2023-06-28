test_that("prepare_hab_long()", {

  expect_silent(h <- prepare_hab_long(psu_hexagons)) %>%
    expect_s3_class("data.frame")

  # Dimensions and categories
  lc <- stringr::str_subset(names(psu_hexagons), "LC")
  expect_true(all(c("hex_id", "province", "lc", "area", "area_total",
                    "total_phab") %in% names(h)))
  expect_equal(nrow(h),
               dplyr::n_distinct(psu_hexagons$hex_id) * length(lc))
  expect_true(all(unique(h$lc) == lc))
  expect_true(all(h$hex_id %in% psu_hexagons$hex_id))
  expect_equal(dplyr::n_distinct(h$area_total),
               dplyr::n_distinct(h$lc))

  # total_phab and area_total unique to lc
  expect_true(all(as.numeric(h$total_phab) >= 0 | as.numeric(h$total_phab) <= 1))
  expect_equal(unique(h$area_total[h$lc == "LC1"]),
               sum(h$area[h$lc == "LC1"]))
  expect_equal(unique(h$total_phab[h$lc == "LC1"]),
               unique(h$area_total[h$lc == "LC1"]) / sum(unique(h$area_total)))

  # Pass through variables
  expect_equal(dplyr::select(h, "hex_id","province", "lc", "area"),
               tidyr::pivot_longer(psu_hexagons, cols = dplyr::matches("LC"),
                                   values_to = "area", names_to = "lc") %>%
                 dplyr::select("hex_id", "province", "lc", "area") %>%
                 sf::st_drop_geometry())


  # With stratum_id
  expect_silent(h2 <- prepare_hab_long(psu_hexagons, stratum_id = province))
  expect_equal(h, h2)
})

test_that("allhexes()", {

  h <- dplyr::select(psu_hexagons, dplyr::starts_with("LC")) %>%
    sf::st_drop_geometry() %>%
    as.matrix()

  t <- as.vector(colSums(h))

  # Dummy sampling data
  withr::with_seed(1234, {
    s <- psu_hexagons %>%
      check_land_hex(quiet = TRUE) %>%
      sf::st_drop_geometry() %>%
      dplyr::slice_sample(n = 10) %>%
      dplyr::select(dplyr::starts_with("LC")) %>%
      as.matrix()
  })

  w <- rep(1, length(t))

  expect_output(a1 <- allhexes(h, s, t, w, printDets = TRUE), "Included")
  expect_silent(a2 <- allhexes(h, s, t, w))
  expect_equal(a1, a2)

  # Snapshots cannot be tested interactively
  expect_snapshot_value(a1, style = "json2", tolerance = 0.0004)

 # with weights

})


test_that("quick_ben()", {

  lc_sum <- check_land_hex(psu_hexagons, quiet = TRUE) %>%
    prepare_hab_long() %>%
    dplyr::select("lc", "area_total") %>%
    dplyr::distinct() %>%
    dplyr::rename("area" = "area_total")

  samples <- psu_samples %>%
    dplyr::group_by(run) %>%
    dplyr::summarize_at(dplyr::vars(dplyr::matches("LC\\d")), sum) %>%
    sf::st_drop_geometry()

  expect_silent({
    b1 <- quick_ben(
      d = psu_hexagons,
      samples = samples,
      land_cover_summary = lc_sum,
      hex_id = hex_id,
      print = FALSE
    )
  }) %>%
    expect_s3_class("data.frame")

  expect_equal(nrow(b1), nrow(psu_hexagons))
  expect_true(all(b1$hex_id %in% psu_hexagons$hex_id))

  # land_cover_weights
  w <- data.frame(lc = paste0("LC", 1:6),
                  weights = c(0.1, 0.1, 0.1, 0.1, 0.1, 0.1))

  expect_silent({
    b2 <- quick_ben(
      d = psu_hexagons,
      samples = samples,
      land_cover_summary = lc_sum,
      hex_id = hex_id,
      land_cover_weights = w,
      print = FALSE
    )
  })

  expect_true(all(b2$benefit < b1$benefit)) # Because weights low

  # Snapshots cannot be tested interactively
  expect_snapshot_value(b1, style = "json2", tolerance = 0.0004)
})

test_that("calculate_benefit()", {

  expect_silent({
    b1 <- calculate_benefit(samples = psu_samples,
                            land_hex = psu_hexagons,
                            hex_id = hex_id, quiet = TRUE)
  })

  expect_s3_class(b1, "sf")
  expect_equal(nrow(b1), nrow(psu_hexagons))
  expect_true(all(b1$hex_id %in% psu_hexagons$hex_id))

  # non_random_set
  expect_silent({
    b2 <- calculate_benefit(
      land_hex = psu_hexagons,
      samples = psu_samples,
      hex_id = hex_id,
      non_random_set = c("SA_09", "SA_22", "SA_47", "SA_52"),
      quiet = TRUE)
  })

  expect_true(all(b1$hex_id == b2$hex_id))
  expect_false(all(b1$benefit == b2$benefit))

  # Snapshots cannot be tested interactively
  expect_snapshot_value(b1, style = "json2", tolerance = 0.0004)
  expect_snapshot_value(b2, style = "json2", tolerance = 0.0004)

})

test_that("calculate_benefit() without GRTS", {

  g <- draw_random_samples(
    land_hex = psu_hexagons,
    num_runs = 3,
    n_samples = 10,
    use_grts = FALSE,
    seed = 1234,
    quiet = TRUE)

  expect_silent({
    b <- calculate_benefit(land_hex = psu_hexagons,
                           samples = g,
                           hex_id = hex_id,
                           quiet = TRUE)
  })

  expect_s3_class(b, "sf")
  expect_equal(nrow(b), nrow(psu_hexagons))
  expect_true(all(b$hex_id %in% psu_hexagons$hex_id))

  # Snapshots cannot be tested interactively
  expect_snapshot_value(b, style = "json2", tolerance = 0.0004)
  expect_snapshot_value(b, style = "json2", tolerance = 0.0004)

})
