## ----setup, include=F, echo=T-------------------------------------------------
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
ont.proj <- 3161
ontario <- read_sf("//int.ec.gc.ca/Shares/C/CWS_ON/Shared_Data/Base_Data/Boundaries/Canada/canada.shp") %>%
  filter(PROV == "ON") %>%
  st_transform(st_crs(ont.proj), partial = F, check = T)
lcc2015_codes <- read_csv(here::here("inst/extdata/LCC2010_LandCoverCodeDescriptions.csv"))


clrfile <- read_delim("//int.ec.gc.ca/sys/InGEO/GW/EC1130MigBirds_OiseauxMig/ON_CWS/THEMES/BorealApproach/SANDBOX/dhdev/CAN_NALCMS_LC_30m_LAEA_mmu12_urb05.clr", col_names = c("Value", "red", "green", "blue"), delim = " ") %>% 
  mutate(rgb = pmap_chr(.l = list(red, green, blue),
                    .f = rgb,maxColorValue = 255 )) %>% 
  left_join(lcc2015_codes, by = c("Value" = "LCC_CODE"))

## ----load-data----------------------------------------------------------------
all_study_areas <- read_rds(here::here("output/hexagons_cropped.rds"))

study_area_id  <- "ONT_SA_0740"
StudyArea_hexes <- read_rds(here::here(glue::glue("output/StudyArea_{study_area_id}_BassPrep.rds") ) )
SA_sum <- StudyArea_hexes$landcover %>% as_tibble() %>% 
  summarize_at( .vars = vars(contains("LC")), .funs = sum) %>% 
   pivot_longer(cols = contains("LC"), names_to = "lc", values_to = "pHab_SA") %>% 
  mutate(pHab_SA = pHab_SA / sum(pHab_SA)) %>% 
  arrange(pHab_SA) %>% 
  mutate(cHAb_SA = cumsum(pHab_SA),
         lcFac = forcats::fct_reorder(lc, pHab_SA),
         lc_n = as.numeric(stringr::str_extract(lc, "\\d\\d") ))%>% 
  left_join(lcc2015_codes, by = c("lc_n" = "LCC_CODE")) %>% 
  mutate(lcc_fac = forcats::fct_reorder(LCC_NAME, pHab_SA))

## ---- fig.cap='Map of Ontario study areas with example study area shown in red', fig.width=8, fig.height=8----
ggplot(all_study_areas) +
  geom_sf(data = ontario) +
  geom_sf(fill = 'white')+
  theme_linedraw() +
  geom_sf(data = filter(all_study_areas, StudyAreaID == study_area_id), fill = 'red')

## ----raster-plot, fig.cap = "Fig 1. The distribution of land cover classes across an example study area"----
r <- raster::raster(
    glue::glue(here::here("output/{study_area_id}.tif")) ) %>%
  raster::as.data.frame(xy=T, long =T) %>% as_tibble() %>%
    filter(!is.na(value)) %>% 
  left_join(lcc2015_codes, by = c("value" = "LCC_CODE"))

  # pal_ <- viridis::viridis(19)
  # names(pal_) <- as.character(1:19)
  pal_ <- clrfile$rgb
  names(pal_) <- as.character(clrfile$LCC_NAME)


  lc <- ggplot() + geom_raster(data = r, aes(x, y, fill = LCC_NAME)) +
    scale_fill_manual(values = pal_) +
    geom_sf(data = StudyArea_hexes$landcover, fill = NA) +
    labs(x = "", y = "", fill = "LCC2015") + theme_linedraw()
  
  # inplt <- ggplot() + geom_sf(data = StudyArea_hexes,
  #                             aes(fill = inclpr) ) + scale_fill_viridis_c()
  # library(patchwork)
  # lc + inplt

lc + ggspatial::annotation_scale(location = "bl", width_hint = 0.4) 

## ----land-cover-hexes, fig.cap = "Fig 2. The cumulative proportion of land cover classes within sample hexagons (grey) and the study area (black). The red line shows the example hexagon used in the initial benefit calculation.", fig.width= 8, fig.height=12----
hex_LC <- 
StudyArea_hexes$landcover %>% 
  as_tibble() %>% dplyr::select(-geometry) %>% 
  pivot_longer(cols = contains("LC"), names_to = "lc", values_to = "pHab") %>% 
  left_join(SA_sum, by =c( "lc")) %>% arrange(SampleUnitID, pHab_SA) %>% 
  group_by(SampleUnitID) %>% 
  mutate(cpHab = cumsum(pHab/100)) %>% ungroup %>% 
  mutate(lc_n = as.numeric(stringr::str_extract(lc, "\\d\\d") ))
