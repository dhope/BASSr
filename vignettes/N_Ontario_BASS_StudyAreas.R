## ----setup, message =F, warning=F---------------------------------------------
knitr::opts_chunk$set(eval=T)
library(BASSr)
library(tidyverse)
library(patchwork)
library(sf)
library(gganimate)
ont.proj <- 3161
spatialworks <- "//int.ec.gc.ca/sys/InGEO/GW/EC1130MigBirds_OiseauxMig/ON_CWS/THEMES/BorealApproach/SPATIAL/BaldwinHexLandCov/Data/ExportedDataTables"
select <- dplyr::select
set.seed(2996581)

studyareas <- st_read(here::here("output/NOntario_BASS_StudyAreas.shp")) %>% rename(StudyAreaID = StdyAID )
brandtStudyAreas <- read_rds(here::here("output/NONT_HexesWithinBrant.rds"))
brandtStudyAreas_list <-  brandtStudyAreas$StudyAreaID
ontario <- read_sf("//int.ec.gc.ca/Shares/C/CWS_ON/Shared_Data/Base_Data/Boundaries/Canada/canada.shp") %>%
  filter(PROV == "ON") %>%
  st_transform(st_crs(studyareas), partial = F, check = T)
spatialworks_dat <- read_rds(glue::glue("{spatialworks}/StudyAreas_Spatialworks_w_cost.rds"))

## -----------------------------------------------------------------------------
all_study_areas <- spatialworks_dat$LCC2015 %>% 
  clean_forBass(s = "CLC15", f_vec = brandtStudyAreas_list, appended = "", id_col = StudyAreaID) %>% 
  left_join(studyareas) %>% 
  #read_rds(here::here("output/AllStudyAreaExtracdf.rds")) %>% 
  mutate_at(vars(contains("LC")), ~(replace(., is.na(.), 0))) %>% 
  select(-LC11, -LC09) # REMOVED VERY RARE HABITATS HERE

in_a_lake <- all_study_areas %>% mutate(INLAKE = ifelse(LC18>0.5*100000, T, F)) %>% 
  as_tibble %>% 
  select(StudyAreaID,INLAKE )


## ----cropped-ont, eval =F-----------------------------------------------------
#  hexagons_cropped_ontario <- st_intersection(st_as_sf(all_study_areas), ontario)
#  write_rds(hexagons_cropped_ontario, "output/hexagons_cropped.rds")
#  

## -----------------------------------------------------------------------------
hexagons_cropped_ontario <- read_rds(here::here("output/hexagons_cropped.rds"))

ggplot(hexagons_cropped_ontario) +
  geom_sf(data = ontario) +
  geom_sf(fill = 'white')+
  theme_linedraw()

## -----------------------------------------------------------------------------


cost_estimates_points <- read_rds(here::here("output/2020-02-05_StudyAreaCost.rds"))$StudyArea_CostModel %>% 
  left_join(in_a_lake) %>% bind_cols(as_tibble(st_coordinates(st_centroid(.))))

## ----BASS-run, warning=F, message=F, eval=F-----------------------------------
#  BASSres <- full_BASS_run(num_runs = 200, nsamples = 20,
#                           att = all_study_areas %>% select(-geometry),q = T,
#                           att.sp = st_centroid(st_as_sf(all_study_areas)),
#                           cost = as_tibble(cost_estimates_points) %>%
#                             select(-geometry),
#                           HexID_ = StudyAreaID, return_all = T )
#  write_rds(BASSres, "output/2020-02-06_BASS_studyarea.rds")

## -----------------------------------------------------------------------------
BASSres <- read_rds(here::here( "output/2020-02-06_BASS_studyarea.rds"))
BASS_incl <- left_join(hexagons_cropped_ontario,
                       BASSres$inclusionPr, 
                       by = "StudyAreaID") %>% 
  st_as_sf() %>% 
  filter(!is.na(inclpr))
sa <- BASS_incl %>% filter(grepl("0165",StudyAreaID))
gp <- ggplot(BASS_incl) + scale_fill_viridis_c() + 
  geom_sf(data = ontario) +
  geom_sf(data = sa, fill = NA, colour = 'red')+
  theme_linedraw()

