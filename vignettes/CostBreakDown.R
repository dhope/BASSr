## ----setup, include=F, echo=T-------------------------------------------------
knitr::opts_chunk$set(
  eval=T,
  collapse = TRUE,
  fig.width = 8,
  fig.height = 8,
  comment = "#>"
)
library(tidyverse)
library(sf)
library(spsurvey)
library(glue)
library(BASSr)
library(raster)
library(rlang)
library(patchwork)
spatialworks <- "//int.ec.gc.ca/sys/InGEO/GW/EC1130MigBirds_OiseauxMig/ON_CWS/THEMES/BorealApproach/SPATIAL/BaldwinHexLandCov/Data/ExportedDataTables"

bcv <- BASSr::cost_vars

StudyArea_cost_30arus <-
  read_rds(here::here("output/2020-02-05_StudyAreaCost.rds"))$StudyArea_CostModel %>%
  as_tibble %>% dplyr::select(-geometry)

## -----------------------------------------------------------------------------
maxARUs <- 200
 d_heli <- tibble(StudyAreaID  = "Helicopter", 
        pr= 0,
        sr = 0,
        dist_base_sa = 100,
        dist_dist_airport_sa = 250,
        dsit2airport_base = 200
        )
runcost <- function(n,d) {map_df(1:n, estimate_cost_study_area,
                                   StudyAreas =d, 
                                   pr = pr, sr = sr, 
                                   dist_base_sa = dist_base_sa, 
                                   dist_airport_sa = dist_dist_airport_sa,
                                   dist2airport_base = dsit2airport_base, 
                                   vars = cost_vars)}

cost_heli <-  runcost(maxARUs, d_heli)
 d_heli2 <- mutate(d_heli,
                   StudyAreaID  = "Helicopter - No Base Camp",
        dist_base_sa = 100,
        dist_dist_airport_sa = 130,
        dsit2airport_base = 200
        )
cost_heli2 <-  runcost(maxARUs, d_heli2)

 d_heli3 <- tibble(StudyAreaID  = "Helicopter - Fuel Cache", 
        pr= 0,
        sr = 0,
        dist_base_sa = 200,
        dist_dist_airport_sa = 250,
        dsit2airport_base = 200
        )
cost_heli3 <-  runcost(maxARUs, d_heli3)
d_truck <- mutate(d_heli, pr = 1, StudyAreaID  = "Truck" )
cost_truck <- runcost(maxARUs, d_truck)
d_atv <- mutate(d_heli, sr = 1,StudyAreaID  = "ATV" )
cost_atv <- runcost(maxARUs, d_atv)

cost_mixed <- 
  mutate(d_heli, pr = 0.3, sr = 0.3, StudyAreaID = "Mixed") %>% 
  runcost(maxARUs,.)

cost_test <- 
bind_rows(cost_heli, cost_truck, cost_atv, cost_heli2,cost_heli3, cost_mixed) %>% 
  group_by(narus) %>% 
  mutate(logcost = log10(RawCost),
         scLogCost = logcost / max(logcost)) %>% ungroup
ggplot(cost_test, aes(narus,RawCost, colour = StudyAreaID )) + geom_line(size = 1) +
  scale_colour_viridis_d(direction = -1) +
  labs(colour = "Access type", x = "Number of ARUs deployed")
  # scale_y_continuous(trans = 'log1p')





## -----------------------------------------------------------------------------
ggplot(cost_test, aes(narus,scLogCost, colour = StudyAreaID )) + 
  geom_line(size = 1) +
  scale_colour_viridis_d(direction = -1) +
  labs(colour = "Access type", x = "Number of ARUs deployed", y = "Scaled Log Cost")

## -----------------------------------------------------------------------------
BASSr::cost_vars

