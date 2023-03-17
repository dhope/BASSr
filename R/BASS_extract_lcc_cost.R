## Functions to extract data for a study area

#' Extract Habitat and Cost
#'
#' @param number_iterations Number of iterations to draw samples from full GRTS
#' @param n_samples_per_iter Number of samples to pull per iteration
#' @param sample_hexes Sample hexagon file
#' @param study_area_hexes Study area hexagon files
#' @param id Id of the study area of interest
#' @param id_col Column identifying study area
#' @param hab_rast_location Location of raster for habitat
#' @param shape_file_list named list of shapefiles used in cost calculation. The current iteration must include the following names:
#' \describe{
#'     \item{primary_roads}{sf polygon with primary roads buffer}
#'     \item{secondary_roads}{sf polygon with atv roads buffer}
#'     \item{winter_roads}{ sf polygon with winter roads buffer}
#'     \item{total_roads}{ sf polygon with all roads buffer}
#'     \item{airport_locations}{ sf points with airport locations}
#'     \item{camp_locations}{ sf points with camp locations}
#'     }
#' @param return_all_ Logical to return a full results or just the inclusion probabilities
#' @param nARUs number of ARUs to deploy
#' @param hexid_col hexagon identification column
#' @param calc_cost Logical - calculate cost
#' @param calc_hab Logical - calculate habitat
#' @param write_hexes Logical - write hexagons
#' @param load_hexes Logical load hexagons
#' @param rds.loc RDS location
#' @param sa.rast.loc Study area location
#' @param quick Run using cpp
#'
#'
#' @name extract_habitat_cost-deprecated
NULL

