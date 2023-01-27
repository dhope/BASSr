test_that("clean_forBass()", {

  # No match
  expect_error(clean <- clean_forBass(psu_hex_dirty, pattern = "CLC0013_LC"),
               "did not match")
  # Helpful
  expect_error(clean <- clean_forBass(psu_hex_dirty, pattern = "CLC"),
               "Consider using 'CLC0013_' instead")

  # Clean
  expect_message(clean <- clean_forBass(psu_hex_dirty, pattern = "CLC0013_"),
                 "Renaming land cover columns") %>%
    expect_message("should be POINTs not POLYGONs")
  expect_s3_class(clean, "data.frame")
  expect_true("LC01" %in% names(clean))
  expect_equal(nrow(clean), nrow(psu_hex_dirty))
  expect_true(all(sf::st_geometry_type(clean) == "POINT"))

  # Append
  expect_message(clean <- clean_forBass(psu_hex_dirty, pattern = "CLC0013_",
                                        append = "a")) %>%
    suppressMessages()
  expect_s3_class(clean, "data.frame")
  expect_true("LC01a" %in% names(clean))
  expect_equal(nrow(clean), nrow(psu_hex_dirty))
})

test_that("estimate_cost_study_area()", {

  hex <- dplyr::select(psu_costs, 1:INLAKE)

  expect_silent(costs <- estimate_cost_study_area(
    narus = 3, hex,
    pr, sr, wr,
    dist_base_sa = basecamps,
    dist_airport_sa = airportdist_km,
    dist2airport_base = cabin_dist_to_air,
    AirportType = AirportType,
    vars = cost_vars))

  expect_s3_class(costs, "sf")
  expect_named(costs,
               c(names(hex), "AT", "lCost", "primary_cost", "atv_cost",
                 "heli_cost_per_l", "cost_base", "cost_to_SA", "cost_within_SA",
                 "total_truck_cost", "total_atv_cost", "total_winter_cost",
                 "p_heli", "total_heli_cost", "narus", "RawCost"),
               ignore.order = TRUE)

  expect_snapshot_value(costs, style = "json2", tolerance = 0.0004)
})


test_that("create_study_area()", {
  nr <-  NLMR::nlm_randomcluster(
    ncol = 30,
    nrow = 30,
    p = 0.4,
    ai = c(0.05, 0.1, 0.15, 0.25, 0.25, 0.5),
    rescale = FALSE)

  l <- sf::st_sfc(sf::st_polygon(list(cbind(c(0,3,3,0,0),c(0,0,3,3,0)))))

  create_study_area(l, study_area_size = 10, study_unit_size = 1, units = "m")


})
