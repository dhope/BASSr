## ----setup, eval=T------------------------------------------------------------
knitr::opts_chunk$set(eval=F)

library(tidyverse)
library(sf)
library(spsurvey)
library(glue)


## -----------------------------------------------------------------------------
#  ont.proj <- 3161  # Recommened MNR projection for Ontario
#  ecoregions <- read_sf("//int.ec.gc.ca/Shares/C/CWS_ON/Shared_Data/Base_Data/Natural_Frameworks/NationalEcolFramework/eco_reg_join.shp") %>%
#    st_transform(ont.proj, partial = F, check = T,)
#  
#  OntBrant <- read_rds(system.file("extdata",package = "BASS", "ontario_brandt.rds")) # From the BMS Ontario scripts
#  BrantBUFFER <- OntBrant %>% st_buffer(dist = 50000)
#  
#  A = 100000
#  
#  
#  calculate_cellsize <- function(area_ha){2* (sqrt(2*area_ha/(3*sqrt(3)))) * sqrt(3)/2 * 100}
#  
#  

## -----------------------------------------------------------------------------
#  
#  # StudyAreas_Pts <- spsample(as(BrantBUFFER, "Spatial"), type = "hexagonal", cellsize =  z_SA3, offset = c(0,0))
#  StudyAreas <- st_make_grid(BrantBUFFER, cellsize = calculate_cellsize(100000),
#                             square = F, what = 'polygons', offset = c(0,0)) %>%
#    st_as_sf() %>% filter(lengths(st_intersects(.,OntBrant))>0) %>%
#    mutate(StudyAreaID = glue("ONT_SA_{str_pad(1:nrow(.), width = 4, pad = 0)}"))
#  
#  # StudyAreas <- HexPoints2SpatialPolygons(StudyAreas_Pts) %>%
#  #   st_as_sf() %>% filter(lengths(st_intersects(.,OntBrant))>0) %>%
#  #   mutate(StudyAreaID = glue("ONT_SA_{str_pad(1:nrow(.), width = 4, pad = 0)}"))
#  
#  plot(BrantBUFFER, col = 'red')
#  
#  plot(StudyAreas, add=T, col='blue')
#  plot(OntBrant, add=T)
#  

## -----------------------------------------------------------------------------
#  plot(StudyAreas["StudyAreaID"])

## ---- eval=F------------------------------------------------------------------
#  sample_units_pts <- spsample(as(BrantBUFFER, "Spatial"), type = "hexagonal", cellsize =  calculate_cellsize(100),
#                               offset = c(0,0))
#  
#  sample_StudyArea <- sample_units_pts %>% st_as_sf() %>%
#    st_join(y=StudyAreas, join = st_intersects)
#    # mutate(SampleUnitID = glue("ONT_Hex_{str_pad(1:nrow(.), width = 7, pad = 0)}"))
#  
#   SampleHexes <- HexPoints2SpatialPolygons(sample_units_pts) %>%
#    st_as_sf() %>% filter(lengths(st_intersects(.,StudyAreas))>0) %>%
#    mutate(SampleUnitID = glue("ONT_Hex_{str_pad(1:nrow(.), width = 7, pad = 0)}")) %>%
#     st_join(y = sample_StudyArea, join = st_contains)
#  
#  write_rds(list(StudyAreas = StudyAreas,SampleUnits =  SampleHexes ), "output/NOntario_BASS_hexes.rds")
#  
#  st_write(SampleHexes,"output/NOntario_BASS_SampleUnits.shp", delete_dsn = T)
#  st_write(StudyAreas,"output/NOntario_BASS_StudyAreas.shp", delete_dsn = T)
#  # st_write(StudyAreas_SF,"output/NOntario_BASS_StudyAreas4sf.shp",, delete_dsn = T)
#  # st_write(st_as_sf(StudyAreas_Pts),"output/NOntario_BASS_StudyAreaspoints3.shp", delete_dsn = T)
#  
#  

## -----------------------------------------------------------------------------
#  plot(OntBrant)
#  plot(StudyAreas,col='white' )
#  plot(SampleHexes %>% sample_n(5000), add=F, col='blue')
#  plot(OntBrant,add=T)
#  

## -----------------------------------------------------------------------------
#  test_SA <- StudyAreas %>% sample_n(1)
#  test_SA_hexes <- filter(.data = SampleHexes, StudyAreaID == test_SA[["StudyAreaID"]])
#  
#  plot(test_SA_hexes['SampleUnitID'])
#  

