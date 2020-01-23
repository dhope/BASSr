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
#' @param primary_roads location of shp file for primary roads
#' @param secondary_roads location of shp file for secondary roads
#' @param return_all_ Logical to return a full results or just the inclusion probabilities
#' @param quick Run using cpp
#'
#' @return
#' @export
extract_habitat_cost <- function(number_iterations,
                                 n_samples_per_iter, sample_hexes,
                                 study_area_hexes, id, id_col,
                                 hab_rast_location, primary_roads,
                                 secondary_roads, return_all_,
                                 write_hexes =F, load_hexes = T,
                                 rds.loc="output", sa.rast.loc = "output", quick =T) {
  print(glue::glue("Starting {id}"))

  if( isTRUE(load_hexes) &  file.exists(glue::glue("{rds.loc}/studyArea_{id}_BassPrep.rds"))){
    put_a_hex_on_u <- read_rds(glue::glue("{rds.loc}/studyArea_{id}_BassPrep.rds"))
    print("Loading hexes")
    with(put_a_hex_on_u, {
      cost ->> study_hexes_cost
      landcover ->> sample_hexes_lcc
      study_area ->> id})
    samplehexes1 <- sample_hexes %>% filter({{id_col}} == id)
  } else{

  if(!file.exists(glue::glue("{sa.rast.loc}/{id}.tif"))) {
    print("Generating Raster!")
    genraster(id_col = StudyAreaID,studyareas = study_area_hexes,hab_rast_location = hab_rast_location,
              id = id, outpath =  sa.rast.loc,writeout = T)  } else{print("Raster exists, not generating")}


  samplehexes1 <- sample_hexes %>% filter({{id_col}} == id)
  sa1 <- study_area_hexes %>% filter({{id_col}} == id)
  sa1_lcc <- raster(glue::glue(glue::glue("{sa.rast.loc}/{id}.tif")))

  f_ <- function(x,...){
    d <- as_tibble(x)
    if(length(d)!=1){return(NA)}
    names(d) <- "value"
    # print(head(d))
    d %>% mutate(t = n()) %>%
      group_by(
        value, t
        # {{idcol}}
        ) %>%
      summarize(n=n()) %>%
      ungroup %>%
      # rename(value = {{idcol}}) %>%
      mutate(p = n/t,
             id = as.character( glue::glue("LC{str_pad(value,2, pad=0)}")) )%>%
      dplyr::select(id, p) %>%
      pivot_wider(names_from = id,
                  values_from = p)
  }

  sa1_samples_lcc <- raster::extract( sa1_lcc,samplehexes1,fun = f_, df = F, sp =F)
  print("Done first extract")
  study_hexes_lcc2015 <-
    bind_rows(sa1_samples_lcc) %>% replace(is.na(.),0) %>%
    bind_cols(samplehexes1,.) %>%
    mutate(area = units::drop_units(st_area(.)*0.0001))

  study_hexes_lcc2015_ha <-
    study_hexes_lcc2015 %>%
    mutate_at(vars(matches("LC\\d")) , ~.*area)

  hex_centroids <- st_centroid(study_hexes_lcc2015_ha)

  inlake <- raster::extract(sa1_lcc, hex_centroids)
  hex_centroids$inlake_YN <- ifelse(inlake == 18, TRUE, FALSE)

  # sa1_hex_lcc <- raster::extract( sa1_lcc,sa1,fun = f_, df = F, sp =F)
  #   # raster::extract( sa1_lcc,sa1,df=T)#,#fun = f_, df = T, sp =F)
  # study_area_lcc2015 <- sa1_hex_lcc %>%
  #   #sa1_hex_lcc$NontariobrandtLCC2015_reproj %>% f_ %>%
  #   bind_cols(sa1,.)

  print(glue::glue("Finished Habitat Extraction for {id}"))

  winter_secondary <- read_sf(primary_roads)
  primary_roads <-  read_sf(secondary_roads)

  wr1 <- st_transform(winter_secondary, st_crs(hex_centroids)) %>%
    st_intersection(st_buffer(sa1, 10000))
  pr1 <- st_transform(primary_roads, st_crs(hex_centroids)) %>%
    st_intersection(st_buffer(sa1, 10000))

  sec_road_dist <- st_distance(hex_centroids,wr1,by_element = F ) %>%
    apply(.,1,FUN = min, na.rm=T )


  prim_road_dist <- st_distance(hex_centroids,pr1,by_element = F ) %>%
    apply(.,1,FUN = min, na.rm=T )


  study_hexes_cost <- samplehexes1 %>%
    mutate(winter_sec_dist = ifelse(length(sec_road_dist)!=nrow(.),5000,sec_road_dist),
           primary_dist = ifelse(length(prim_road_dist)!=nrow(.),5000,prim_road_dist),
           RawCost = case_when(
             (primary_dist <= 1000)~primary_dist,
             (winter_sec_dist<= 1000)~winter_sec_dist *2,
             (primary_dist > 1000) ~ 5000,
             (winter_sec_dist > 1000) ~ 5000,
             TRUE~NA_real_
           ),
           RawCost = RawCost) %>%
    bind_cols(as_tibble(st_coordinates(hex_centroids))) %>%
    left_join(as_tibble(hex_centroids) %>% dplyr::select(SampleUnitID, inlake_YN), by = "SampleUnitID") %>%
    rename(INLAKE = inlake_YN)



  sample_hexes_lcc <- study_hexes_lcc2015_ha %>%
    bind_cols(as_tibble(st_coordinates(hex_centroids)))

  if(isTRUE(write_hexes)){
    write_rds(list( cost = study_hexes_cost, landcover = sample_hexes_lcc, study_area = id),
              glue::glue("{rds.loc}/studyArea_{id}_BassPrep.rds"))
  }
  }

  fbr <- full_BASS_run(num_runs = number_iterations ,nsamples =  n_samples_per_iter,
                       att = sample_hexes_lcc %>% as.data.frame() %>%
                         dplyr::select(-geometry),
                       att.sp = st_centroid(sample_hexes_lcc),
                       HexID_ = SampleUnitID,
                       cost = study_hexes_cost %>%
                         as.data.frame() %>% dplyr::select(-geometry), return_all = return_all_, q = quick)
  print(glue::glue("Finished {id}"))
  if(isTRUE(return_all_)) {
    # if(isTRUE(quick)){hexes_BASSr <- samplehexes1 %>% left_join(fbr)}
    # else{
      hexes_BASSr <- samplehexes1 %>% left_join(fbr$inclusionPr) #}
    return(list(BASSoutput = fbr, inclusion_probs = hexes_BASSr, cost = study_hexes_cost, landcover = sample_hexes_lcc, study_area = id))
  }

  hexes_BASSr <- samplehexes1 %>% left_join(fbr)
  return(hexes_BASSr)




}


#' Generatate Raster
#'
#' @param id_col Column to use
#' @param studyareas Study area list
#' @param id Id of study area to extract
#' @param hab_rast_location Location of habitat file
#' @param writeout Logical - write output
#' @param outpath  Location of output
#'
#' @return
#' @export
genraster <- function(id_col,studyareas, id, hab_rast_location, writeout = T, outpath = "output") {
  hab_raster <- raster::raster(hab_rast_location)
  sa1 <- studyareas %>% dplyr::filter({{id_col}} == id)
  sa1_lcc <- hab_raster %>% raster::crop(.,st_buffer(sa1, 1000)) %>% raster::mask(st_buffer(sa1, 1000))
  if(isTRUE(writeout)) {raster::writeRaster(sa1_lcc,glue::glue("{outpath}/{id}.tif"),prj=T)
    return(NULL)}
  return(sa1_lcc)
}