#' @rdname BASSr-deprecated
#' @export
extract_habitat_cost <- function(number_iterations,
                                 n_samples_per_iter, sample_hexes,
                                 study_area_hexes, id, id_col,
                                 hab_rast_location,
                                 shape_file_list,
                                 return_all_,
                                 nARUs = 30,
                                 hexid_col = SampleUnitID,
                                 calc_cost = F, calc_hab = F,
                                 write_hexes = F, load_hexes = T,
                                 rds.loc = "output", sa.rast.loc = "output",
                                 quick = T) {

  .Deprecated(msg = "This function is depreciated and not recommended as it may contain non-generalizable routines.")


  message(glue::glue("Starting {id}"))

  if (isTRUE(load_hexes) & file.exists(glue::glue("{rds.loc}/studyArea_{id}_BassPrep.rds"))) {
    put_a_hex_on_u <- read_rds(glue::glue("{rds.loc}/studyArea_{id}_BassPrep.rds"))
    message("Loading hexes")
    with(put_a_hex_on_u, {
      cost ->> study_hexes_cost
      landcover ->> sample_hexes_lcc
      study_area ->> id
    })
    samplehexes1 <- sample_hexes %>% filter({{ id_col }} == id)
  }

  if (!isTRUE(load_hexes) | isTRUE(calc_hab)) {
    if (!file.exists(glue::glue("{sa.rast.loc}/{id}.tif"))) {
      message("Generating Raster!")
      genraster(
        id_col = StudyAreaID, studyareas = study_area_hexes, hab_rast_location = hab_rast_location,
        id = id, outpath = sa.rast.loc, writeout = T
      )
    } else {
      message("Raster exists, not generating")
    }


    samplehexes1 <- sample_hexes %>% filter({{ id_col }} == id)
    sa1 <- study_area_hexes %>% filter({{ id_col }} == id)
    sa1_lcc <- raster(glue::glue(glue::glue("{sa.rast.loc}/{id}.tif")))

    f_ <- function(x, ...) {
      d <- as_tibble(x)
      if (length(d) != 1) {
        return(NA)
      }
      names(d) <- "value"
      # print(head(d))
      d %>%
        mutate(t = n()) %>%
        group_by(
          value, t
          # {{idcol}}
        ) %>%
        summarize(n = n()) %>%
        ungroup() %>%
        # rename(value = {{idcol}}) %>%
        mutate(
          p = n / t,
          id = as.character(glue::glue("LC{str_pad(value,2, pad=0)}"))
        ) %>%
        dplyr::select(id, p) %>%
        pivot_wider(
          names_from = id,
          values_from = p
        )
    }

    sa1_samples_lcc <- raster::extract(sa1_lcc, samplehexes1, fun = f_, df = F, sp = F)
    message("Done first extract")
    study_hexes_lcc2015 <-
      bind_rows(sa1_samples_lcc) %>%
      replace(is.na(.), 0) %>%
      bind_cols(samplehexes1, .) %>%
      mutate(area = units::drop_units(st_area(.) * 0.0001))

    study_hexes_lcc2015_ha <-
      study_hexes_lcc2015 %>%
      mutate_at(vars(matches("LC\\d")), ~ . * area)

    hex_centroids <- st_centroid(study_hexes_lcc2015_ha)

    inlake <- raster::extract(sa1_lcc, hex_centroids)
    hex_centroids$inlake_YN <- ifelse(inlake == 18, TRUE, FALSE)

    sample_hexes_lcc <- study_hexes_lcc2015_ha %>%
      bind_cols(as_tibble(st_coordinates(hex_centroids)))
  }

  if (!isTRUE(load_hexes) | isTRUE(calc_cost)) {
    message("Calculating costs")
    # browser()
    list2env(shape_file_list, envir = environment())
    all_costvars <-
      prepare_cost(
        truck_roads = primary_roads, atv_roads = secondary_roads,
        winter_roads = winter_roads, all_roads = total_roads,
        airports = airport_locations, basecamps = camp_locations,
        hexagons = samplehexes1, idcol_ = {{ hexid_col }}, calc_roads = T
      )
    if (!exists("cost_vars")) cost_vars <- BASSr::cost_vars # data("cost_vars", package = 'BASSr')

    cost_est2 <- estimate_cost_study_area(
      narus = nARUs, StudyAreas = all_costvars,
      pr = p_pr, sr = p_sr, dist_base_sa = basecamps,
      dist_airport_sa = airportdist_km, dist2airport_base = cabin_dist_to_air,
      vars = cost_vars
    )

    if (!("inlake_YN" %in% names(sample_hexes_lcc))) {
      hex_centroids <- st_centroid(sample_hexes_lcc)
      sa1_lcc <- raster(glue::glue(glue::glue("{sa.rast.loc}/{id}.tif")))
      inlake <- raster::extract(sa1_lcc, hex_centroids)
      sample_hexes_lcc$inlake_YN <- ifelse(inlake == 18, TRUE, FALSE)
    }

    inlake_df <- as_tibble(sample_hexes_lcc) %>%
      dplyr::select({{ hexid_col }}, inlake_YN, X, Y)



    study_hexes_cost <- cost_est2 %>%
      left_join(y = inlake_df) %>%
      rename(INLAKE = inlake_YN)
  }
  # sa1_hex_lcc <- raster::extract( sa1_lcc,sa1,fun = f_, df = F, sp =F)
  #   # raster::extract( sa1_lcc,sa1,df=T)#,#fun = f_, df = T, sp =F)
  # study_area_lcc2015 <- sa1_hex_lcc %>%
  #   #sa1_hex_lcc$NontariobrandtLCC2015_reproj %>% f_ %>%
  #   bind_cols(sa1,.)

  # print(glue::glue("Finished Habitat Extraction for {id}"))
  #
  # winter_secondary <- read_sf(primary_roads)
  # primary_roads <-  read_sf(secondary_roads)
  #
  # wr1 <- st_transform(winter_secondary, st_crs(hex_centroids)) %>%
  #   st_intersection(st_buffer(sa1, 10000))
  # pr1 <- st_transform(primary_roads, st_crs(hex_centroids)) %>%
  #   st_intersection(st_buffer(sa1, 10000))
  #
  # sec_road_dist <- st_distance(hex_centroids,wr1,by_element = F ) %>%
  #   apply(.,1,FUN = min, na.rm=T )
  #
  #
  # prim_road_dist <- st_distance(hex_centroids,pr1,by_element = F ) %>%
  #   apply(.,1,FUN = min, na.rm=T )
  #
  #
  # study_hexes_cost <- samplehexes1 %>%
  #   mutate(winter_sec_dist = ifelse(length(sec_road_dist)!=nrow(.),5000,sec_road_dist),
  #          primary_dist = ifelse(length(prim_road_dist)!=nrow(.),5000,prim_road_dist),
  #          RawCost = case_when(
  #            (primary_dist <= 1000)~primary_dist,
  #            (winter_sec_dist<= 1000)~winter_sec_dist *2,
  #            (primary_dist > 1000) ~ 5000,
  #            (winter_sec_dist > 1000) ~ 5000,
  #            TRUE~NA_real_
  #          ),
  #          RawCost = RawCost) %>%
  #   bind_cols(as_tibble(st_coordinates(hex_centroids))) %>%
  #   left_join(as_tibble(hex_centroids) %>% dplyr::select(SampleUnitID, inlake_YN), by = "SampleUnitID") %>%
  #   rename(INLAKE = inlake_YN)



  if (isTRUE(write_hexes)) {
    message("Writing Hexagons")
    write_rds(
      list(cost = study_hexes_cost, landcover = sample_hexes_lcc, study_area = id),
      glue::glue("{rds.loc}/studyArea_{id}_BassPrep.rds")
    )
  }

  message("Running BASS")
  sa_test <- sample_hexes_lcc %>%
    as_tibble() %>%
    select_at(vars(contains("LC"))) %>%
    rowSums()
  # print(unique(sa_test))
  if (all(round(sa_test, 0) == 100) | all(round(sa_test, 0) == 1)) {
    warning("Oops, you input percentages")
    sample_hexes_lcc <-
      sample_hexes_lcc %>%
      mutate_at(vars(matches("LC\\d")), ~ . * area)
  }


  fbr <- full_BASS_run(
    num_runs = number_iterations, nsamples = n_samples_per_iter,
    att = sample_hexes_lcc %>% as.data.frame() %>%
      dplyr::select(-geometry),
    att.sp = st_centroid(sample_hexes_lcc),
    HexID_ = SampleUnitID,
    cost = study_hexes_cost %>%
      as.data.frame() %>% dplyr::select(-geometry), return_all = return_all_, q = quick
  )
  message(glue::glue("Finished {id}"))
  if (isTRUE(return_all_)) {
    # if(isTRUE(quick)){hexes_BASSr <- samplehexes1 %>% left_join(fbr)}
    # else{
    hexes_BASSr <- samplehexes1 %>% left_join(fbr$inclusionPr) # }
    return(list(BASSoutput = fbr, inclusion_probs = hexes_BASSr, cost = study_hexes_cost, landcover = sample_hexes_lcc, study_area = id))
  }

  hexes_BASSr <- samplehexes1 %>% left_join(fbr)
  return(hexes_BASSr)
}


#' Generate Raster
#'
#' @param id_col Column to use
#' @param studyareas Study area list
#' @param id Id of study area to extract
#' @param hab_rast_location Location of habitat file
#' @param writeout Logical - write output
#' @param outpath  Location of output
#'
#' @return
#'
#' @name genraster-deprecated
NULL

#' @rdname BASSr-deprecated
#' @export
genraster <- function(id_col, studyareas, id, hab_rast_location, writeout = T,
                      outpath = "output") {

  .Deprecated()

  hab_raster <- raster::raster(hab_rast_location)
  sa1 <- studyareas %>% dplyr::filter({{ id_col }} == id)
  sa1_lcc <- hab_raster %>%
    raster::crop(., st_buffer(sa1, 1000)) %>%
    raster::mask(st_buffer(sa1, 1000))
  if (isTRUE(writeout)) {
    raster::writeRaster(sa1_lcc, glue::glue("{outpath}/{id}.tif"), prj = T)
    return(NULL)
  }
  return(sa1_lcc)
}
