## ----setup, message=F, warning=F----------------------------------------------
knitr::opts_chunk$set(
  eval=T,
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
library(patchwork)

## -----------------------------------------------------------------------------
test_sa <- c("0322", "0740", "0404","0165","0247","0197")
allhexes <- read_rds(here::here("output/NOntario_BASS_hexes.rds"))
studyareas <-  allhexes$StudyAreas%>% filter(grepl(glue_collapse( test_sa,"|"), StudyAreaID))
samplehexes <- allhexes$SampleUnits%>% filter(grepl(glue_collapse( test_sa,"|"), StudyAreaID))
rm(allhexes)


# n_BASS_iterations <- 20
# n_BASS_samples_per_it <- 100
sample_size <- 50


habLoc <- "//int.ec.gc.ca/sys/InGEO/GW/EC1130MigBirds_OiseauxMig/ON_CWS/THEMES/BMS_ON/SANDBOX/dhdev/OnBMS/spatial/NontariobrandtLCC2015_reproj.tif"
roadloc1 <- "//int.ec.gc.ca/sys/InGEO/GW/EC1130MigBirds_OiseauxMig/ON_CWS/THEMES/BMS_ON/SPATIAL/SecondaryRoadsNOntario.shp"
roadloc2 <- "//int.ec.gc.ca/sys/InGEO/GW/EC1130MigBirds_OiseauxMig/ON_CWS/THEMES/BMS_ON/SPATIAL/PrimaryRoadsNOnt.shp"


## ---- eval=F------------------------------------------------------------------
#  # fbr_study_area_test <- map(unique(studyareas$StudyAreaID) , ~BASSr::extract_habitat_cost(number_iterations = n_BASS_iterations, n_samples_per_iter = n_BASS_samples_per_it, sample_hexes = samplehexes, study_area_hexes = studyareas, id = .x, id_col = StudyAreaID, hab_rast_location = habLoc, primary_roads = roadloc1, secondary_roads =roadloc2, return_all_ = T, write_hexes =T, load_hexes = T,quick = T, rds.loc="output" ))
#  #
#  # write_rds(fbr_study_area_test, "output/2020-01-24_fbr_studyarea.rds")
#  

## ---- eval=F, include=F-------------------------------------------------------
#  x <- read_rds("output/studyArea_ONT_SA_0197_BassPrep.rds")

## ---- message=F, warning=F----------------------------------------------------
fbr_study_area_test <- read_rds(here::here("output/2020-01-29_fbr_studyarea2.rds"))
grts_run <- run_grts_on_BASS(n_grts_tests = 30, 
                             study_area_results = fbr_study_area_test,
                             nARUs = sample_size, idcol = "StudyAreaID",
                             os = 0.5)
sampleBASSresults <- getresults_BASS(grts_output = grts_run,
                                     study_area_results = fbr_study_area_test,
                                     nARUs =  sample_size)
sampleBASSresults$see_plot
sampleBASSresults$sbpalPlot

pwplots <- with(sampleBASSresults, pwplots[[1]] + pwplots[[2]] + pwplots[[3]] + pwplots[[4]] + pwplots[[5]] + pwplots[[6]])



## ---- fig.width=12, fig.height=8----------------------------------------------
pwplots

## ---- eval =F-----------------------------------------------------------------
#  sf_list = list(primary_roads = primary_buffer, secondary_roads = secondary_buffer, winter_roads = winter_buff, total_roads = road_buffer, airport_locations = airports_official, camp_locations = tourism)
#  
#  sampleSizeAllocation <- function(nArus, n_grts_tests, fbr, os, n_BASS_iterations = 20) {
#    if (is.null(fbr)) {
#      fbr <- map(unique(studyareas$StudyAreaID),
#                 ~ extract_habitat_cost(number_iterations = n_BASS_iterations,
#                                        n_samples_per_iter = 20, sample_hexes = samplehexes,
#                                        study_area_hexes = studyareas, id = .x,
#                                        id_col = StudyAreaID, shape_file_list = NA,
#                                        return_all_ = T, write_hexes = F, quick = T,calc_cost = F,
#                                        calc_hab = F,
#                                        load_hexes = T,
#                                        rds.loc = here::here("output")))
#    }
#    print("Finished Extracting Hexagons")
#    grts_run <- run_grts_on_BASS(idcol = "StudyAreaID",
#      n_grts_tests = n_grts_tests,
#      study_area_results = fbr,
#      nARUs = nArus,
#      os = os
#    )
#    print("Finished sampling ARU")
#    sampleBASSresults <- getresults_BASS(
#      grts_output = grts_run,
#      study_area_results = fbr,
#      nARUs = nArus
#    )
#  
#    return(list(grts = grts_run, sampleBASSresults = sampleBASSresults, ids = tibble(nArus, n_grts_tests, os)))
#  }
#  
#  all_samples <- map(c(20,30,50,100), sampleSizeAllocation,
#                     n_grts_tests = 50, fbr = fbr_study_area_test, os = 0.5)
#  write_rds(all_samples, "output/2020-01-15_allsamples.rds")
#  
#  

## ---- fig.width=12, fig.height=12---------------------------------------------

all_samples <- read_rds(here::here("output/2020-01-15_allsamples.rds"))
pw <- (all_samples[[1]]$sampleBASSresults$see_plot + labs(title = "20 arus") +
all_samples[[2]]$sampleBASSresults$see_plot + labs(title = "30 arus")) /(
all_samples[[3]]$sampleBASSresults$see_plot+ labs(title = "50 arus") +
  all_samples[[4]]$sampleBASSresults$see_plot + labs(title = "100 arus")) + plot_layout(guides = 'collect')

pw & theme_minimal()

## -----------------------------------------------------------------------------
pw2 <- (all_samples[[1]]$sampleBASSresults$sbpalPlot + labs(title = "20 arus") +
all_samples[[2]]$sampleBASSresults$sbpalPlot + labs(title = "30 arus")) /(
all_samples[[3]]$sampleBASSresults$sbpalPlot+ labs(title = "50 arus") +
  all_samples[[4]]$sampleBASSresults$sbpalPlot + labs(title = "100 arus")) + plot_layout(guides = 'collect')

pw2 & theme_minimal()

## -----------------------------------------------------------------------------
tr_sm <- purrr::transpose(all_samples)$sampleBASSresults %>% purrr::transpose(.) %>% 
  .[['outputs']] %>% 
  do.call("rbind", .)

tr_sm %>% group_by(StudyAreaID, run, samplesize) %>% 
  summarize(SSE = sum( (pHab - pHab_SA)**2  ) ) %>% 
  ggplot(aes(samplesize, SSE)) + 
  geom_point(position = position_jitter(width = 0.5, height = 0), alpha = 0.3) +
  facet_wrap(~StudyAreaID, scales='free_y') 


## ---- eval =F-----------------------------------------------------------------
#  
#  all_samples <- map(c(10,20,30,50,100,200), sampleSizeAllocation,  n_grts_tests = 50, fbr = NULL,
#                     os = 0.5, n_BASS_iterations = 20)
#  
#  write_rds(all_samples, "output/2020-01-28_allsamples_drawARUsInBASS.rds")
#  
#  

## ---- fig.width=12, fig.height=12---------------------------------------------
as2 <- read_rds(here::here( "output/2020-01-27_allsamples_drawARUsInBASS.rds"))
pw <- (as2[[1]]$sampleBASSresults$see_plot + labs(title = "10 arus") +
as2[[2]]$sampleBASSresults$see_plot + labs(title = "20 arus") + as2[[3]]$sampleBASSresults$see_plot + labs(title = "30 arus")) / (
as2[[4]]$sampleBASSresults$see_plot+ labs(title = "50 arus") +
  as2[[5]]$sampleBASSresults$see_plot + labs(title = "100 arus") +
  as2[[6]]$sampleBASSresults$see_plot + labs(title = "200 arus")) + plot_layout(guides = 'collect')

pw & theme_minimal()



## -----------------------------------------------------------------------------
outputs_all <- map_df(1:6, function(x) {
  id <- as2[[x]]$ids
  df <- as2[[x]]$sampleBASSresults$outputs %>% ungroup
  mutate(df, nArus = id$nArus)})


ggplot(outputs_all, aes(nArus, spbal)) + 
   stat_summary(fun.data = 'mean_cl_boot', 
                geom='ribbon', aes(fill = StudyAreaID), alpha = 0.5) +
  stat_summary(fun.y = 'mean', geom='line', aes(colour = StudyAreaID))


ggplot(outputs_all, aes(nArus, (pHab-pHab_SA)**2)) +
  stat_summary(fun.y='sum', geom='line', aes(colour = LC)) +
  facet_wrap(~StudyAreaID, scales='free_y')

pws <- map(1:6,~{
ggplot(outputs_all %>% filter(StudyAreaID == unique(outputs_all$StudyAreaID)[[.x]]), aes(nArus, pHab) )+
  # geom_point(alpha = 0.01) +
    stat_summary(fun.data = 'mean_cl_boot', geom='ribbon', aes(fill = LC), alpha = 0.5) +
  stat_summary(fun.y='mean', geom='line', aes(colour = LC)) +
  facet_grid(LC~StudyAreaID, scales='free_y') +
  stat_summary(fun.y='mean', geom='line',linetype =2, 
               aes(y = pHab_SA,
                   colour = LC)) })

pws[[1]]+pws[[2]]+pws[[3]]+pws[[4]]+pws[[5]]+pws[[6]] + plot_layout(guides = 'collect')


## -----------------------------------------------------------------------------

ggplot(outputs_all, aes(nArus, pHab, colour = LC)) + 
  geom_point(alpha = 0.2, position = position_dodge(width = 5)) +
  facet_wrap(~StudyAreaID)