gp + geom_sf(aes(fill = ScLogCost )) +
  scale_fill_viridis_c(direction = -1) + 
  labs(fill = "Cost") +
  geom_sf(data = sa, fill = NA, colour = 'red', size =1)


## ----benefit-plt--------------------------------------------------------------
gp + geom_sf(aes(fill = scale_ben )) +
  labs(fill = "Benefit")+
   geom_sf(data = sa, fill = NA, colour = 'red', size =1)


## ----inclusion-plt------------------------------------------------------------
gp + geom_sf(aes(fill = inclpr )) +
  labs(fill = "Selection Prob") +
  geom_sf(data = sa, fill = NA, colour = 'red', size =1)


## ---- eval=F------------------------------------------------------------------
#  BASSres$inclusionPr$stratum <- "Ontario"
#  SAs <- run_grts_on_BASS(n_grts_tests = 200,study_area_results =  BASSres,
#                          nARUs =  80,os =  0.5,idcol =  "stratum")
#  write_rds(SAs, "output/Ontario_StudyareaBOSS_Example.rds")

## ---- include= F, echo=T------------------------------------------------------
SAs <- read_rds(here::here( "output/Ontario_StudyareaBOSS_Example.rds"))
z <-map(1:200,~SAs[[.x]]@data %>% filter(panel == "PanelOne") %>% 
  .[["StudyAreaID"]] %>%  as.character)
z_out <- map_df(1:200,~SAs[[.x]]@data %>% filter(panel == "PanelOne") %>% mutate(r = .x) )

z_200 <- 
z_out %>% group_by(StudyAreaID) %>% 
  summarize(n=n())

sb <- map(1:200, ~spbalance(SAs[[.x]], 
                            st_centroid(st_as_sf(all_study_areas)), 
                            tess_ind = T, sbc_ind = F)$tess$J_subp) %>% 
  tibble(r = 1:200, 
         spbal = .) %>% unnest(cols = c(spbal))

## -----------------------------------------------------------------------------
sample_representivity <- z_out %>% left_join(all_study_areas) %>%
  dplyr::select_at( vars(r, contains("LC"))) %>% 
  group_by(r) %>% 
  summarise_all(.funs = sum) %>% 
  mutate(row_sum = rowSums(select(., -r))) %>% 
  mutate_at(.vars = vars(contains("LC")),~ ./row_sum) %>% 
  select(-row_sum) %>% 
  pivot_longer(names_to = "LC", values_to = "pHab", cols =   contains("LC"))
all_studyarea_phab <- 
all_study_areas %>% 
   dplyr::select_at( vars( contains("LC"))) %>% 
  summarise_all(.funs = sum) %>% 
  mutate(row_sum = rowSums(.)) %>% 
  mutate_at(.vars = vars(contains("LC")),~ ./row_sum) %>% 
  select(-row_sum) %>% 
  pivot_longer(names_to = "LC", values_to = "pHab", cols = everything())

ggplot(sample_representivity, aes(LC, pHab)) + 
  geom_point(alpha = 0.2, position = position_jitter(width = 0.2, height = 0)) +
  geom_point(data = all_studyarea_phab, colour = 'red', shape = "-", size = 10) +
  labs(x = "Land cover class", y = "Proportion of sample habitat type")



## ----BOSS-rep-----------------------------------------------------------------

BOSS <- read_rds(here::here("output/BOSS_phab_samples.rds")) %>% 
  mutate(LC = gsub(x = Hab, "hab_", "LC" ))

ggplot(BOSS, aes(LC, pHab)) + 
  geom_point(alpha = 0.2, position = position_jitter(width = 0.2, height = 0)) +
  geom_point(data = all_studyarea_phab, colour = 'red', shape = "-", size = 10) +
  labs(x = "Land cover class", y = "BOSS Proportion of sample habitat type")



## -----------------------------------------------------------------------------
run_sb_rep <- 
sample_representivity %>% 
  left_join(all_studyarea_phab, by = "LC") %>% 
  mutate(SE = (pHab.x - pHab.y)**2) %>% 
  group_by(r) %>% 
  summarize(SSE_hab = sum(SE)) %>% left_join(sb)
 

