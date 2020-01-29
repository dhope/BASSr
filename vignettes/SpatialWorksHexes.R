## ----setup, include=F, echo=T-------------------------------------------------
knitr::opts_chunk$set(
  eval=T,
  collapse = TRUE,
  fig.width = 12,
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

files_spatialworks <- list.files(path = spatialworks, pattern = ".csv")

files_study <- files_spatialworks[grepl("Study", x=files_spatialworks)]
files_sample <- files_spatialworks[grepl("Sample", x=files_spatialworks)]
read_SW <- function(lst, x){read_csv(paste(spatialworks, lst[grepl(x,lst)],sep="/" ), col_types = cols())}
FNLCID <- read_SW(files_spatialworks, "CLS_F")
LC15ID <- read_SW(files_spatialworks, "CLS_CLC2015")
LC10ID <- read_SW(files_spatialworks, "CLS_CLC2010")

## -----------------------------------------------------------------------------
allhexes <- read_rds(here::here("output/NOntario_BASS_hexes.rds"))
brandtStudyAreas <- read_rds(here::here("output/NONT_HexesWithinBrant.rds"))
StudyAreas <- read_SW(files_study, "StudyAreas") %>% 
# read_csv(paste(spatialworks, files_study[grepl("StudyAreas",files_study)],sep="/" ))  %>% 
  rename(StudyAreaID = StdyAID)

LCC2010 <-  read_SW(files_study, "2010") %>% 
  left_join(StudyAreas, by = "ID")

LCC2015 <- read_SW(files_study, "2015") %>% 
  left_join(StudyAreas, by = "ID")

FNLC <- read_SW(files_study, "FNLC") %>% 
  left_join(StudyAreas, by = "ID")

StudyArea_cost_30arus <- 
  read_rds("C:/Users/hoped/Documents/Local_Workspace/Projects/BASSr/output/2020-01-24_StudyArea_costs.rds") %>% 
  as_tibble %>% dplyr::select(-geometry)
brandtStudyAreas_list <-  brandtStudyAreas$StudyAreaID
StudyArea_LandCover_Cost <- list(
  StudyAreas=allhexes$StudyAreas,
  LCC2010=LCC2010, 
  LCC2015=LCC2015, 
  FNLC=FNLC, 
  BrandtStudyAreas = brandtStudyAreas_list, 
  StudyArea_cost_30arus= StudyArea_cost_30arus)

## ---- eval =F-----------------------------------------------------------------
#  write_rds(StudyArea_LandCover_Cost, glue::glue("{spatialworks}/StudyAreas_Spatialworks_w_cost.rds"))

## -----------------------------------------------------------------------------
tranx <- function(x)glue::glue("LC{stringr::str_pad(stringr::str_split(x, '_')[[2]],2, pad = 0)}")
brandtStudyAreas_list <-  brandtStudyAreas$StudyAreaID

clean_forBass <- function(df, s, f_vec = brandtStudyAreas_list, appended = ""){
  df %>% 
  rename_at(.vars= vars(contains(glue::glue("{s}_"))), 
            .funs = ~glue::glue('LC{stringr::str_pad(gsub(glue::glue("{s}_"), "", .), width = 2, pad = 0)}{appended}'
            ))  %>% filter(StudyAreaID %in%f_vec)
}


LC2015_att <- clean_forBass(LCC2015, "CLC15")

WaterSA <- LC2015_att$StudyAreaID[LC2015_att$D_CLC15 == 18& LC2015_att$LC18/ LC2015_att$TOT_HA>0.6]

sp.sa <- StudyArea_LandCover_Cost$StudyAreas %>% filter(StudyAreaID %in% brandtStudyAreas$StudyAreaID)

sa.cost <- StudyArea_LandCover_Cost$StudyArea_cost_30arus %>% 
  mutate(INLAKE = ifelse(StudyAreaID %in% WaterSA, T, F),
         X = NA, Y = NA) 
  




ggplot(LC2015_att %>% filter(StudyAreaID %in% WaterSA),
       aes(LC18/TOT_HA)) + geom_histogram(bins = 20)



LCC2015_BASS <- BASSr::full_BASS_run(num_runs = 50, nsamples = 10, 
                                     att = LC2015_att, 
                                     att.sp = st_centroid(sp.sa),
                                     cost = sa.cost, return_all = T, HexID_ = StudyAreaID, q = T)

LCC2015_BASS$inclusionPr %>% 
  ggplot(aes(LogCost, benefit)) + geom_point()


## -----------------------------------------------------------------------------

plt_SA <- function(d, fill_){
  StudyArea_LandCover_Cost$StudyAreas %>% 
     left_join(d) %>% 
  ggplot() + 
  geom_sf(aes(fill = {{fill_}})) +
  scale_fill_viridis_c()
}

plt_SA(LCC2015_BASS$inclusionPr, benefit)

## -----------------------------------------------------------------------------
FNLC_att <- clean_forBass(FNLC, "FNLC")

WaterSA_FNLC <- FNLC_att$StudyAreaID[FNLC_att$D_FNLC == 1& FNLC_att$LC01/ FNLC_att$TOT_HA>0.6]

FNLC_BASS <- BASSr::full_BASS_run(num_runs = 50, nsamples = 10, 
                                     att = FNLC_att, 
                                     att.sp = st_centroid(sp.sa),
                                     cost = sa.cost, return_all = T, HexID_ = StudyAreaID, q = T)





## -----------------------------------------------------------------------------

plt_SA(FNLC_BASS$inclusionPr, benefit)

## -----------------------------------------------------------------------------
CLC10_att <- clean_forBass(LCC2010, "CLC10")


WaterSA_FNLC <- FNLC_att$StudyAreaID[FNLC_att$D_FNLC == 1& FNLC_att$LC01/ FNLC_att$TOT_HA>0.6]

LC10_BASS <- BASSr::full_BASS_run(num_runs = 50, nsamples = 10, 
                                     att = CLC10_att, 
                                     att.sp = st_centroid(sp.sa),
                                     cost = sa.cost, return_all = T, HexID_ = StudyAreaID, q = T)



## -----------------------------------------------------------------------------


plt_SA(LC10_BASS$inclusionPr, benefit)

## -----------------------------------------------------------------------------
FNLC_att %>% select_at(.vars = vars(matches("^LC\\d"))) %>% 
  rowSums() %>% hist
FNLC_names <- StudyArea_LandCover_Cost$StudyAreas %>% 
  right_join(FNLC_att) %>% 
  left_join(FNLCID, by = c("D_FNLC"="SW_ID"))

FNLC_names %>% 
   ggplot() + 
  geom_sf(aes(fill = Class)) +
  scale_fill_viridis_d()


## -----------------------------------------------------------------------------
StudyArea_LandCover_Cost$StudyAreas %>% 
  right_join(LC2015_att) %>% 
  left_join(LC15ID, by = c("D_CLC15"="SW_ID")) %>% 
   ggplot() + 
  geom_sf(aes(fill = Class)) +
  scale_fill_viridis_d() +
  labs(fill ="Canadian Land Cover 2015")

## -----------------------------------------------------------------------------
StudyArea_LandCover_Cost$StudyAreas %>% 
  right_join(CLC10_att) %>% 
  left_join(LC10ID, by = c("D_CLC10"="SW_ID")) %>% 
   ggplot() + 
  geom_sf(aes(fill = Class)) +
  scale_fill_viridis_d()+
  labs(fill ="Canadian Land Cover 2010")

## -----------------------------------------------------------------------------
Studyareas_forcompare <- FNLC_names %>% filter(!is.na(Class)) %>% .$StudyAreaID


LCC2015_BASS2 <- BASSr::full_BASS_run(num_runs = 50, nsamples = 10, 
                                     att = LC2015_att %>% 
                                       filter(StudyAreaID %in% Studyareas_forcompare), 
                                     att.sp = st_centroid(sp.sa %>% 
                                                            filter(StudyAreaID %in% Studyareas_forcompare)),
                                     cost = sa.cost %>% 
                                       filter(StudyAreaID %in% Studyareas_forcompare), return_all = T, HexID_ = StudyAreaID, q = T)
FNLC_BASS2 <- BASSr::full_BASS_run(num_runs = 50, nsamples = 10, 
                                     att = FNLC_att %>% 
                                     filter(StudyAreaID %in% Studyareas_forcompare), 
                                     att.sp = st_centroid(sp.sa %>% 
                                                            filter(StudyAreaID %in% Studyareas_forcompare)),
                                     cost = sa.cost %>% 
                                     filter(StudyAreaID %in% Studyareas_forcompare), return_all = T, HexID_ = StudyAreaID, q = T)
LC10_BASS2 <- BASSr::full_BASS_run(num_runs = 50, nsamples = 10, 
                                     att = CLC10_att %>% 
                                     filter(StudyAreaID %in% Studyareas_forcompare), 
                                     att.sp = st_centroid(sp.sa %>% 
                                                            filter(StudyAreaID %in% Studyareas_forcompare)),
                                     cost = sa.cost %>% 
                                     filter(StudyAreaID %in% Studyareas_forcompare), return_all = T, HexID_ = StudyAreaID, q = T)



## -----------------------------------------------------------------------------
plt_SA(LCC2015_BASS2$inclusionPr, scale_ben) +labs(title="Canadian LC 2015") + scale_fill_viridis_c(limits = c(0,1))+ 
  plt_SA(LC10_BASS2$inclusionPr, scale_ben) +labs(title="Canadian LC 2010") + scale_fill_viridis_c(limits = c(0,1))+ 
  plt_SA(FNLC_BASS2$inclusionPr, scale_ben) +labs(title="Far North LC") +  scale_fill_viridis_c(limits = c(0,1))+ 
  plot_layout(guides = 'collect')

## -----------------------------------------------------------------------------

LC2010_atta <- clean_forBass(LCC2010, "CLC10",appended =  "A")

FNLC_LC <- full_join(FNLC_att, LC2010_atta)

FNLC_CLC2010_BASS <- BASSr::full_BASS_run(num_runs = 50, nsamples = 10, 
                                     att = FNLC_LC %>% 
                                     filter(StudyAreaID %in% Studyareas_forcompare), 
                                     att.sp = st_centroid(sp.sa %>% 
                                                            filter(StudyAreaID %in% Studyareas_forcompare)),
                                     cost = sa.cost %>% 
                                     filter(StudyAreaID %in% Studyareas_forcompare), return_all = T, 
                                     HexID_ = StudyAreaID, q = T)



## -----------------------------------------------------------------------------
plt_SA(FNLC_CLC2010_BASS$inclusionPr, scale_ben) + 
  labs(title="Far North and LC2010 Combined")+  scale_fill_viridis_c(limits = c(0,1))

