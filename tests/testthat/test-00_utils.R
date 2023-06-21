test_that("is_crs()", {

  expect_true(is_crs(4326))
  expect_false(is_crs(0))
  expect_false(is_crs("test"))
  expect_false(is_crs(NULL))
  expect_false(is_crs(NA))

  expect_true(is_crs(sf::st_crs(psu_hexagons)))
  expect_true(is_crs(sf::st_crs(psu_hex_dirty)))
})

test_that("set_seed()", {

  expect_false(all(set_seed(NULL, sample(1:100)) ==
                     set_seed(NULL, sample(1:100))))

  expect_equal(set_seed(1, sample(1:100)), set_seed(1, sample(1:100)))

  expect_equal(set_seed(1, sample(1:100)),
               withr::with_seed(1, sample(1:100)))

})
