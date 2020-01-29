## ----setup, include=F, echo=T-------------------------------------------------
knitr::opts_chunk$set(
  eval=F,
  collapse = TRUE,
  comment = "#>"
)
library(tidyverse)
library(sf)
library(spsurvey)
library(glue)
library(BASSr)
library(raster)
library(rlang)

## ----load-hexes---------------------------------------------------------------
#  test_sa <- c("0322", "0740", "0404","0165","0247","0197")
#  allhexes <- read_rds(glue::glue("{here::here()}/output/NOntario_BASS_hexes.rds"))
#  studyareas <- read_rds(here::here("output/2020-01-24_StudyArea_costs.rds")) %>%
#    filter(grepl(glue_collapse( test_sa,"|"), StudyAreaID)) %>%
#    mutate(r_lg = (pr + sr) >0)
#  # studyareas <-  allhexes$StudyAreas  %>% filter(grepl(glue_collapse( test_sa,"|"), StudyAreaID))
#  samplehexes <- allhexes$SampleUnits %>% filter(grepl(glue_collapse( test_sa,"|"), StudyAreaID)) %>%
#    left_join(dplyr::select(as_tibble(studyareas), r_lg, StudyAreaID))
#  rm(allhexes)
#  
#  # samplehexes1 <- samplehexes %>% filter(StudyAreaID=="ONT_SA_0197")
#  # sa1 <- studyareas %>% filter(StudyAreaID=="ONT_SA_0197")
#  ont.proj <- 3161

## ----load-layers--------------------------------------------------------------
#  
#  
#  airports_official <- st_read("//int.ec.gc.ca/sys/InGEO/GW/EC1130MigBirds_OiseauxMig/ON_CWS/THEMES/BorealApproach/SPATIAL/BASS_AccessLyrs/Airports_Official_FeaturesToPoints.shp") %>% filter(AIRPORT_TY != "Hospital Heliport")%>% st_transform(st_crs(ont.proj))
#  
#  
#  airports_other <- st_read("//int.ec.gc.ca/sys/InGEO/GW/EC1130MigBirds_OiseauxMig/ON_CWS/THEMES/BorealApproach/SPATIAL/BASS_AccessLyrs/Airports_Other_FeaturesToPoints.shp")%>% st_transform(st_crs(ont.proj))
#  
#  tourism <- st_read("//int.ec.gc.ca/sys/InGEO/GW/EC1130MigBirds_OiseauxMig/ON_CWS/THEMES/BorealApproach/SPATIAL/BASS_AccessLyrs/TourismEstablishments_pt.shp")%>% st_transform(st_crs(ont.proj))
#  primary_buffer <- st_read("//int.ec.gc.ca/sys/InGEO/GW/EC1130MigBirds_OiseauxMig/ON_CWS/THEMES/BorealApproach/SANDBOX/dhdev/Primary1000.shp") %>% st_transform(st_crs(studyareas))
#  secondary_buffer <- st_read("//int.ec.gc.ca/sys/InGEO/GW/EC1130MigBirds_OiseauxMig/ON_CWS/THEMES/BorealApproach/SANDBOX/dhdev/SecondaryOnlyBuff1k.shp")%>% st_transform(st_crs(studyareas))
#  road_buffer <- st_read("//int.ec.gc.ca/sys/InGEO/GW/EC1130MigBirds_OiseauxMig/ON_CWS/THEMES/BorealApproach/SANDBOX/dhdev/Roads_1000_PriSec.shp")%>% st_transform(st_crs(studyareas))
#  winter_buff <- st_read("//int.ec.gc.ca/sys/InGEO/GW/EC1130MigBirds_OiseauxMig/ON_CWS/THEMES/BorealApproach/SANDBOX/dhdev/WinterRoads_Buffer1k.shp")%>% st_transform(st_crs(studyareas))
#  habLoc <- "//int.ec.gc.ca/sys/InGEO/GW/EC1130MigBirds_OiseauxMig/ON_CWS/THEMES/BMS_ON/SANDBOX/dhdev/OnBMS/spatial/NontariobrandtLCC2015_reproj.tif"
#  

## ---- eval=F------------------------------------------------------------------
#  
#  sf_list = list(primary_roads = primary_buffer, secondary_roads = secondary_buffer, winter_roads = winter_buff, total_roads = road_buffer, airport_locations = airports_official, camp_locations = tourism)
#  
#  fbr_study_area_test <- map(rev(unique(studyareas$StudyAreaID)),
#                             ~extract_habitat_cost(number_iterations = 100,
#                                                   n_samples_per_iter = 20,
#                                                   sample_hexes = samplehexes,
#                                                   study_area_hexes = studyareas,
#                                                   id = .x, id_col = StudyAreaID,
#                                                   hexid = SampleUnitID,
#                                                   hab_rast_location = habLoc,
#                                                   shape_file_list = sf_list,
#                                                   nARUs = 1,
#                                                   return_all_ = T,
#                                                   quick = T,
#                                                   calc_cost = F,
#                                                   calc_hab = F,
#                                                   load_hexes = T,
#                                                   write_hexes = F))
#  
#  write_rds(fbr_study_area_test, "output/2020-01-28_fbr_studyarea2.rds")
#  
#  

