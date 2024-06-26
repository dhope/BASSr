n_runs <- 10
n_samples <- 3

test_that("full_BASS_run()", {

  # without costs
  expect_silent({
    f1 <- full_BASS_run(num_runs = n_runs, n_samples = n_samples,
                        land_hex = psu_hexagons,
                        stratum_id = province,
                        seed = 1234, quiet = TRUE)
  })

  expect_s3_class(f1, "data.frame")
  expect_equal(nrow(f1), nrow(psu_hexagons))
  expect_named(f1, c("hex_id", "benefit", "geometry", "num_runs", "n_samples"))


  # With costs
  expect_silent({
    f2 <- full_BASS_run(num_runs = n_runs, n_samples = n_samples,
                        land_hex = psu_hexagons,
                        stratum_id = province,
                        costs = psu_costs,
                        seed = 1234, quiet = TRUE)
  })

  expect_s3_class(f2, "data.frame")
  expect_equal(nrow(f2), nrow(psu_hexagons))
  expect_true(all(c("benefit", "LogCost", "ScLogCost", "scale_ben", "partIP",
                    "weightedIP", "inclpr", "num_runs", "n_samples") %in%
                    names(f2)))

  # With GRTS - No costs
  expect_silent({
    f3 <- full_BASS_run(num_runs = n_runs, n_samples = n_samples,
                        land_hex = psu_hexagons,
                        return_grts = TRUE,
                        stratum_id = province,
                        seed = 1234, quiet = TRUE)
  })

  expect_type(f3, "list")
  expect_named(f3, c("benefits", "grts_output"))
  expect_equal(nrow(f3[["benefits"]]), nrow(psu_hexagons))

  # With costs
  expect_silent({
    f4 <- full_BASS_run(num_runs = n_runs, n_samples = n_samples,
                        land_hex = psu_hexagons,
                        return_grts = TRUE,
                        stratum_id = province,
                        costs = psu_costs,
                        seed = 1234, quiet = TRUE)
  })

  expect_type(f4, "list")
  expect_named(f4, c("inclusion_probs", "grts_output"))
  expect_equal(nrow(f4[["inclusion_probs"]]), nrow(psu_hexagons))

  # Expect same benefits
  nms <- names(f1)
  expect_equal(dplyr::as_tibble(f1) %>% sf::st_as_sf(), # For comparison
               f2[nms])
  expect_equal(dplyr::as_tibble(f3[["benefits"]]) %>% sf::st_as_sf(),
               f4[["inclusion_probs"]][nms])
  expect_equal(dplyr::as_tibble(f1) %>% sf::st_as_sf(),
               f4[["inclusion_probs"]][nms])

  # Expect same costs
  expect_equal(f2, f4[["inclusion_probs"]])

  # Snapshots cannot be tested interactively
  expect_snapshot_value(f1, style = "json2", tolerance = 0.0004)
  expect_snapshot_value(f2, style = "json2", tolerance = 0.0004)
})

test_that("full_BASS_run() - Pass ... to spsurvey::grts()", {

  n_runs <- 10
  n_samples <- 3

  expect_no_error(
    f <- full_BASS_run(num_runs = n_runs, n_samples = n_samples,
                       land_hex = psu_hexagons,
                       return_grts = TRUE,
                       stratum_id = province,
                       costs = psu_costs,
                       mindis = 1000,
                       seed = 1234, quiet = TRUE)
  ) |>
    # spsurvey <5.5.0 uses cat() for messages, later uses message()
    suppressMessages() |>
    capture.output() |>
    invisible()

  expect_equal(warn_df$Warning,
               "Minimum distance between sites not attained after 10 attempts.")
  expect_equal(f[["grts_output"]][[1]]$design$mindis$None, 1000)
})

test_that("full_BASS_run() - return grts", {

  n_runs <- 10
  n_samples <- 3

  expect_silent({
    f <- full_BASS_run(num_runs = n_runs, n_samples = n_samples,
                       land_hex = psu_hexagons,
                       return_grts = TRUE,
                       stratum_id = province,
                       costs = psu_costs,
                       seed = 1234, quiet = TRUE)
  })

  expect_named(f, c("inclusion_probs", "grts_output"))
  expect_s3_class(f[["grts_output"]][[1]], "sp_design")
  expect_s3_class(f[["inclusion_probs"]], "data.frame")


  n_runs <- 1
  n_samples <- 3

  expect_silent({
    f <- full_BASS_run(num_runs = n_runs, n_samples = n_samples,
                       land_hex = psu_hexagons,
                       return_grts = TRUE,
                       stratum_id = province,
                       costs = psu_costs,
                       seed = 1234, quiet = TRUE)
  })

  expect_named(f, c("inclusion_probs", "grts_output"))
  expect_s3_class(f[["grts_output"]], "sp_design")  # No list if only one
  expect_s3_class(f[["inclusion_probs"]], "data.frame")
})
