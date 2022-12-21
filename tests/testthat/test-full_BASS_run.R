test_that("full_BASS_run()", {

  n_runs <- 10
  n_samples <- 3

  expect_message({
    withr::with_seed(1234, {
      f1 <- full_BASS_run(num_runs = n_runs, nsamples = n_samples,
                          att = psu_land_cover, att.sp = psu_hexagons,
                          HexID_ = hex_id,
                          stratumID = province,
                          noCost = TRUE, cost = NA)
    })
  })

  expect_s3_class(f1, "data.frame")
  expect_equal(nrow(f1), n_runs * nrow(psu_hexagons))
  expect_named(f1, c("hex_id", "benefit", "run", "num_runs", "nsamples"))

  expect_message({
    withr::with_seed(1234, {
      f2 <- full_BASS_run(num_runs = n_runs, nsamples = n_samples,
                          att = psu_land_cover, att.sp = psu_hexagons,
                          HexID_ = hex_id,
                          stratumID = province,
                          noCost = FALSE, cost = psu_costs)
    })
  })

  expect_s3_class(f2, "data.frame")
  expect_equal(nrow(f2), n_runs * nrow(psu_hexagons))
  expect_true(all(c("benefit", "LogCost", "ScLogCost", "scale_ben", "partIP",
                    "weightedIP", "inclpr", "num_runs", "nsamples") %in%
                    names(f2)))  # No run?

  # Not the same?????
  # expect_equal(dplyr::select(f1, -"run") %>% dplyr::arrange(hex_id, benefit),
  #              dplyr::select(f2, dplyr::any_of(names(f1))) %>%
  #                sf::st_drop_geometry() %>%
  #                dplyr::arrange(hex_id, benefit))

  # Snapshots cannot be tested interactively - WHY NOT CONSISTENT?
#  expect_snapshot_value(f1, style = "json2", tolerance = 0.0004)
 # expect_snapshot_value(f2, style = "json2", tolerance = 0.0004)
})
