test_that("set_seed() is equivalent to withr::with_seed()", {
  n_runs <- 10
  n_samples <- 3

  expect_silent(
    f1 <- full_BASS_run(num_runs = n_runs, n_samples = n_samples,
                        land_hex = psu_hexagons,
                        hex_id = hex_id, stratum_id = province,
                        seed = 1234, quiet = TRUE)
  )

  withr::with_seed(1234, {
    expect_silent(
      f2 <- full_BASS_run(num_runs = n_runs, n_samples = n_samples,
                          land_hex = psu_hexagons,
                          hex_id = hex_id, stratum_id = province,
                          quiet = TRUE)
    )
  })

  expect_equal(f1, f2)

})
