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

test_that("check_column_text()", {
  expect_silent(check_column_text(psu_hexagons, "hex_id"))
  expect_error(check_column_text(psu_hexagons, "hex_iddd"),
               "Column 'hex_iddd' not found in data frame `psu_hexagons`")
})

test_that("check_costs()", {

})

test_that("check_lc_names()", {

})

test_that("check_land_hex()", {

  expect_message(check_land_hex(psu_hexagons, NA, NA, quiet = FALSE),
                 "Spatial object land_hex should be POINTs not POLYGONs")
  expect_silent(check_land_hex(psu_hexagons, NA, NA, quiet = TRUE))

  r <- add_coords(psu_hexagons) |>
    sf::st_drop_geometry()

  expect_message(check_land_hex(r, crs = 4326, coords = c("X", "Y"), FALSE),
                 "Converting `land_hex` to spatial data frame")
  expect_silent(s <- check_land_hex(r, crs = 4326, coords = c("X", "Y"), TRUE))
  expect_s3_class(s, "sf")
  expect_error(check_land_hex(r, crs = NA, NA, FALSE), "`crs` must be a valid")
  expect_error(check_land_hex(r, crs = 4326, NA, FALSE), "`coords` must be names")
  expect_error(check_land_hex(r, crs = 4326, NULL, FALSE), "`coords` must be names")
  expect_error(check_land_hex(r, crs = 4326, c("lat"), FALSE), "`coords` must be names")
  expect_error(check_land_hex(r, crs = 4326, c("lon", "lat"), FALSE), "'lon' not found")
})

test_that("check_land_cover()", {

})

test_that("check_points()", {

})
