test_that("prepare_hab_long()", {

  expect_silent(h <- prepare_hab_long(psu_land_cover, stratum_id = province)) %>%
    expect_s3_class("data.frame")

  # Dimensions and categories
  lc <- stringr::str_subset(names(psu_land_cover), "LC")
  expect_named(h, c("hex_id", "HexArea", "province", "lc", "ha", "ha_total",
                    "total_phab"))
  expect_equal(nrow(h),
               dplyr::n_distinct(psu_land_cover$hex_id) * length(lc))
  expect_true(all(unique(h$lc) == lc))
  expect_true(all(h$hex_id %in% psu_land_cover$hex_id))
  expect_equal(dplyr::n_distinct(h$ha_total),
               dplyr::n_distinct(h$lc))

  # total_phab and ha_total unique to lc
  expect_true(all(as.numeric(h$total_phab) >= 0 | as.numeric(h$total_phab) <= 1))
  expect_equal(unique(h$ha_total[h$lc == "LC1"]),
               sum(h$ha[h$lc == "LC1"]))
  expect_equal(unique(h$total_phab[h$lc == "LC1"]),
               unique(h$ha_total[h$lc == "LC1"]) / sum(unique(h$ha_total)))

  # Pass through variables
  expect_equal(dplyr::select(h, "hex_id","HexArea", "province", "lc", "ha"),
               tidyr::pivot_longer(psu_land_cover, cols = dplyr::matches("LC"),
                                   values_to = "ha", names_to = "lc"))

})

test_that("allhexes()", {
  withr::local_seed(1234)

  h <- dplyr::select(psu_land_cover, dplyr::starts_with("LC")) %>%
    as.matrix()

  t <- as.vector(colSums(h))

  # Dummy sampling data
  s <- psu_land_cover %>%
    dplyr::slice_sample(n = 10) %>%
    dplyr::select(dplyr::starts_with("LC")) %>%
    as.matrix()

  w <- rep(1, length(t))

  expect_output(a1 <- allhexes(h, s, t, w, printDets = TRUE), "Included")
  expect_silent(a2 <- allhexes(h, s, t, w))
  expect_equal(a1, a2)

  # Snapshots cannot be tested interactively
  expect_snapshot_value(a1, style = "json2", tolerance = 0.0004)

 # with weights

})


test_that("quick_ben()", {

  lc_sum <- prepare_hab_long(psu_land_cover, stratum_id = province) %>%
    dplyr::select("lc", "ha_total") %>%
    dplyr::distinct() %>%
    dplyr::rename(ha = ha_total)

  samples <- psu_samples %>%
    purrr::pluck("random_sample") %>%
    dplyr::group_by(run) %>%
    dplyr::summarize_at(dplyr::vars(dplyr::matches("LC\\d")), sum) %>%
    sf::st_drop_geometry()

  expect_silent({
    b1 <- quick_ben(
      d = psu_land_cover,
      samples = samples,
      land_cover_summary = lc_sum,
      hex_id = hex_id,
      print = FALSE
    )
  }) %>%
    expect_s3_class("data.frame")

  expect_equal(nrow(b1), nrow(psu_land_cover))
  expect_true(all(b1$hex_id %in% psu_land_cover$hex_id))

  # land_cover_weights
  w <- data.frame(lc = paste0("LC", 1:6),
                  weights = c(0.1, 0.1, 0.1, 0.1, 0.1, 0.1))

  expect_silent({
    b2 <- quick_ben(
      d = psu_land_cover,
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

  h <- prepare_hab_long(psu_land_cover, stratum_id = province)

  expect_silent({
    withr::with_seed(1234, {
      b1 <- calculate_benefit(grts_res = psu_samples,
                              att_long = h,
                              hex_id = hex_id)
    })
  })

  expect_s3_class(b1, "data.frame")
  expect_equal(nrow(b1), nrow(psu_land_cover))
  expect_true(all(b1$hex_id %in% psu_land_cover$hex_id))

  # non_random_set
  expect_silent({
    withr::with_seed(1234, {
      b2 <- calculate_benefit(
        grts_res = psu_samples,
        att_long = h,
        hex_id = hex_id,
        non_random_set = c("SA_0009", "SA_0022", "SA_0047", "SA_0052"))
    })
  })

  expect_true(all(b1$hex_id == b2$hex_id))
  expect_false(all(b1$benefit == b2$benefit))

  # Snapshots cannot be tested interactively
  expect_snapshot_value(b1, style = "json2", tolerance = 0.0004)
  expect_snapshot_value(b2, style = "json2", tolerance = 0.0004)

})
