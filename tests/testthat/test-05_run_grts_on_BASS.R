test_that("run_grts_on_BASS()", {

  d <- full_BASS_run(att_sf = psu_hexagons,
                     num_runs = 10,
                     n_samples = 3,
                     costs = psu_costs,
                     hex_id = hex_id,
                     quiet = TRUE,
                     seed = 1234) %>%
    dplyr::mutate(Province = "ON")


  # No stratification
  expect_silent(
    withr::with_seed(1234, {
      sel1 <- run_grts_on_BASS(probs = d,
                               num_runs = 1,
                               nARUs = 12,
                               os = 0.2,
                               hex_id = hex_id)[[1]]
    })
  )

  expect_type(sel1, "list")
  expect_named(sel1, c("sites_legacy", "sites_base", "sites_over",
                       "sites_near", "design"))
  sbase <- sel1[["sites_base"]]
  expect_s3_class(sbase, "data.frame")
  expect_equal(nrow(sbase), 12)
  expect_true(all(sbase$hex_id %in% d$hex_id))
  expect_equal(sbase[names(d)] %>%
                 dplyr::arrange(hex_id) %>%
                 sf::st_drop_geometry(),
               d[d$hex_id %in% sbase$hex_id, ] %>%
                 sf::st_drop_geometry() %>%
                 dplyr::arrange(hex_id),
               ignore_attr = TRUE)

  # Expect chose higher inclpr?

  expect_equal(nrow(sel1[["sites_over"]]), round(12 * 0.2))
  expect_null(sel1[["sites_legacy"]])
  expect_null(sel1[["sites_near"]])


  # Stratify by province

  d_strat <- dplyr::mutate(d, Province = c(rep("ON", 16), rep("MB", 17)))

  expect_silent(
    withr::with_seed(1234, {
      sel2 <- run_grts_on_BASS(probs = d_strat,
                               num_runs = 1,
                               nARUs = c("ON" = 6, "MB" = 4),
                               os = c("ON" = 2, "MB" = 2),   # default?
                               stratum_id = Province,
                               hex_id = hex_id)[[1]]
    })
  )

  expect_type(sel2, "list")
  expect_named(sel2, c("sites_legacy", "sites_base", "sites_over",
                       "sites_near", "design"))
  sbase <- sel2[["sites_base"]]
  expect_s3_class(sbase, "data.frame")
  expect_equal(nrow(sbase), 6 + 4)
  expect_true(all(sbase$hex_id %in% d_strat$hex_id))
  expect_equal(sbase[names(d_strat)] %>%
                 dplyr::arrange(hex_id) %>%
                 sf::st_drop_geometry(),
               d_strat[d_strat$hex_id %in% sbase$hex_id, ] %>%
                 sf::st_drop_geometry() %>%
                 dplyr::arrange(hex_id),
               ignore_attr = TRUE)

  # Expect chose higher inclpr?

  expect_equal(nrow(sel2[["sites_over"]]), 2 + 2)
  expect_null(sel2[["sites_legacy"]])
  expect_null(sel2[["sites_near"]])


  # Strat but not really
  expect_silent(
    withr::with_seed(1234, {
      sel3 <- run_grts_on_BASS(probs = d,
                               num_runs = 1,
                               nARUs = c("ON" = 12),
                               os = c("ON" = 2),   # default?
                               stratum_id = Province,
                               hex_id = hex_id)[[1]]
    })
  )
  expect_type(sel3, "list")
  expect_named(sel3, c("sites_legacy", "sites_base", "sites_over",
                       "sites_near", "design"))

  expect_equal(nrow(sel3[["sites_base"]]), 12)
  expect_equal(nrow(sel3[["sites_over"]]), 2)
  expect_null(sel3[["sites_legacy"]])
  expect_null(sel3[["sites_near"]])


  # Snapshots cannot be tested interactively
  expect_snapshot_value(sel1[["sites_base"]], style = "json2", tolerance = 0.0004)
  expect_snapshot_value(sel2[["sites_base"]], style = "json2", tolerance = 0.0004)
  expect_snapshot_value(sel3[["sites_base"]], style = "json2", tolerance = 0.0004)
})

test_that("run_grts_on_BASS() remove_hexes", {

  d <- full_BASS_run(att_sf = psu_hexagons,
                     num_runs = 10,
                     n_samples = 3,
                     costs = psu_costs,
                     hex_id = hex_id,
                     quiet = TRUE,
                     seed = 1234) %>%
    dplyr::mutate(Province = "ON")


  expect_silent(
    withr::with_seed(1234, {
      sel1 <- run_grts_on_BASS(
        probs = d,
        num_runs = 1,
        nARUs = 2,
        os = 0.2,
        hex_id = hex_id,
        remove_hexes = d$hex_id[1:30])[[1]]
    })
  )
  expect_true(all(!d$hex_id[1:30] %in% sel1[["sites_base"]]$hex_id))



  expect_error(
    run_grts_on_BASS(
      probs = d,
      num_runs = 1,
      nARUs = 2,
      os = 0.2,
      hex_id = NULL,
      remove_hexes = d$hex_id[1:30]),
    "`hex_id` must be specified"
  )
})
