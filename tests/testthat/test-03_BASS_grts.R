test_that("draw_random_samples() - no GRTS", {
  expect_equal(
    draw_random_samples(
      land_hex = psu_hexagons,
      num_runs = 1,
      n_samples = 10,
      use_grts = FALSE,
      quiet = TRUE,
      seed = 15),

    withr::with_seed(seed = 15, {
      psu_hexagons |>
        dplyr::mutate(run = 1) |>
        check_land_hex(crs = 4325, coords = c("lon", "lat"), quiet = TRUE) |>
        dplyr::slice_sample(n = 10)
    }),
    ignore_attr = TRUE
  )
})

test_that("draw_random_samples() - with GRTS", {

  n_runs <- 10
  n_samples <- 3

  expect_message(g <- draw_random_samples(
    land_hex = psu_hexagons,
    num_runs = n_runs,
    n_samples = n_samples,
    seed = 1234),
    "Spatial object land_hex should be") %>%
    expect_message(paste0("Finished GRTS draw of ",
                          n_runs, " runs and ",
                          n_samples, " samples"))

  expect_s3_class(g, "sf")

  expect_named(g, c("siteID", "siteuse", "replsite", "lon_WGS84", "lat_WGS84",
                    "stratum", "wgt", "ip", "caty", "run", "num_runs",
                    "n_samples", names(psu_hexagons)), ignore.order = TRUE)
  expect_equal(nrow(g), n_runs * n_samples)
  expect_true(all(g$hex_id %in% psu_hexagons$hex_id))
  expect_true(all(psu_hexagons$hex_id %in% psu_hexagons$hex_id))
  expect_equal(unique(g$n_samples), n_samples)
  expect_equal(unique(g$num_runs), n_runs)
  expect_equal(sort(unique(g$run)), 1:n_runs)

  # Original data should remain the same (just subset)
  expect_equal(g %>%
                 dplyr::arrange(hex_id) %>%
                 dplyr::select(dplyr::any_of(names(psu_hexagons))) %>%
                 dplyr::distinct(),
               psu_hexagons %>%
                 check_land_hex(quiet = TRUE) %>%
                 dplyr::filter(.data$hex_id %in% g$hex_id) %>%
                 dplyr::select(dplyr::any_of(names(g))),
               ignore_attr = TRUE)

  # Snapshots cannot be tested interactively
  expect_snapshot_value(g, style = "json2", tolerance = 0.0004)
})

test_that("draw_random_samples() - Pass ... to spsurvey::grts()", {

  n_runs <- 10
  n_samples <- 3

  expect_no_error(
    g <- draw_random_samples(
      land_hex = psu_hexagons,
      num_runs = n_runs,
      n_samples = n_samples,
      mindis = 1000, return_grts = TRUE,
      seed = 1234, quiet = TRUE)) |>
    # spsurvey <5.5.0 uses cat() for messages, later uses message()
    suppressMessages() |>
    capture.output() |>
    invisible()

  expect_equal(warn_df$Warning,
               "Minimum distance between sites not attained after 10 attempts.")
  expect_equal(g[["grts_output"]][[1]]$design$mindis$None, 1000)
})

test_that("draw_random_samples() - return grts", {

  n_runs <- 10
  n_samples <- 3

  expect_silent(g <- draw_random_samples(
    land_hex = psu_hexagons,
    num_runs = n_runs,
    n_samples = n_samples,
    return_grts = TRUE,
    seed = 1234, quiet = TRUE))

  expect_named(g, c("samples", "grts_output"))
  expect_s3_class(g[["grts_output"]][[1]], "sp_design")
  expect_s3_class(g[["samples"]], "data.frame")
})
