#' Full BASSr run with sample selection
#'
#' Running this function will run BASS on both study areas and sample units within those study areas.
#' It will return a selection of sample units with associated costs and habitats.
#'
#' @param study_areas_hab_cost A list of study area hexagons, costs, and habitat characteristics. See naming above.
#' @param Number_of_Study_areas Number of Study Areas to select
#' @param Number_of_sample_units Number of Sample Units to select
#' @param Size_of_HSS Size of they Hypothetical Sample Set
#' @param Number_of_HSS Number of iterations in the hypothetical sample set
#' @param Weight_of_benfit Weight of benefit in selection probabilties.
#' @param LandCoverType String with identifer for both the land cover hexagons and their code within that tibble
#' @param RemovedLayers_ Layers to remove from benefit calculation must be in format of c(-var1, -var2, -var3)
#' @param Area_of_interest Area of interest in tibble with StudyAreaID
#' @param RandomSeed Random seet to use in GRTS
#' @param calculate_benefits Should you calculate benefits or are they included in benefit_df
#' @param only_calculate_benefits Do you only want to calculate benefits or complete the full run
#' @param benefit_dfs If calculate_benefits is TRUE need some data.frames with benefits.
#' @param returnALL do you return the GRTS object, as well as the selection probs. (Can be used later to calculate spatial balance)
#' @param oversample Proportion of sites to oversample, used for both study areas and sample units
#' @param weighted_benefits_df list of data frames with weight and land covers for benefit calculation
#' @param Non random set of study areas and sample units in form of named list.
#'
#' @return List of sample units and a summary comparing land cover to the local area
#'
#' @name run_full_BASS_w_selection-defunct
NULL

