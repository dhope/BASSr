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

test_that("check_benefits()", {
  b <- calculate_benefit(land_hex = psu_hexagons, samples = psu_samples,
                         hex_id = hex_id, quiet = TRUE)
  expect_silent(check_benefits(b))
  expect_error(check_benefits(sf::st_drop_geometry(b)), "must be output of `calculate_benefit")
  expect_error(check_benefits(b[,-2]), "must be output of `calculate_benefit")
})

test_that("check_crs()", {
  expect_silent(check_crs(4326))
  expect_silent(check_crs(sf::st_crs(psu_hexagons)))
  expect_error(check_crs("test"), "must be a valid Coordinate Reference")
  expect_error(check_crs(0), "must be a valid Coordinate Reference")
})

test_that("check_int()", {
  expect_silent(check_int(1, c(0, 1)))
  expect_silent(check_int(-5, c(-10, -4)))
  expect_error(check_int(0, c(1, 2)), "must be an integer between")
  expect_error(check_int(0.5, c(0, 1)), "must be an integer between")
})

test_that("check_costs()", {
  expect_silent(check_costs(psu_costs, omit_flag = NULL))
  expect_silent(check_costs(psu_costs, omit_flag = water))
  expect_error(check_costs(psu_hexagons), "No `NEAR_DIST` column")
})

test_that("check_lc_names()", {
  expect_silent(check_lc_names(cols = names(psu_hex_dirty)[4:7],
                               pattern = "CLC0013_"))
  expect_error(check_lc_names(cols = character()), "did not match any names")
  expect_error(check_lc_names(cols = names(psu_hex_dirty)[4:7],
                              pattern = "CLC00"),
               "did not match all the land cover preamble")
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
  expect_silent(check_land_cover(psu_hexagons))
  expect_error(check_land_cover(psu_hexagons[, 1:3]), "not formatted correctly")

  p <- psu_hexagons
  p[6, "LC1"] <- NA
  expect_error(check_land_cover(p), "Missing values")
})


test_that("check_samples()", {
  expect_silent(s <- check_samples(psu_samples, psu_hexagons))
  expect_false(inherits(s, "sf"))

  # From wrong data
  s <- draw_random_samples(StudyArea_hexes$landcover, num_runs = 1, n_samples = 1, quiet = TRUE)
  expect_error(check_samples(s, psu_hexagons), "are not a subset of")
})

test_that("check_probs()", {
  b <- calculate_benefit(land_hex = psu_hexagons,
                         samples = psu_samples,
                         hex_id = hex_id, quiet = TRUE)

  inc <- calculate_inclusion_probs(
    benefits = b,
    costs = psu_costs,
    hex_id = hex_id)

  expect_silent(check_probs(inc))
  expect_error(check_probs(sf::st_drop_geometry(inc)), "must be output")
  expect_error(check_probs(dplyr::select(inc, -"inclpr")), "must be output")

})

test_that("check_points()", {
  expect_message(p <- check_points(psu_hexagons), "should be POINTs not POLYGONs")
  expect_silent(check_points(p))

})

test_that("check_non_random_set()", {
  expect_silent(check_non_random_set("SA_09", psu_hexagons$hex_id))
  expect_silent(check_non_random_set(c("SA_09", "SA_10"), psu_hexagons$hex_id))
  expect_error(check_non_random_set("test", psu_hexagons$hex_id),
               "must contain hex ids found in `land_hex`")
})

test_that("check_land_cover_weights()", {

  expect_silent(check_land_cover_weights(
    data.frame(lc = c("LC1", "LC2", "LC3"),
               weights = c(0.3, 0.4, 0.6)),
    land_hex = psu_hexagons))

  expect_warning(check_land_cover_weights(
    data.frame(lc = c("L1", "LC2", "LC3"),
               weights = c(0.3, 0.4, 0.6)),
    land_hex = psu_hexagons), "do not exist in `land_hex`")

  expect_error(check_land_cover_weights(
    data.frame(lcsss = c("L1", "LC2", "LC3"),
               weights = c(0.3, 0.4, 0.6)),
    land_hex = psu_hexagons), "must be a data frame with columns")

  expect_error(check_land_cover_weights(
    list(LC1 = 0.3),
    land_hex = psu_hexagons), "must be a data frame with columns")
})