set.seed(2277)
exampleHex <- sample_n(StudyArea_hexes$landcover, 1)
exLC <- hex_LC %>% filter(SampleUnitID %in% exampleHex$SampleUnitID)

ggplot(hex_LC, aes(lcc_fac, cpHab, group = SampleUnitID)) + 
  geom_step(colour = 'grey', 
            alpha = 0.1) + 
  geom_step(data = exLC, 
            colour = 'red')+
  geom_step(data = SA_sum, 
            aes(y = cHAb_SA, group = 1), 
            colour = "black", size =2) + theme_minimal() +
  labs(x = "Land Cover Class (Increasing freq from left to right)", y = "Cumulative proportion of hexagon") +
  theme(axis.text.x = element_text(family = 'mono', 
                                   angle= 75, vjust = 1, hjust = 1))


## ---- fig.cap="Fig 3. Example Hexagon"----------------------------------------
ggplot(exampleHex) + geom_sf(fill = 'red') +
  geom_sf(data = StudyArea_hexes$landcover, fill = NA) + theme_minimal()



## ----example-hex-table, results='asis'----------------------------------------

 exLC %>% dplyr::select(lcc_fac,pHab, pHab_SA) %>% 
  mutate(pHab_SA = pHab_SA * 100) %>% 
  knitr::kable(col.names = c("Land Cover", "% Example Sample Unit", "% Example Study Area"), digits = 2)


## ---- fig.cap = "Fig 4. Plot of focal sample unit (red) and the hypothetical sample set (grey)"----

sample_hexes <- BASSr::draw_random_samples(att_cleaned = as_tibble(StudyArea_hexes$landcover), 
                                           att.sf = st_centroid(StudyArea_hexes$landcover), 
                                           num_runs = 1, nsamples = 10) 

sample_hexes_sf <- StudyArea_hexes$landcover %>% 
  filter(SampleUnitID %in% (sample_hexes$grts_random_sample %>% filter(panel == "PanelOne"))$SampleUnitID)

ggplot(exampleHex) + geom_sf(fill = 'red') +
  geom_sf(data = StudyArea_hexes$landcover, fill = NA) + 
  geom_sf(data = sample_hexes_sf, fill = 'grey')+
  theme_minimal()



## -----------------------------------------------------------------------------

sample_hexes_phab <-  hex_LC %>% filter(SampleUnitID %in% sample_hexes_sf$SampleUnitID) %>% 
  group_by(lcc_fac) %>% 
  summarize(pHab_samp = sum(pHab)) %>% ungroup %>% 
  mutate(pHab_samp = pHab_samp/ sum(pHab_samp)* 100)

m2toha <- 0.0001
study_area_size <- as.numeric(sum(st_area(StudyArea_hexes$landcover))) *m2toha
hexsize <- as.numeric(st_area(exampleHex))*m2toha


samp_com <- 
left_join( exLC %>% dplyr::select(lcc_fac,pHab, pHab_SA), sample_hexes_phab) %>% 
  mutate(pHab_Sample_plus_hex = 100*( (pHab*hexsize + pHab_samp*hexsize*10)/
                                        (sum(pHab*hexsize) + sum(pHab_samp*hexsize*10))),
         pHab_SA = pHab_SA * 100)

names(samp_com) <- c("lcFac", "Sample Unit", "Study Area", "Hypothetical Sample Set", "Sample Set + Sample Unit")

knitr::kable(samp_com, digits = 2)

## ---- fig.cap = "Fig 5. Distribution of land cover by hexagon, sample, sample plus hexagon and study area", fig.width=12, fig.height=8----


d <- 
  samp_com %>%  
  pivot_longer(names_to = "sampletype", values_to = "phabitat", cols = -lcFac) %>% 
  mutate(sampletype = factor(sampletype, levels = c("Sample Unit", "Hypothetical Sample Set", "Sample Set + Sample Unit", "Study Area")))
                               # c("Hexagon",  "Sample", "Sample + Hex","Study Area")))


d%>% 
  ggplot(aes(sampletype, phabitat, fill = lcFac)) + geom_bar(stat= 'identity') +
  scale_fill_viridis_d() + labs(x = "" , y = "Percentage of total", fill = "Land Cover") + 
  cowplot::theme_cowplot()