#' @rdname BASSr-defunct
#' @export
run_full_BASS_w_selection <- function(
                                      # study_areas_hab_cost,
                                      # sample_units_w_hab,
                                      # Number_of_Study_areas,
                                      # Number_of_sample_units,
                                      # Size_of_HSS,
                                      # Number_of_HSS,
                                      # Weight_of_benefit,
                                      # LandCoverType,
                                      # RemovedLayers_,
                                      # Area_of_interest,
                                      # RandomSeed,
                                      # calculate_benefits = list(SA = F, SU = F),
                                      # only_calculate_benefits = list(SA = F, SU = F),
                                      # benefit_dfs = list(SA = NULL, SU = NULL),
                                      # returnALL = F,
                                      # oversample = 0,
                                      # weighted_benefits_df = list(SA = NULL, SU=NULL),
                                      # non_ran = list(SA = NULL, SU=NULL),
                                      # Stratum = Province
  ) {
  .Defunct(msg = "Use full_BASS_run() and run_grts_on_BASS() workflow instead")
#
#
#   start_time1 <- start_time <- Sys.time()
#   # Define layers to remove
#   slvar <- enquos(RemovedLayers_)
#   # RemovedLayers <- function(x) dplyr::select(x, !!!slvar)
#
#   # Study Area hexagons in region of interest
#
#
#   # Prepeare study area table with habitat.
#   att_prep <- study_areas_hab_cost[[LandCoverType]] %>%
#     dplyr::select(!!!slvar) %>%
#     filter(StudyAreaID %in% Area_of_interest$StudyAreaID) %>%
#     BASSr::clean_forBass(., LandCoverType, f_vec = Area_of_interest$StudyAreaID) %>%
#     mutate(Province = "ON")  # %>% left_join(st_drop_geometry(sa_centroids))
#
#
#   # Add table to sf hexagon object
#   study_areas_local <- study_areas_hab_cost$StudyAreas %>%
#     filter(StudyAreaID %in% Area_of_interest$StudyAreaID) %>%
#     left_join(att_prep) %>%
#     {
#       if("x" %in% names(.)) {
#       rename(.,geometry = x)
#     } else{.}}
#
#
#   # Recalculate the cost of deployment based on the number of ARUs per study area.
#   # {browser()}
#   local_cost <- estimate_cost_study_area(
#     narus = Number_of_sample_units,
#     StudyAreas = study_areas_hab_cost$StudyArea_cost_30arus %>%
#       filter(StudyAreaID %in% Area_of_interest$StudyAreaID),
#     pr = p_pr, sr = p_sr,AirportType = airporttype,
#     dist_base_sa = basecamps, dist_airport_sa = airportdist_km,
#     dist2airport_base = cabin_dist_to_air, vars = cost_vars
#   ) %>%
#     right_join(x = study_areas_hab_cost$StudyAreas) %>%
#     rename(geometry = x) %>%
#     st_centroid() %>%
#     mutate(Province = "ON")   ## TO FIX: ADD STRATUM DETAILS HERE
#
#     if(LandCoverType=="CLC10") watervar <- c(18,19)
#     if(LandCoverType=="CLC15") watervar <- c(19,18)
#     if(LandCoverType=="FNLC") watervar <-  c(1,2,3)
#     inlake <- filter_at(att_prep,vars(matches("^D_.+")), any_vars(.%in% watervar ))
#
#     local_cost <- mutate(local_cost, INLAKE = StudyAreaID %in% inlake$StudyAreaID) %>%
#       bind_cols(as_tibble(
#         st_coordinates(.)))
#
#   # WARNING --- PROVINCE IS CURRENTLY USED AS A FILLER TO MAKE BASS FUNCTION WORK. NEED TO CORRECT THIS IN FUNCTION AS FUNCTION SHOULD
#   # BE EXPANDED TO ALLOW FOR STRATIFICATION.
#
#
#   if(isTRUE(calculate_benefits$SA)){
#
#   bass_res <- full_BASS_run(
#     num_runs = Number_of_HSS, nsamples = Size_of_HSS,
#     att = att_prep, att.sp = st_centroid(study_areas_local),
#     cost = local_cost, return_all = T, benefit_weight = Weight_of_benefit,
#     seed_ = RandomSeed, HexID_ = StudyAreaID, stratumID = Province, q = T,
#     weighted_benefits = weighted_benefits_df$SA, non_ran_set = non_ran$SA
#   )
#
#   message(glue::glue("Running BASS on SA took {difftime(Sys.time(),start_time, units = 'mins')} minutes"))
#   start_time <- Sys.time()
#
#   bass_res$inclusionPr$Province <- "ON"
#   } else{
#     # browser()
#     bass_res <- calculate_inclusion_probs(cost = local_cost,
#                                                       hexagon_benefits = benefit_dfs$SA,
#                                                       HexID = StudyAreaID,
#                                                       StratumID = {{Stratum}},
#                                                       benefit_weight = Weight_of_benefit )
#     # browser()
#   }
#     # browser()
#   StudyAreas_Selected <- run_grts_on_BASS(
#     n_grts_tests = 1,
#     study_area_results = bass_res,
#     nARUs = Number_of_Study_areas, os = oversample,
#     idcol = as_label(enquo(Stratum)),
#     hexid = StudyAreaID,Stratum = Stratum
#   )
# start_time <- Sys.time()
#   # Selected Study Areas
#   StudyAreasIDs_select <- tibble(StudyAreaID = StudyAreas_Selected[[1]]$StudyAreaID)
#
#   # browser()
#
#   focal_SA <- StudyAreasIDs_select$StudyAreaID # [[1]]
#
#   # Hexagons with Landcover
#   focal_SampleUnits <- sample_units_w_hab$SampleUnits %>%
#     filter(StudyAreaID %in% focal_SA) %>%
#     left_join(sample_units_w_hab[[LandCoverType]], by = c("SampleUnitID", "StudyAreaID")) %>%
#     st_transform(ont.proj) %>%
#     dplyr::select(!!!slvar)
#
#
#   # browser()
#   # Return cost from study area and hexagon access
#   focal_SampleUnits_cost <- sample_units_w_hab$Cost %>%
#     filter(StudyAreaID %in% focal_SA) %>%
#     # mutate(Access = "Helicopter") %>%
#     left_join(st_drop_geometry(st_as_sf(local_cost))) %>%
#     mutate(
#       SACost = RawCost,
#       RawCost = case_when(
#         Access == "Helicopter" ~ total_heli_cost / narus,
#         Access == "Truck" ~ total_truck_cost / narus,
#         Access == "ATV" ~ total_atv_cost / narus,
#         TRUE ~ NA_real_
#       )
#     )
#
#
#   # browser()
#   att_prep_focalSA <- focal_SampleUnits %>%
#     BASSr::clean_forBass(., LandCoverType, id_col = SampleUnitID, f_vec = focal_SampleUnits$SampleUnitID) %>%
#     # dplyr::select(!!!slvar) %>%
#     mutate(Province = "ON") %>%
#     st_centroid %>% bind_cols(as_tibble(st_coordinates(.))) %>% st_as_sf
#
#   inlake <- filter_at(att_prep_focalSA,vars(matches("^D_.+")), any_vars(.%in% watervar ))
#
#   focal_SampleUnits_cost <- mutate(focal_SampleUnits_cost, INLAKE = SampleUnitID %in% inlake$SampleUnitID) %>%
#     left_join(bind_cols(
#       dplyr::select(st_drop_geometry(att_prep_focalSA), SampleUnitID),
#       as_tibble(    st_coordinates(att_prep_focalSA))), by = "SampleUnitID")
#
#   if("X.y" %in% names(focal_SampleUnits_cost)){
#     focal_SampleUnits_cost <- focal_SampleUnits_cost %>% rename(X = X.y, Y = Y.y, X_SA = X.x, Y_SA = Y.x)
#   }
#
#   if(isTRUE(calculate_benefits$SU)){
#   bass_res_focalSA <- map(
#     unique(att_prep_focalSA$StudyAreaID),
#     ~ full_BASS_run(
#       num_runs = Number_of_HSS,
#       nsamples = Size_of_HSS, benefit_weight = Weight_of_benefit,
#       att = st_drop_geometry(att_prep_focalSA %>% filter(StudyAreaID == .x)),
#       att.sp = att_prep_focalSA %>% filter(StudyAreaID == .x),
#       cost = st_centroid(focal_SampleUnits_cost %>% filter(StudyAreaID == .x)), return_all = T,
#       seed_ = RandomSeed, HexID_ = SampleUnitID, stratumID = StudyAreaID, q = T,
#       weighted_benefits = weighted_benefits_df$SU, non_ran_set = non_ran$SU
#     )
#   )
#
#   message(glue::glue("Running BASS on SUs took {difftime(Sys.time(),start_time, units = 'mins')} minutes"))
#   start_time <- Sys.time()
#
#   pt <- bass_res_focalSA %>% purrr::transpose() %>%
#     .[["inclusionPr"]] %>%
#     bind_rows() %>%
#     mutate(StudyAreaID = as.character(StudyAreaID), SampleUnitID = as.character(SampleUnitID),geometry = "Trash")
#
#
#   } else{
#     # pt <- purrr::map_df(
#     #   unique(att_prep_focalSA$StudyAreaID),
#     #   ~ calculate_inclusion_probs(cost = st_centroid(focal_SampleUnits_cost %>% filter(StudyAreaID == .x)),
#     #                                       hexagon_benefits = benefit_dfs$SU %>% filter(StudyAreaID == .x),
#     #                                       HexID = SampleUnitID,
#     #                                       StratumID = StudyAreaID,
#     #                                       benefit_weight = Weight_of_benefit ) )
#     pt <- calculate_inclusion_probs(cost = st_centroid(focal_SampleUnits_cost),
#                                   hexagon_benefits = benefit_dfs$SU,
#                                   HexID = SampleUnitID,
#                                   StratumID = StudyAreaID,
#                                   benefit_weight = Weight_of_benefit )
#   }
#
#
#   FocalSA_SampleUnits <- run_grts_on_BASS(n_grts_tests = 1,
#                                           study_area_results =pt,
#                                           nARUs = Number_of_sample_units, os = oversample,
#                                           idcol = "StudyAreaID",
#                                           hexid = SampleUnitID)
#   SampleUnitsIDs_select <-
#       tibble(SampleUnitID = FocalSA_SampleUnits[[1]]$SampleUnitID)
#
#   os_SA <- as_tibble(StudyAreas_Selected[[1]]) %>% dplyr::select(StudyAreaID, SA_oversample = panel) %>%
#     mutate_all(.funs = as.character)
#   os_SU <- as_tibble(FocalSA_SampleUnits[[1]]) %>% dplyr::select(StudyAreaID=stratum,SampleUnitID, SU_oversample = panel) %>%
#     mutate_all(.funs = as.character)
#   sampleUnits_final <- right_join(sample_units_w_hab$SampleUnits, SampleUnitsIDs_select)  %>%
#     # filter(SampleUnitID %in% FocalSA_SampleUnits[[1]]$SampleUnitID) %>%
#     left_join(st_drop_geometry(focal_SampleUnits_cost)) %>%
#     left_join(st_drop_geometry(att_prep_focalSA)) %>% mutate(ranNum = RandomSeed) %>%
#     left_join(os_SA,by = "StudyAreaID") %>% left_join(os_SU, by = c("StudyAreaID","SampleUnitID"))
#
#   # browser()
#   # Generate a summary table
#
#
#   tab_presLC <- sampleUnits_final %>% st_drop_geometry() %>%
#     group_by(SampleUnitID) %>%
#     dplyr::select(matches(r"(^LC\d)")) %>% ungroup %>%
#     pivot_longer(names_to = "lc", values_to = "ha", cols = matches(r"(^LC\d)")) %>% filter(ha>0) %>%
#     mutate(pres = 1, pres_w = ifelse(ha>=10, 1,0)) %>%
#     group_by(lc) %>% summarize(sumHA = sum(ha), n_present = sum(pres), sumPres10 = sum(pres_w)) #%>% left_join(local_pres_LC, by = 'lc')
#
#
#   compare_table <- sampleUnits_final %>% st_drop_geometry() %>%
#     # group_by(run) %>%
#     dplyr::select(matches(r"(^LC\d)")) %>% summarise_all(sum) %>%
#     pivot_longer(names_to = "lc", values_to = "ha", cols = matches(r"(^LC\d)")) %>% #everything()) %>%
#     # group_by(run) %>%
#     mutate(phab = ha/sum(ha)) %>% ungroup %>%
#     mutate(nSU = Number_of_sample_units,
#            RNum = RandomSeed) %>%
#     {
#       if(as_label(enquo(Stratum)) == "None"){mutate(., nSA = Number_of_Study_areas)} else{
#         mutate(., nSA = sum(Number_of_Study_areas$N))
#       }
#     } %>%
#
#     # left_join(x= local_hab_summ, y =., by = 'lc') %>%
#     left_join(tab_presLC, by = 'lc')
#
#   if(as_label(enquo(Stratum)) == "None"){
#   message(glue::glue("Completed run generating {Number_of_sample_units} sample units in {Number_of_Study_areas} study areas.\n\r
#                      It took {difftime(Sys.time(),start_time1, units = 'mins')} minutes")) }
#   else{ message(glue::glue("Completed run generating {Number_of_sample_units} sample units in {sum(Number_of_Study_areas$N)} study areas.\n\r
#                      It took {difftime(Sys.time(),start_time1, units = 'mins')} minutes"))}
#   if(isTRUE(returnALL)){
#   return(list(SampleUnits = st_drop_geometry(sampleUnits_final),grts_results = list(SA = StudyAreas_Selected,SU = FocalSA_SampleUnits[[1]]),
#          summary = compare_table,SA_inclpr = bass_res, SU_inclpr = pt ))
#   }
#
#   return(list(SampleUnits = st_drop_geometry(sampleUnits_final),summary = compare_table))
#
#

}
