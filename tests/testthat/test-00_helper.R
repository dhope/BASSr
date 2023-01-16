test_that("clean_forBass()", {

  # Get dirty LC
  dirty <- dplyr::rename_with(
    psu_land_cover, .fn = ~paste0("CLC", .), .cols = dplyr::starts_with("LC"))


  expect_silent(clean <- clean_forBass(dirty, s = "CLCLC", id_col = hex_id))
  expect_s3_class(clean, "data.frame")
  expect_true("LC01" %in% names(clean))
  expect_equal(nrow(clean), nrow(dirty))


  expect_silent(clean <- clean_forBass(dirty, s = "CLCLC", id_col = hex_id,
                                       f_vec = c("SA_0009")))
  expect_s3_class(clean, "data.frame")
  expect_true("LC01" %in% names(clean))
  expect_equal(nrow(clean), 1)


  expect_silent(clean <- clean_forBass(dirty, s = "CLCLC", id_col = hex_id,
                                       append = "a"))
  expect_s3_class(clean, "data.frame")
  expect_true("LC01a" %in% names(clean))
  expect_equal(nrow(clean), nrow(dirty))

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