## ---- results = 'asis'--------------------------------------------------------
rep_tabl <- samp_com %>% 
  # mutate_at(vars(-lcFac), ~(.*study_area_size))
  mutate(`Desired Direction` = case_when(`Study Area` > `Hypothetical Sample Set` ~ "Positive",
                                         `Study Area` < `Hypothetical Sample Set` ~ "Negative", 
                                         `Study Area` == `Hypothetical Sample Set` ~ "None"), 
         `Observed Direction` =  case_when(`Sample Set + Sample Unit` > `Hypothetical Sample Set` ~ "Positive",
                                         `Sample Set + Sample Unit` < `Hypothetical Sample Set` ~ "Negative", 
                                         `Sample Set + Sample Unit` == `Hypothetical Sample Set` ~ "None"),
         `Land Cover Benefit` = case_when(`Observed Direction` == "None"~"No Benefit",
           `Desired Direction`== `Observed Direction`~ "Benefit",
         TRUE~"No Benefit"), 
         Benefit = case_when(`Land Cover Benefit`== "Benefit"~abs(`Hypothetical Sample Set` - `Sample Set + Sample Unit`)/100,
                             TRUE~0) )


knitr::kable(rep_tabl, digits = 2)

## ---- include =F, results = 'asis'--------------------------------------------
a <- sum(rep_tabl$Benefit )
b <- quick_ben(d = exampleHex%>% as_tibble %>% 
             mutate_at(.vars = vars(contains("LC")),.funs = ~(.*hexsize)), 
          samples = sample_hexes$grts_random_sample %>% 
             summarize_at(.vars = vars(contains("LC")),.funs = ~sum(.*hexsize)), 
          land_cover_summary = SA_sum %>% mutate(ha = pHab_SA*study_area_size), 
          col_ = SampleUnitID, pd=F)

print(glue::glue("The benefit is {round(a,3)}. If it is calculated using the script it is {round(b$benefit,3)}, with minor rounding difference of {a-b$benefit}"))



## ---- fig.cap ="Fig 6. Example Sample Unit benefit, calculated 100 times. Mean benefit is shown in the vertical dotted line."----

landcover_ha <- StudyArea_hexes$landcover %>% 
  mutate_at(.vars = vars(contains("LC")),.funs = ~(.*area)) %>% ungroup
att.long <- BASSr::prepare_hab_long(as_tibble(landcover_ha))

sample_hexes100 <- BASSr::draw_random_samples(att_cleaned = as_tibble(landcover_ha), 
                                           att.sf = st_centroid(landcover_ha), 
                                           num_runs = 100, nsamples = 10) 

multi_ex <- BASSr::calculate_benefit(grts_res = sample_hexes100, 
                                     HexID = SampleUnitID,
                                     att_long = att.long[att.long$SampleUnitID==exampleHex$SampleUnitID,], 
                                     q=T )

multi_exbroken <- map_df(1:100, 
                         ~quick_ben(d = exampleHex %>% as_tibble %>%
                                      dplyr::select(-geometry) %>%
                                      mutate_at(.vars = vars(contains("LC")),
                                                .funs = ~(.*hexsize)), 
          samples = sample_hexes100$grts_random_sample %>% 
            filter(run == .x) %>% 
             summarize_at(.vars = vars(contains("LC")),.funs = ~sum(.)), 
          land_cover_summary = SA_sum %>% mutate(ha = pHab_SA*study_area_size), 
          col_ = SampleUnitID, pd=F) )
  

ggplot(multi_exbroken, aes(benefit)) +
  geom_density(fill= 'grey') + 
  geom_vline(xintercept = multi_ex$benefit, linetype =2) +
  theme_minimal() +
  labs(x= "Benefit of Example Sample Unit", y = "Density") +
  xlim(0, 0.15)
  

## ----all-benefits, fig.lab = "Fig 7. Single sample set used to calculate benefit estimates across all sample units in a study area"----

one_sample <- quick_ben(
  d = StudyArea_hexes$landcover %>% as_tibble %>% 
             mutate_at(.vars = vars(contains("LC")),.funs = ~(.*hexsize)), 
          samples = sample_hexes$grts_random_sample %>% 
             summarize_at(.vars = vars(contains("LC")),.funs = ~sum(.*hexsize)), 
          land_cover_summary = SA_sum %>% mutate(ha = pHab_SA*study_area_size), 
          col_ = SampleUnitID, pd=F)

