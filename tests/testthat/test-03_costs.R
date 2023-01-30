test_that("calculate_inclusion_probs()", {

  expect_silent(b <- calculate_benefit(samples = psu_samples,
                                       att_sf = psu_hexagons,
                                       hex_id = hex_id,
                                       quiet = TRUE))


  expect_silent(inc <- calculate_inclusion_probs(
    benefits = b,
    costs = psu_costs,
    hex_id = hex_id
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
    benefits = b,
    costs = psu_costs,
    hex_id = hex_id,
    benefit_weight = 1
  ))

  expect_true(all(inc2$weightedIP > inc$weightedIP))
  expect_true(all(inc2$weightedIP >= inc2$inclpr))
  expect_equal(dplyr::select(inc, -"weightedIP", -"inclpr"),
               dplyr::select(inc2, -"weightedIP", -"inclpr"))

  # INLAKE
  psu_costs$INLAKE[10:12] <- TRUE
  expect_silent(inc3 <- calculate_inclusion_probs(
    benefits = b,
    costs = psu_costs,
    omit = INLAKE,
    hex_id = hex_id
  ))

  expect_equal(sum(is.na(inc3$RawCost)), sum(psu_costs$INLAKE))
  expect_equal(sum(is.na(inc3$LogCost)), sum(psu_costs$INLAKE))
  expect_equal(sum(is.na(inc3$ScLogCost)), sum(psu_costs$INLAKE))
  expect_equal(sum(is.na(inc3$partIP)), sum(psu_costs$INLAKE))
  expect_equal(sum(is.na(inc3$weightedIP)), sum(psu_costs$INLAKE))
  expect_equal(sum(is.na(inc3$inclpr)), sum(psu_costs$INLAKE))

  # stratum_id
  expect_silent(inc4 <- calculate_inclusion_probs(
    benefits = b,
    costs = psu_costs,
    hex_id = hex_id,
    stratum_id = province
  ))

  expect_equal(inc, dplyr::select(inc4, -"province"))


  # Snapshots cannot be tested interactively
  expect_snapshot_value(sf::st_drop_geometry(inc), style = "json2",
                        tolerance = 0.0001)
})

