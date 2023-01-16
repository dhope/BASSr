n_runs <- 10
n_samples <- 3

test_that("full_BASS_run()", {

  # without costs
  expect_silent({
    f1 <- full_BASS_run(num_runs = n_runs, nsamples = n_samples,
                        att = psu_land_cover, att.sp = psu_hexagons,
                        HexID_ = hex_id, seed_ = 1234,
                        stratumID = province,
                        noCost = TRUE, cost = NA, quiet = TRUE)
  })

  expect_s3_class(f1, "data.frame")
  expect_equal(nrow(f1), n_runs * nrow(psu_hexagons))
  expect_named(f1, c("hex_id", "benefit", "run", "num_runs", "nsamples"))


  # With costs
  expect_silent({
    f2 <- full_BASS_run(num_runs = n_runs, nsamples = n_samples,
                        att = psu_land_cover, att.sp = psu_hexagons,
                        HexID_ = hex_id, seed_ = 1234,
                        stratumID = province,
                        noCost = FALSE, cost = psu_costs, quiet = TRUE)
  })

  expect_s3_class(f2, "data.frame")
  expect_equal(nrow(f2), n_runs * nrow(psu_hexagons))
  expect_true(all(c("benefit", "LogCost", "ScLogCost", "scale_ben", "partIP",
                    "weightedIP", "inclpr", "num_runs", "nsamples") %in%
                    names(f2)))  # No run?

  # Expect same benefits
  expect_equal(dplyr::select(f1, -"run") %>% dplyr::arrange(hex_id, benefit),
               dplyr::select(f2, dplyr::any_of(names(f1))) %>%
                 sf::st_drop_geometry() %>%
                 dplyr::arrange(hex_id, benefit))

  # Snapshots cannot be tested interactively
  expect_snapshot_value(f1, style = "json2", tolerance = 0.0004)
  expect_snapshot_value(f2, style = "json2", tolerance = 0.0004)
})

test_that("full_BASS_run() slow", {

  expect_silent({
    f1 <- full_BASS_run(num_runs = n_runs, nsamples = n_samples,
                        att = psu_land_cover, att.sp = psu_hexagons,
                        HexID_ = hex_id, quick = FALSE, seed_ = 1234,
                        stratumID = province,
                        noCost = TRUE, cost = NA, quiet = TRUE)
  })

  expect_s3_class(f1, "data.frame")
  expect_equal(nrow(f1), n_runs * nrow(psu_hexagons))
  expect_named(f1, c("hex_id", "benefit", "run", "num_runs", "nsamples"))

  # With costs
  expect_silent({
    f2 <- full_BASS_run(num_runs = n_runs, nsamples = n_samples,
                        att = psu_land_cover, att.sp = psu_hexagons,
                        HexID_ = hex_id, quick = FALSE, seed_ = 1234,
                        stratumID = province,
                        noCost = FALSE, cost = psu_costs, quiet = TRUE)
  })

  expect_s3_class(f1, "data.frame")
  expect_equal(nrow(f1), n_runs * nrow(psu_hexagons))
  expect_named(f1, c("hex_id", "benefit", "run", "num_runs", "nsamples"))

  # Expect same benefits
  expect_equal(dplyr::select(f1, -"run") %>% dplyr::arrange(hex_id, benefit),
               dplyr::select(f2, dplyr::any_of(names(f1))) %>%
                 sf::st_drop_geometry() %>%
                 dplyr::arrange(hex_id, benefit))

  # Snapshots cannot be tested interactively
  expect_snapshot_value(f1, style = "json2", tolerance = 0.0004)
  expect_snapshot_value(f2, style = "json2", tolerance = 0.0004)

})

test_that("full_BASS_run() all", {

  # All
  expect_silent({
    f1 <- full_BASS_run(num_runs = n_runs, nsamples = n_samples,
                        att = psu_land_cover, att.sp = psu_hexagons,
                        HexID_ = hex_id, return_all = TRUE,
                        stratumID = province, seed_ = 1234,
                        noCost = TRUE, cost = NA, quiet = TRUE)
  })

  expect_s3_class(f1, "data.frame")
  expect_equal(nrow(f1), n_runs * nrow(psu_hexagons))
  #expect_named(f2, c("hex_id", "benefit", "run", "num_runs", "nsamples"))

  # With costs
  expect_silent({
    f2 <- full_BASS_run(num_runs = n_runs, nsamples = n_samples,
                        att = psu_land_cover, att.sp = psu_hexagons,
                        HexID_ = hex_id, return_all = TRUE,
                        stratumID = province, seed_ = 1234,
                        noCost = FALSE, cost = psu_costs, quiet = TRUE)
  })

  expect_type(f2, "list")
  expect_equal(nrow(f2[["inclusionPr"]]), n_runs * nrow(psu_hexagons))

  # Snapshots cannot be tested interactively
  expect_snapshot_value(f1, style = "json2", tolerance = 0.0004)
  expect_snapshot_value(f2, style = "json2", tolerance = 0.0004)

})