ggplot(one_sample, aes(benefit)) + 
  geom_density(fill= 'grey') + 
  geom_vline(xintercept = b$benefit, linetype =2) +
  labs(x= "Benefit", y = "Density") +
  theme_minimal() +
  xlim(0, 0.15)


## ----200iterations-1, fig.cap="Fig 7. Mean benefit distribution across 200 iterations of the benefit calculation. The mean benefit for the example hexagon is shown in the dotted line"----

set.seed(1234)
sample_hexes2 <- BASSr::draw_random_samples(att_cleaned = as_tibble(landcover_ha), 
                                           att.sf = st_centroid(landcover_ha), 
                                           num_runs = 200, nsamples = 10) 

benefits2 <- calculate_benefit(sample_hexes2, HexID = SampleUnitID,att_long =  att.long, quick = T, 
                               output = 'mean.benefit')

ggplot(benefits2, aes(benefit)) + 
  geom_density(fill= 'grey') + 
  geom_vline(xintercept = benefits2$benefit[benefits2$SampleUnitID==exampleHex$SampleUnitID], 
             linetype =2) +
  labs(x= "Benefit", y = "Density") +
  theme_minimal() +xlim(0, 0.15)



## ----200iterations-2, fig.cap="Fig 8. Mean benefit distribution across 200 iterations of the benefit calculation. The mean benefit for the example hexagon is shown in the dotted line. 20 samples are drawn per iteration"----
set.seed(1234)
sample_hexes3 <- BASSr::draw_random_samples(att_cleaned = as_tibble(landcover_ha), 
                                           att.sf = st_centroid(landcover_ha), 
                                           num_runs = 200, nsamples = 20) 

benefits3 <- calculate_benefit(sample_hexes3, HexID = SampleUnitID,att_long =  att.long, quick = T, 
                               output = 'mean.benefit')

ggplot(benefits3, aes(benefit)) + 
  geom_density(fill= 'grey') + 
  geom_vline(xintercept = benefits3$benefit[benefits3$SampleUnitID==exampleHex$SampleUnitID], 
             linetype =2) +
  labs(x= "Benefit", y = "Density") +
  theme_minimal() +xlim(0, 0.15)



## ---- fig.width=4, fig.height=4, fig.align='center', fig.cap = "Fig 9. The plotted mean benefit estimate running 200 iterations of hypothetical sample sets each of 10 sample units."----
benefit_sf <- 
ggplot(benefits2 %>% right_join(landcover_ha) %>% st_as_sf) +
  geom_sf(aes(fill = benefit)) + scale_fill_viridis_c() + theme_linedraw() +
   ggspatial::annotation_scale(location = "bl", width_hint = 0.4) 
benefit_sf

## ---- fig.width=4, fig.height=4, fig.cap = "Fig 10. Smoothed curves of how the difference between a sample unit and study area land cover percentage affects the mean benefit for that sample unit. Black line shows the smoothed curve across all land cover types, while the grey line shows the individual land cover types. Only land cover types with greater than 1\\% coverage of study area are show individually here."----
benefits2 %>% right_join(hex_LC) %>% 
  # filter(pHab_SA > 0.05) %>% 
ggplot(
  aes(#round((
    pHab - pHab_SA*100,
    # )5,1)/5, 
benefit )) +
  geom_point(alpha = 0.2, colour = 'grey')+
  geom_smooth(
    data = . %>% filter(pHab_SA > 0.01),
    aes(group = lc), 
              colour= 'darkgrey',
               alpha = 0.5, 
              se=F) +
  geom_smooth(colour = 'black') +
  theme_minimal() +
  labs(x = "Difference  in % between Sample Unit and Study Area", y = "Mean Benefit") 

# + 
#   stat_summary(fun.data = 'mean_cl_boot', geom = 'ribbon', fill = 'grey', na.rm=T, alpha = 0.5) +
#   stat_summary(fun.y = 'mean', geom = 'line') +
#   
#   theme_minimal()

## ---- fig.cap=" Fig 11. Maximum absolute difference across all land cover classes between sample unit and study area and how that relelates to benefit estimate for that hexagon."----
benefits2 %>% right_join(hex_LC) %>% 
  group_by(SampleUnitID) %>% 
  slice(which.max(abs(pHab-pHab_SA*100))) %>% 
  # filter(pHab_SA > 0.05) %>% 
