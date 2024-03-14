test_that("create_sites()", {

  # Single
  expect_silent(s1 <- create_sites(psu_hexagons[1,], spacing = 5))
  expect_s3_class(s1, "sf")
  expect_equal(unique(s1$hex_id), psu_hexagons$hex_id[1])

  # Multiple
  expect_silent(
    s2 <- create_sites(psu_hexagons[1:10,], spacing = 5) |>
      dplyr::mutate(province = "ON")
  )

  # By (approx) number of sites
  expect_silent(s3a <- create_sites(psu_hexagons[1:5,], n = 7))
  expect_silent(s3b <- create_sites(psu_hexagons[1:5,], n = 10))
  expect_equal(s3a, s3b)

  # Snapshots cannot be run interactively
  expect_snapshot_value(s1, style = "json2")
  expect_snapshot_value(s2, style = "json2")
  expect_snapshot_value(s3a, style = "json2")
})
