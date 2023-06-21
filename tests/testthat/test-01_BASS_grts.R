test_that("draw_random_samples() - no GRTS", {
  pp <- palmerpenguins::penguins |>
    dplyr::mutate(across(.cols = dplyr::everything(), .fns = as.character))
  names(pp) <- glue::glue("LC{1:ncol(pp)}")

  expect_equal(
    draw_random_samples(
      land_hex = pp, num_runs = 1, n_samples = 10, use_grts = FALSE, seed = 15),

    withr::with_seed(seed = 15, {
      dplyr::slice_sample(pp, n= 10) |>
        dplyr::mutate(run = 1)
    })
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
