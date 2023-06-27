test_that("run_grts_on_BASS()", {

  d <- full_BASS_run(land_hex = psu_hexagons,
                     num_runs = 10, n_samples = 3,
                     costs = psu_costs,
                     hex_id = hex_id,
                     seed = 1234, quiet = TRUE) %>%
    dplyr::mutate(Province = "ON")


  # No stratification
  expect_silent(
    sel1 <- run_grts_on_BASS(probs = d,
                             nARUs = 12,
                             os = 0.2,
                             seed = 1234)
  )

  expect_s3_class(sel1, "sp_design")
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

  expect_equal(nrow(sel1[["sites_over"]]), round(12 * 0.2))
  expect_null(sel1[["sites_legacy"]])
  expect_null(sel1[["sites_near"]])

  # List of results
  expect_silent(
    sel <- run_grts_on_BASS(probs = d,
                            num_runs = 5,
                            nARUs = 12,
                            os = 0.2,
                            seed = 1234)
  )

  expect_length(sel, 5)
  expect_false(inherits(sel, "sp_design"))
  expect_s3_class(sel[[1]], "sp_design")

  # Stratify by province - vector

  d_strat <- dplyr::mutate(d, Province = c(rep("ON", 16), rep("MB", 17)))

  expect_silent(
    sel2 <- run_grts_on_BASS(probs = d_strat,
                             nARUs = c("ON" = 6, "MB" = 4),
                             os = c("ON" = 2, "MB" = 2),   # default?
                             stratum_id = Province,
                             seed = 1234)
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

  expect_equal(nrow(sel2[["sites_over"]]), 2 + 2)
  expect_null(sel2[["sites_legacy"]])
  expect_null(sel2[["sites_near"]])

  # Stratify by province - list

  d_strat <- dplyr::mutate(d, Province = c(rep("ON", 16), rep("MB", 17)))

  expect_silent(
    sel3 <- run_grts_on_BASS(probs = d_strat,
                             nARUs = list("ON" = 6, "MB" = 4),
                             os = list("ON" = 2, "MB" = 2),
                             stratum_id = Province,
                             seed = 1234)
  )

  expect_equal(sel2, sel3)

  # Stratify by province - dataframe

  d_strat <- dplyr::mutate(d, Province = c(rep("ON", 16), rep("MB", 17)))

  expect_silent(
    sel4 <- run_grts_on_BASS(probs = d_strat,
                             nARUs = data.frame(Province = c("ON", "MB"),
                                                n = c(6, 4),
                                                n_os = c(2, 2)),
                             stratum_id = Province,
                             seed = 1234)
  )

  expect_equal(sel2, sel4)

  # Missing strata column
  expect_error(
    run_grts_on_BASS(probs = d,
                     nARUs = list("ON" = 6, "MB" = 4),
                     os = list("ON" = 2, "MB" = 2),
                     seed = 1234),
    "`stratum_id` must be")

  # Missing values column
  expect_error(
    run_grts_on_BASS(probs = d,
                     nARUs = 6,
                     os = list("ON" = 2, "MB" = 2),
                     stratum_id = Province,
                     seed = 1234),
    "`nARUs` must be")

  # os too high
  expect_error(
    run_grts_on_BASS(probs = d,
                     nARUs = list("ON" = 6, "MB" = 4),
                     os = 2,
                     stratum_id = Province,
                     seed = 1234),
    "`os` as a single value is a proportion")

  # Missing names
  expect_error(
    run_grts_on_BASS(probs = d,
                     nARUs = list(6, 4),
                     os = list(2, 2),
                     stratum_id = Province,
                     seed = 1234),
    "`nARUs` must be")

  # Strat but not really
  expect_error(
    run_grts_on_BASS(probs = d,
                     nARUs = c("ON" = 12),
                     os = c("ON" = 2),   # default?
                     stratum_id = Province,
                     seed = 1234),
    "There is only one stratum")

  # Data frame incorrect
  expect_error(
    run_grts_on_BASS(probs = d,
                     nARUs = data.frame(Province = c("ON", "MB"),
                                        n = c(6, 4),
                                        os = c(2, 2)),
                     stratum_id = Province,
                     seed = 1234),
    "`nARUs` must be")


  # Snapshots cannot be tested interactively
  expect_snapshot_value(sel1[["sites_base"]], style = "json2", tolerance = 0.0004)
  expect_snapshot_value(sel2[["sites_base"]], style = "json2", tolerance = 0.0004)
})

test_that("run_grts_on_BASS() remove_hexes", {

  d <- full_BASS_run(land_hex = psu_hexagons,
                     num_runs = 10,
                     n_samples = 3,
                     costs = psu_costs,
                     hex_id = hex_id,
                     quiet = TRUE,
                     seed = 1234)


  expect_silent(
    sel1 <- run_grts_on_BASS(
      probs = d,
      nARUs = 2,
      os = 0.2,
      hex_id = hex_id,
      remove_hexes = d$hex_id[1:30],
      seed = 1234)[[1]]
  )
  expect_true(all(!d$hex_id[1:30] %in% sel1[["sites_base"]]$hex_id))

  expect_error(
    run_grts_on_BASS(
      probs = d,
      nARUs = 2,
      os = 0.2,
      remove_hexes = d$hex_id[1:30]),
    "`hex_id` must be specified"
  )
})

test_that("run_grts_on_BASS() mindis and maxtry", {

  d <- full_BASS_run(land_hex = psu_hexagons,
                     num_runs = 10,
                     n_samples = 3,
                     costs = psu_costs,
                     hex_id = hex_id,
                     quiet = TRUE,
                     seed = 1234)

  expect_no_error(
    sel1 <- run_grts_on_BASS(
      probs = d,
      nARUs = 15,
      os = 0.2,
      mindis = 10000000000,
      maxtry = 1,
      seed = 1234)
  ) |>
    # spsurvey ~5.4 uses cat() for messages, later uses message()
    suppressMessages() |>
    capture.output() |>
    invisible()

  expect_equal(warn_df$Warning,
               "Minimum distance between sites not attained after 1 attempts.")
  expect_equal(sel1$design$mindis$None, 10000000000)

})
