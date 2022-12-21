test_that("calculate_inclusion_probs()", {

  h <- prepare_hab_long(psu_land_cover, lg_area = province)

  expect_silent(b <- calculate_benefit(grts_res = psu_samples,
                                       att_long = h,
                                       output = "benefit_by_run",
                                       HexID = hex_id,
                                       quick = TRUE))


  expect_silent(inc <- calculate_inclusion_probs(
    cost = psu_costs,
    hexagon_benefits = b,
    HexID = hex_id,
    StratumID = province
  )) %>%
    expect_s3_class(c("sf", "data.frame"))

  expect_equal(nrow(psu_costs), nrow(inc))
  expect_true(all(c("LogCost", "ScLogCost", "scale_ben", "partIP", "weightedIP",
                    "inclpr") %in% names(inc)))
  expect_true(all(inc$ScLogCost >= 0 & inc$ScLogCost < 1))
  expect_true(all(inc$scale_ben >= 0 & inc$scale_ben <= 1))
  expect_true(all(inc$inclpr >= 0 & inc$inclpr <= 1))

  # benefit_weight
  expect_silent(inc2 <- calculate_inclusion_probs(
    cost = psu_costs,
    hexagon_benefits = b,
    HexID = hex_id,
    StratumID = province,
    benefit_weight = 1
  ))

  expect_true(all(inc2$weightedIP > inc$weightedIP))
  expect_true(all(inc2$weightedIP >= inc2$inclpr))
  expect_equal(dplyr::select(inc, -"weightedIP", -"inclpr"),
               dplyr::select(inc2, -"weightedIP", -"inclpr"))


  # Snapshots cannot be tested interactively
  expect_snapshot_value(sf::st_drop_geometry(inc), style = "json2",
                        tolerance = 0.0001)
})

