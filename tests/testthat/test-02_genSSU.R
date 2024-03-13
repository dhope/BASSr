test_that("create_sites()", {

  expect_silent(s1 <- create_sites(psu_hexagons[1,], spacing = 5, hex_id))

  expect_silent(
    s2 <- purrr::map_df(
      1:nrow(psu_hexagons),
      ~ create_sites(psu_hexagons[.x,], spacing = 5, hex_id))%>%
      dplyr::mutate(province = "ON")
  )


  expect_snapshot(s1)
  expect_snapshot(s2)
  expect_equal(s2, ssu_points)
})