ggplot(
  aes(#round((
    abs(pHab - pHab_SA*100),
    # )5,1)/5, 
benefit )) +
  geom_point(alpha = 0.2, colour = 'grey')+
 
  geom_smooth(colour = 'black') +
  theme_minimal() +
  labs(x = "Difference  in % between Sample Unit and Study Area", y = "Mean Benefit") 

## ---- fig.cap="Fig. 12. Mean absolute difference across all land cover classes between sample unit and study area and how that relelates to benefit estimate for that hexagon."----
ben_diffs <- benefits2 %>% right_join(hex_LC) %>% 
  group_by(SampleUnitID, benefit) %>% 
  summarize(phabD = mean(abs(pHab-pHab_SA*100))) %>% 
  ungroup #%>% 
  # filter(pHab_SA > 0.05) %>% 
ggplot(ben_diffs,
  aes(
    phabD,benefit )) +
  geom_point(alpha = 0.2, colour = 'grey')+
  geom_smooth(colour = 'black') +
  theme_minimal() +
  labs(x = "Mean Absolute Difference in % between Sample Unit and Study Area", y = "Mean Benefit") +
  xlim(0, 13.1)

## -----------------------------------------------------------------------------
ARU_locs <- run_grts_on_BASS(200, study_area_results = 
                    left_join(landcover_ha,benefits2) %>% 
                   mutate(inclpr = benefit),
                 30, os = 0, idcol = "StudyAreaID")

## ---- fig.cap="The number of draws a sample unit was selected out of 200 GRTS runs of 30 ARUs based on the benefit (left) and absolute difference from the study area (right)"----



z <-map(1:200,~ARU_locs[[.x]]@data %>% filter(panel == "PanelOne") %>% 
  .[["SampleUnitID"]] %>%  as.character)
z_out <- map_df(1:200,~ARU_locs[[.x]]@data %>% filter(panel == "PanelOne") %>% mutate(r = .x) )

z_200 <- 
z_out %>% group_by(SampleUnitID) %>% 
  summarize(n=n())
diff_ben <- 
left_join(ben_diffs, z_200) %>% 
  replace_na(list(n=0)) %>% 
  ggplot(aes(phabD, n)) + geom_point()+
  labs(x = "Mean absolute percentage difference from study area", y = "Number of times chosen for sampling out of 200")

ben_ben <- left_join(ben_diffs, z_200) %>% 
  replace_na(list(n=0)) %>% 
  ggplot(aes(benefit, n)) + geom_point() +
  labs(x = "Mean benefit", y = "Number of times chosen for sampling out of 200")


ben_ben + diff_ben



## -----------------------------------------------------------------------------
grts_res <- 
left_join(StudyArea_hexes$landcover, z_200) %>% 
  ggplot() +
  geom_sf(aes(fill = n)) +
  scale_fill_viridis_c()+
  theme_linedraw() +
   ggspatial::annotation_scale(location = "bl", width_hint = 0.4) 

benefit_sf+grts_res


## -----------------------------------------------------------------------------
diff_withSA_draws <- 
z_out %>% 
  pivot_longer(cols = matches("LC\\d"), values_to = "ha", names_to = "lc") %>% 
  group_by(r, lc) %>% 
  summarize(ha = sum(ha)) %>% 
  group_by(r) %>% 
  mutate(phab = ha / sum(ha)) %>% ungroup %>% 
  left_join(SA_sum, by = "lc")

ggplot(diff_withSA_draws, aes(lcc_fac, phab)) + 
  geom_point(position = position_jitter(width = 0.2), alpha = 0.5) +
  geom_point(aes(y = pHab_SA), colour = 'red', shape = "-", size = 10)+
    theme(axis.text.x = element_text(family = 'mono', 
                                   angle= 75, vjust = 1, hjust = 1))
  

## -----------------------------------------------------------------------------
errors <- diff_withSA_draws %>% 
  mutate(E = ((phab - pHab_SA))**2,
         ae = abs(phab-pHab_SA)*100) %>% 
  group_by(r) %>% 
  summarize(SSE = sum(E),
            MAE = mean(ae)) 
  ggplot(errors,aes(SSE)) +
  geom_density(fill = 'grey') +
  theme_minimal() +
  labs(x = "Sum of Squared Error from Study Area")

## -----------------------------------------------------------------------------
ggplot(errors, aes(MAE))+
    geom_density(fill = 'grey') +
  theme_minimal() +
  labs(x = "Mean Absolute Error from Study Area Percent")

