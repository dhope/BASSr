
withr::with_seed(1234, {
  nr <-  NLMR::nlm_randomcluster(
    ncol = 300,
    nrow = 300,
    p = 0.4,
    ai = c(0.05, 0.1, 0.15, 0.25, 0.25, 0.5),
    rescale = FALSE)
})

raster::crs(nr) <- 3161

# nr_classified <- landscapetools::util_classify(nr, weighting = rep(1/6, 6))
# landscapetools::show_landscape(nr_classified)
# landscapetools::show_landscape(nr)

bbx <- sf::st_bbox(nr) |>
  sf::st_as_sfc()

add_coords <- function(sf) {
  # Set attributes as constant to avoid sf warnings
  # (cf. https://github.com/r-spatial/sf/issues/406)
  sf <- sf::st_set_agr(sf, "constant") %>%
    sf::st_centroid()

  sf %>%
    sf::st_coordinates() %>%
    dplyr::as_tibble() %>%
    dplyr::bind_cols(sf, .)
}

stars_df <- nr %>%
  stars::st_as_stars() %>%
  sf::st_as_sf()

psu_hexagons <- create_study_area(
  nr, study_area_size = 50, study_unit_size = .5, units = "m", output = 'large') |>
  sf::st_filter(bbx, .predicate = sf::st_covered_by) %>%
  dplyr::mutate(province = "ON") %>%
  dplyr::rename(hex_id = StudyAreaID)

ssu_points <- purrr::map_df(
  1:nrow(psu_hexagons),
  ~ genSSU(psu_hexagons[.x,], spacing = 5, HexID_column = hex_id))%>%
  dplyr::mutate(province = "ON")

usethis::use_data(ssu_points, overwrite = TRUE)

psu_hexagons <- sf::st_join(psu_hexagons, stars_df) %>%
  dplyr::mutate(Area = sf::st_area(.)) |>
  sf::st_drop_geometry() |>
  dplyr::group_by(hex_id, clumps) |>
  dplyr::summarise(Area = sum(Area), .groups = 'drop_last') |>
  dplyr::ungroup() |>
  tidyr::pivot_wider(names_from = clumps, values_from = Area, names_prefix = "LC",
                     values_fill = list(Area = units::set_units(0, "m^2"))) %>%
  dplyr::mutate(province = "ON") %>%
  dplyr::left_join(psu_hexagons, ., by = c("hex_id", "province")) %>%
  sf::st_set_agr("constant") %>%
  sf::st_centroid()
usethis::use_data(psu_hexagons, overwrite = TRUE)

ssu_land_cover <- sf::st_buffer(ssu_points, 2.5) %>%
  st_join(stars_df) %>%
  dplyr::mutate(Area = sf::st_area(.)) |>
  sf::st_drop_geometry() |>
  dplyr::group_by(hex_id, ssuID, clumps) |>
  dplyr::summarise(Area = sum(Area), .groups = 'drop_last') |>
  dplyr::mutate(HexArea = sum(Area)) |>
  dplyr::ungroup() |>
  tidyr::pivot_wider(names_from = clumps, values_from = Area,
                     names_prefix = "LC",
                     values_fill = list(Area = units::set_units(0, "m^2"))) %>%
  dplyr::mutate(province = "ON")
usethis::use_data(ssu_land_cover, overwrite = TRUE)

# Costs ----------------------------------------
withr::with_seed(1234, {
  costs_hex <- psu_hexagons %>%
    sf::st_drop_geometry() %>%
    dplyr::rowwise() %>%
    dplyr::mutate(area = LC1 + LC2 + LC3 + LC4 + LC5 + LC6) %>%
    dplyr::ungroup() %>%
    dplyr::select(hex_id, province, area) %>%
    dplyr::mutate(
      pr = runif(n = dplyr::n(), min = 0, max = 0.9), #' primary road buffer proportion of study area
      sr = runif(n = dplyr::n(), min = 0, max = 0.9-pr), #' secondary road proportion of study area
      wr = runif(n = dplyr::n(), min = 0, max = 0.9-pr-sr), #' winter road proportion of study area
      pr = as.numeric(pr * area),
      sr = as.numeric(sr * area),
      wr = as.numeric(wr * area),
      basecamps = runif(n = dplyr::n(), min = 0, max = 50),
      airportdist_km = runif(n = dplyr::n(), min = 0, max = 200),
      cabin_dist_to_air = runif(n = dplyr::n(), min = 0, max = 200),
      AirportType = c("Highway", "Remote", "Secondary")[runif(n = dplyr::n(), min = 1, max = 3)],
      INLAKE = FALSE
    )
})

psu_costs <- estimate_cost_study_area(narus = 3, costs_hex,
                                      pr, sr, wr,
                                      dist_base_sa = basecamps,
                                      dist_airport_sa = airportdist_km,
                                      dist2airport_base = cabin_dist_to_air,
                                      AirportType = AirportType,
                                      vars = cost_vars)
usethis::use_data(psu_costs, overwrite = TRUE)

withr::with_seed(1234, {
  psu_samples <- draw_random_samples(
    att_sf = psu_hexagons,
    num_runs = 10,
    n_samples = 3)
})
usethis::use_data(psu_samples, overwrite = TRUE)


lobstr::obj_sizes(psu_hexagons, psu_costs, psu_samples,
                  ssu_points)


psu_hex_dirty <- psu_hexagons %>%
  # Bad names
  dplyr::rename_with(~paste0("CLC0013_", stringr::str_remove(., "LC")),
                     starts_with("LC")) %>%
  # Polygons
  sf::st_buffer(dist = 1000)

usethis::use_data(psu_hex_dirty, overwrite = TRUE)


# PSU_for_bass <-
# clean_forBass(land_cover_PSU, s = "LC", id_col = StudyAreaID, f_vec = land_cover_PSU$StudyAreaID)
#
# weights_fnlc <- names(PSU_for_bass)[grepl("LC\\d+",names(PSU_for_bass))] %>%
#   tibble(lc = ., weights = ifelse(.%in% c("LC01","LC02"), 0.25, 1))
#
#
# Benefits_unstratified_fnlc  <-
#   full_BASS_run(num_runs = 50,
#                 nsamples = 6,
#                 att.sp =  sa1 |> left_join(PSU_for_bass),
#                 att = PSU_for_bass,
#                 HexID_ = StudyAreaID,
#                 stratumID = Province,
#                 q = T,seed_ = 5648,
#                 non_ran_set = NULL,
#                 return_all = F,
#                 weighted_benefits = weights_fnlc,
#                 cost = NA_real_,
#                 noCost = T)
#
#
# sel_pr <- calculate_inclusion_probs(hexagon_benefits = Benefits_unstratified_fnlc |>
#                                       mutate(Province = "ON"), HexID = StudyAreaID,
#                                     StratumID = Province, cost = sa1 %>%
#                                       bind_cols(as_tibble(st_coordinates(st_centroid(.)))) |>
#                                       mutate(cost =1, NEAR_DIST = 1000, INLAKE =F))
#
# ggplot(left_join(sa1, Benefits_unstratified_fnlc)) +
#   geom_sf(aes(fill = benefit))
#
#
#
# GRTS_res <- run_grts_on_BASS(1, sel_pr, nARUs = 6,os =  0.5,
#                              idcol = "Province", hexid = StudyAreaID,
#                              Stratum = None
#                              )











