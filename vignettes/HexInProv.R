## ----setup, eval=T------------------------------------------------------------
knitr::opts_chunk$set(eval=T, fig.width = 12, fig.height = 12)

library(tidyverse)
library(sf)
library(spsurvey)
library(glue)
library(BASSr)


## -----------------------------------------------------------------------------
ont.proj <- 3161  # Recommened MNR projection for Ontario
ecoregions <- read_sf("//int.ec.gc.ca/Shares/C/CWS_ON/Shared_Data/Base_Data/Natural_Frameworks/NationalEcolFramework/eco_reg_join.shp") %>%
  st_transform(ont.proj, partial = F, check = T,)

bcr <-  read_sf("//int.ec.gc.ca/Shares/C/CWS_ON/Shared_Data/Base_Data/Management_Frameworks/BCR_Planning_Regions/BCR_ON_boundaries/BCR_ON_boundaries.shp") %>% 
  st_transform(ont.proj, partial = F, check = T,)

forest <-  read_sf("//int.ec.gc.ca/Shares/C/CWS_ON/Shared_Data/Base_Data/Management_Frameworks/OMNR_FMU/aoupoly_g83.shp") %>% 
  st_transform(ont.proj, partial = F, check = T,)

fn <-  read_sf("//int.ec.gc.ca/shares/C/CWS_ON/Shared_Data/Base_Data/Ontario_Base_Data/OGDE/Non_EC_Data/005-economy/CA-ON/Land Use Plan Area, MNR/luplmnr.shp") %>% 
  st_transform(ont.proj, partial = F, check = T,)

ontario <- read_sf("//int.ec.gc.ca/Shares/C/CWS_ON/Shared_Data/Base_Data/Boundaries/Canada/canada.shp") %>%
  filter(PROV == "ON") %>%
  st_transform(ont.proj, partial = F, check = T)




OntBrant <- read_rds(system.file("extdata",package = "BASSr", "ontario_brandt.rds")) # From the BMS Ontario scripts

hexes <- read_rds(here::here("output/NOntario_BASS_hexes.rds"))



sa <- hexes$StudyAreas %>% 

  mutate(
    sa_area = st_area(.),
    cropped = st_area(st_intersection(., OntBrant)),
    p_inc = as.numeric(cropped/ sa_area)
  )


sa_c <- st_centroid(sa)

x <- st_intersects(sa_c,  st_as_sf(OntBrant) %>% mutate(B = 1))

withinBrant<- st_join(sa_c, st_as_sf(OntBrant) %>% mutate(B = 1), join = st_intersects)

## ----eval=F-------------------------------------------------------------------
#  write_rds(withinBrant %>% filter(!is.na(B)),"output/NONT_HexesWithinBrant.rds")

## ---- eval =F-----------------------------------------------------------------
#  sa_eco_bcr <-
#  sa %>% filter(!StudyAreaID %in% filter(withinBrant, is.na(B))$StudyAreaID) %>%
#    st_centroid(.) %>%
#    st_join(y = st_intersection(ecoregions, OntBrant)) %>%
#    st_join(y =st_intersection(bcr, OntBrant) ) %>%
#    st_join(y =fn %>% filter(PLAN_NAME == "Far North Boundary Line" ) ) %>%
#    st_join(y = forest)
#  
#  write_rds(sa_eco_bcr, "output/studyareas_by_eco_bcr.rds")

## -----------------------------------------------------------------------------
sa_eco_bcr <- read_rds(here::here("output/studyareas_by_eco_bcr.rds"))

# ggplot(sa_eco_bcr, aes(fill = REGION_NAM)) + geom_sf()

ggplot(st_intersection(ecoregions, OntBrant)) + 
  geom_sf(aes(fill = REGION_NAM)) +
  geom_sf(data = sa %>% filter(!StudyAreaID %in% filter(withinBrant, is.na(B))$StudyAreaID) , fill = alpha("white", 0.))


hist(filter(sa, p_inc <1)$p_inc, breaks = 60)

# st_write(sa, "output/studyareas.kml")
# st_write(OntBrant, "output/Brandt.kml")

ggplot(sa) + 
  geom_sf(fill = alpha('blue', 0.01)) + 
   
  geom_sf(data =
            filter(sa , p_inc <1),aes(fill = p_inc)) + 
   geom_sf(data = OntBrant, fill = alpha('red',alpha = 0), colour = 'red') +
   geom_sf(data =withinBrant %>% filter(is.na(B)), colour = 'red')  +
  labs(fill = "Proportion within Ont Brant") + theme(legend.position = 'bottom') +
  scale_fill_viridis_c()

d <- sa_eco_bcr %>% as_tibble 
nrow(d)

## ---- results='asis'----------------------------------------------------------
d %>%
  group_by(BCR_Name) %>%
    summarize(n_by_bcr = n()) %>% knitr::kable()

## ---- results='asis'----------------------------------------------------------
d %>%
  group_by(REGION_NAM) %>%
    summarize(n_by_eco = n()) %>% knitr::kable()

## ---- results='asis'----------------------------------------------------------

d %>% group_by(PLAN_NAME) %>%
    summarize(n_by_MNR = n()) %>% knitr::kable()




## -----------------------------------------------------------------------------
d %>% filter(!is.na(MU_NAME)) %>% nrow