ggplot(run_sb_rep, aes(spbal, SSE_hab)) + geom_point() +
  labs(x = "Spatial Balance", y = "SSE proportion Habitat") + 
  lims(x = c(0.95, 1.05), y = c(0,0.2)) + 
  geom_hline(yintercept = 0, linetype = 2) +
  geom_vline(xintercept = 1, linetype = 2)


## -----------------------------------------------------------------------------
draw_n <- sample(1:200, 1) 
final_draw_for_ex <- z_out %>% filter( r == draw_n) %>% 
  left_join(dplyr::select(hexagons_cropped_ontario,
                          StudyAreaID, geometry)) %>% 
  st_as_sf() 
  ggplot(final_draw_for_ex)+
   geom_sf(data = ontario) +
  geom_sf(data = st_as_sf(hexagons_cropped_ontario),
          fill = 'white') +
  geom_sf(fill = 'blue') +
  theme_linedraw()

  

## ---- eval=F------------------------------------------------------------------
#  d <- z_out %>%
#    left_join(dplyr::select(hexagons_cropped_ontario,
#                            StudyAreaID, geometry))  %>%
#   st_as_sf()
#  
#  
#  gif_out <- ggplot(d) +
#     geom_sf(data = ontario) +
#    geom_sf(data = st_as_sf(hexagons_cropped_ontario),
#            fill = 'white') +
#    geom_sf(fill = 'blue') +
#    theme_linedraw() +
#    transition_manual(r) +
#    ease_aes('linear')
#  
#  anim_save( filename = "output/Animation_Runs.gif",animation = gif_out )
#  

## -----------------------------------------------------------------------------
eco_bcr <- read_rds(here::here("output/studyareas_by_eco_bcr.rds")) %>% 
  as_tibble %>% 
  dplyr::select(StudyAreaID, REGION_NAM, BCR_Name, MU_NAME ) %>% 
  left_join(final_draw_for_ex, .)

n_by_eco <- eco_bcr %>% 
  as_tibble %>% 
  group_by(REGION_NAM) %>% 
  summarize(n =n()) %>% 
  arrange(desc(n))

knitr::kable(n_by_eco)

  



## -----------------------------------------------------------------------------


n_by_bcr <- eco_bcr %>% 
  as_tibble %>% 
  group_by(BCR_Name) %>% 
  summarize(n =n()) %>% 
  arrange(desc(n))

knitr::kable(n_by_bcr)


## -----------------------------------------------------------------------------

n_by_forest <- eco_bcr %>% 
  as_tibble %>% 
  group_by(MU_NAME) %>% 
  summarize(n =n()) %>% 
  arrange(desc(n)) %>% 
  mutate(MU_NAME = ifelse(is.na(MU_NAME), "Unharvested", MU_NAME))

knitr::kable(n_by_forest)



## ---- eval=F------------------------------------------------------------------
#  ggplot(eco_bcr, aes(fill = MU_NAME)) + geom_sf()

## ---- fig.width=12, fig.height=10---------------------------------------------

ecoregions <- read_sf("//int.ec.gc.ca/Shares/C/CWS_ON/Shared_Data/Base_Data/Natural_Frameworks/NationalEcolFramework/eco_reg_join.shp") %>%
  st_transform(ont.proj, partial = F, check = T,)
OntBrant <- read_rds(system.file("extdata",package = "BASSr", "ontario_brandt.rds")) # From the BMS Ontario scripts

OntEco <- st_intersection(ecoregions, OntBrant)
OntEco_N <- st_centroid(OntEco) %>% 
  left_join(n_by_eco) %>% 
  mutate(n = replace_na(n,0)) %>% 
  filter(REGION_NAM != "Big Trout Lake" | AREA>1)

ggplot(OntEco) + 
  geom_sf(aes(fill = REGION_NAM)) +
  scale_fill_viridis_d() + 
  geom_sf_label(data = OntEco_N, aes(label = n)) +
  labs(fill = "Ecoregion", x = "", y = "") +
  theme_linedraw() +
  theme(legend.position = 'bottom')



