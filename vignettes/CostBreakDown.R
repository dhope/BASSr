## ----setup, include=T, warning=F, message=F-----------------------------------
knitr::opts_chunk$set(
  eval=T,
  collapse = TRUE,
  message =F, warning =F,
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


bcv <- BASSr::cost_vars



## ----fig1, fig.cap = "The cost of deploying a given number of ARUs in a Study Area by ATV, Truck, Helicopter, or a mixed method. The helicopter includes, with a base camp ('Helicopter'; 100km from base camp to study area, 250 from study area to airport, and 200 km from airport to base camp), with no basecamp required (100km from base camp to study area, 130 from study area to airport, and 200 km from airport to base camp), and with a base camp and secondary fuel cach required (200km from base camp to study area, 250 km from study area to airport, and 200 km from airport to base camp). The 'Mixed' method involves 1/3 of truck, ATV, and Helicopter access types to survey the area."----
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
  labs(colour = "Access type", x = "Number of ARUs deployed", y = "Raw Cost Value")
  # scale_y_continuous(trans = 'log1p')





## ----fig2, fig.cap = "The same calculation shown in the figure above but now cost is shown as the cost relative to the most expensive access type for each ARU deployment size (here it is 'Helicopter - Fuel Cache' for all ARU numbers). The scaled cost is calculated as the raw cost divided by the maximum raw cost for that ARU number."----
ggplot(cost_test, aes(narus,scLogCost, colour = StudyAreaID )) + 
  geom_line(size = 1) +
  scale_colour_viridis_d(direction = -1) +
  labs(colour = "Access type", x = "Number of ARUs deployed", y = "Scaled Log Cost")

## ---- results='asis'----------------------------------------------------------
BASSr::cost_vars %>% as_tibble() %>% pivot_longer(names_to = "Variable", values_to = "Value", cols = everything()) %>% knitr::kable()

