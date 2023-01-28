test_that("check_column()", {

  # Quoted
  expect_silent(check_column(psu_hexagons, hex_id))
  expect_error(check_column(psu_hexagons, hex_id2), "'hex_id2' not found")

  f <- function(col) check_column(psu_hexagons, {{ col }})

  expect_silent(f(hex_id))
  expect_error(f(HEX_ID), "'HEX_ID' not found in data")

  f <- function(col) {
    col <- rlang::enquo(col)
    check_column(psu_hexagons, {{ col }})
  }

  expect_silent(f(hex_id))
  expect_error(f(HEX_ID), "'HEX_ID' not found in data")


  # Need to use {{ }}
  f <- function(col) {
    col <- rlang::enquo(col)
    check_column(psu_hexagons, col)
  }

  expect_error(f(hex_id))

})

test_that("check_costs()", {

})

test_that("check_lc_names()", {

})

test_that("check_att_sf()", {

})

test_that("check_land_cover()", {

})

test_that("check_points()", {

})
