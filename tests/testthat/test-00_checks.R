test_that("check_column()", {

  # Character
  expect_silent(check_column(psu_hexagons, "hex_id"))
  expect_error(check_column(psu_hexagons, "hex_iddddd"),
               "not found in data")

  # Quoted
  f <- function(col) check_column(psu_hexagons, rlang::enquo(col))

  expect_silent(f(hex_id))
  expect_error(f(HEX_ID), "not found in data")

})

test_that("check_costs()", {

})
