## ----setup, include=T, warning=F, message =F----------------------------------
knitr::opts_chunk$set(
  eval=T,
  collapse = TRUE,
  comment = "#>"
)
library(BASSr)
library(ggplot2)
library(glue)
library(patchwork)
library(tidyverse)
library(sf)

ont.proj <- 3161


## ----load-data----------------------------------------------------------------




study_area_id  <- "ONT_SA_0740"

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

set.seed(2277)
exampleHex <- slice_sample(StudyArea_hexes$landcover, n = 1)

hex_LC <- 
StudyArea_hexes$landcover %>% 
  as_tibble() %>% dplyr::select(-geometry) %>% 
  pivot_longer(cols = contains("LC"), names_to = "lc", values_to = "pHab") %>% 
  left_join(SA_sum, by =c( "lc")) %>% arrange(SampleUnitID, pHab_SA) %>% 
  group_by(SampleUnitID) %>% 
  mutate(cpHab = cumsum(pHab/100)) %>% ungroup %>% 
  mutate(lc_n = as.numeric(stringr::str_extract(lc, "\\d\\d") ))

exLC <- hex_LC %>% filter(SampleUnitID %in% exampleHex$SampleUnitID)

## ----ontario-map, fig.cap='Figure 1. Map of Ontario study areas with example study area shown in red', fig.width=8, fig.height=8----
ggplot(all_study_areas) +
  geom_sf(data = ontario) +
  geom_sf(fill = 'white')+
  theme_linedraw() +
  geom_sf(data = filter(all_study_areas, StudyAreaID == study_area_id), fill = 'red')

## ---- fig.cap="Figure 2. Example sample unit hexagon (in red). Used as the focal sample unit for the next steps."----
ggplot(exampleHex) + geom_sf(fill = 'red') +
  geom_sf(data = StudyArea_hexes$landcover, fill = NA) + theme_minimal()

## ----raster-plot, fig.cap = "Figure 3. The distribution of land cover classes across an example study area."----
r <- raster::raster(system.file("extdata", glue("{study_area_id}.tif"),
  package = "BASSr", mustWork = T)) %>% 
   
  raster::as.data.frame(xy=T, long =T) %>% as_tibble() %>%
    filter(!is.na(value)) %>% 
  left_join(lcc2015_codes, by = c("value" = "LCC_CODE"))


  pal_ <- clrfile$rgb
  names(pal_) <- (clrfile$LCC_NAME)
  pal_ <- pal_[!is.na(names(pal_))]


  lc <- ggplot() + geom_raster(data = r, aes(x, y, fill = LCC_NAME)) +
    ggplot2::scale_discrete_manual(aesthetics = 'fill', values = pal_) +
    geom_sf(data = StudyArea_hexes$landcover, fill = NA) +
    labs(x = "", y = "", fill = "LCC2015") + theme_linedraw()
  
  # inplt <- ggplot() + geom_sf(data = StudyArea_hexes,
  #                             aes(fill = inclpr) ) + scale_fill_viridis_c()
  # library(patchwork)
  # lc + inplt

lc #+ ggspatial::annotation_scale(location = "bl", width_hint = 0.4) 

## ----study-area-landcover-plot, fig.cap="Figure 4. The distribution of National Land Cover Classes within example Study Area"----
exLC%>%  dplyr::select(lcc_fac, pHab_SA) %>% 
  mutate(pHab_SA = pHab_SA * 100) %>% 
  pivot_longer(names_to = "sampletype_s", values_to = "phabitat", cols = c("pHab_SA" )) %>% 
  mutate(sampletype = ifelse(sampletype_s == "pHab", "Example Sample Unit", "Study Area")) %>% 
  ggplot(aes(sampletype, phabitat, fill = lcc_fac)) + geom_bar(stat= 'identity', position = 'dodge') +
   labs(x = "" , y = "Percentage of total", fill = "Land Cover") + 
  cowplot::theme_cowplot() +
  scale_fill_manual(values = pal_)

## ----land-cover-hexes, fig.cap = "Figure 5. The cumulative proportion of land cover classes within sample hexagons (grey) and the study area (black). The red line shows the example hexagon used in the initial benefit calculation.", fig.width= 8, fig.height=12----


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


## ---- fig.cap="Figure 6. Example sample unit hexagon (in outline). Used as the focal sample unit for the next steps. See Figure 3 for legend."----
r2 <- r %>% filter(x<st_bbox(exampleHex)[[3]]&x>st_bbox(exampleHex)[[1]]&y<st_bbox(exampleHex)[[4]]&y>st_bbox(exampleHex)[[2]])
 ggplot() + geom_raster(data = r2, aes(x, y, fill = LCC_NAME)) +
    ggplot2::scale_discrete_manual(aesthetics = 'fill', values = pal_) +
    labs(x = "", y = "", fill = "LCC2015") + theme_linedraw() +
   # ggspatial::annotation_scale(location = "bl", width_hint = 0.4)  +
  geom_sf(data = exampleHex, fill =NA, colour= 'red', size = 2) + theme(legend.position = 'none')+
  coord_sf(xlim =st_bbox(exampleHex)[c(1,3)], ylim = st_bbox(exampleHex)[c(2,4)])



## -----------------------------------------------------------------------------
exLC%>%  dplyr::select(lcc_fac,pHab, pHab_SA) %>% 
  mutate(pHab_SA = pHab_SA * 100) %>% 
  pivot_longer(names_to = "sampletype_s", values_to = "phabitat", cols = c("pHab_SA", "pHab")) %>% 
  mutate(sampletype = ifelse(sampletype_s == "pHab", "Focal Sample Unit", "Study Area")) %>% 
  filter(grepl("grassland-lichen-moss",lcc_fac)) %>% 
  ggplot(aes(sampletype, phabitat, fill = lcc_fac)) + geom_bar(stat= 'identity') +
   labs(x = "" , y = "Percentage of total", fill = "Land Cover", title = exLC$LCC_NAME[grepl("grassland-lichen-moss",exLC$LCC_NAME)]) + 
  cowplot::theme_cowplot() + theme(legend.position = 'none')+
  scale_fill_manual(values = pal_) + lims(y = c(0,100))


## -----------------------------------------------------------------------------
exLC%>%  dplyr::select(lcc_fac,pHab, pHab_SA) %>% 
  mutate(pHab_SA = pHab_SA * 100) %>% 
  pivot_longer(names_to = "sampletype_s", values_to = "phabitat", cols = c("pHab_SA", "pHab")) %>% 
  mutate(sampletype = ifelse(sampletype_s == "pHab", "Focal Sample Unit", "Study Area")) %>% 
  filter(grepl("grassland-lichen-moss|Wetland",lcc_fac)) %>% 
  ggplot(aes(sampletype, phabitat, fill = lcc_fac)) + geom_bar(stat= 'identity') +
   labs(x = "" , y = "Percentage of total", fill = "Land Cover",
        title = glue::glue("{exLC$LCC_NAME[grepl('grassland-lichen-moss',exLC$LCC_NAME)]} and Wetland")) + 
  cowplot::theme_cowplot() +theme(legend.position = 'none')+
  scale_fill_manual(values = pal_) + lims(y = c(0,100))

## -----------------------------------------------------------------------------
exLC%>%  dplyr::select(lcc_fac,pHab, pHab_SA) %>% 
  mutate(pHab_SA = pHab_SA * 100) %>% 
  pivot_longer(names_to = "sampletype_s", values_to = "phabitat", cols = c("pHab_SA", "pHab")) %>% 
  mutate(sampletype = ifelse(sampletype_s == "pHab", "Focal Sample Unit", "Study Area")) %>% 
  ggplot(aes(sampletype, phabitat, fill = lcc_fac)) + 
  geom_bar(stat= 'identity') +
   labs(x = "" , y = "Percentage of total",
        fill = "Land Cover") + 
  cowplot::theme_cowplot() +
  scale_fill_manual(values = pal_)

## ----example-hex-table, results='asis'----------------------------------------

 exLC %>% dplyr::select(lcc_fac,pHab, pHab_SA) %>% 
  mutate(pHab_SA = pHab_SA * 100) %>% 
  knitr::kable(col.names = c("Land Cover", "% Example Sample Unit", "% Example Study Area"), digits = 2)


## ---- fig.cap = "Figure 5. Plot of focal sample unit (red) and the hypothetical sample set (grey) within the study area (all hexagons)."----

sample_hexes <- BASSr::draw_random_samples(att_cleaned = as_tibble(StudyArea_hexes$landcover), 
                                           att.sf = st_centroid(StudyArea_hexes$landcover), 
                                           num_runs = 1, nsamples = 10) 
if(packageVersion("spsurvey")<5){
sample_hexes_sf <- StudyArea_hexes$landcover %>% 
  filter(SampleUnitID %in% (sample_hexes$random_sample %>% filter(panel == "PanelOne"))$SampleUnitID)
} else{
  sample_hexes_sf <- StudyArea_hexes$landcover %>% 
  dplyr::filter(SampleUnitID %in% (sample_hexes$random_sample %>% filter(siteuse == "Base"))$SampleUnitID)
}
hex_wHHS <- 
ggplot(exampleHex) + geom_sf(fill = 'red') +
  geom_sf(data = StudyArea_hexes$landcover, fill = NA) + 
  geom_sf(data = sample_hexes_sf, fill = 'grey')+
  theme_minimal()

hex_wHHS

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
         pHab_SA = pHab_SA * 100) %>% 
  dplyr::select(lcc_fac,pHab, pHab_samp, pHab_Sample_plus_hex, pHab_SA )

names(samp_com) <- c("lcFac", "Focal Sample Unit",  "Hypothetical Sample Set", "Sample Set + Sample Unit","Study Area")


d <- 
  samp_com %>%  
  pivot_longer(names_to = "sampletype", values_to = "phabitat", cols = -lcFac) %>% 
  mutate(sampletype = factor(sampletype, levels = c("Focal Sample Unit", "Hypothetical Sample Set", "Sample Set + Sample Unit", "Study Area")))
                               # c("Hexagon",  "Sample", "Sample + Hex","Study Area")))
plot_single <- function(x) {d%>% filter(lcFac == names(pal_[x])) %>% 
  ggplot(aes(sampletype, phabitat)) + 
  geom_bar(stat= 'identity', fill =pal_[x]) +
  # scale_fill_viridis_d() + 
   # scale_fill_manual(values = pal_)+
  labs(x = "" , y = "Percentage of total", fill = "Land Cover", title = names(pal_[x])) + 
    geom_text(aes(label = glue::glue("{round(phabitat,1)} %")), position = position_nudge(y = -1))+
  cowplot::theme_cowplot()}

## -----------------------------------------------------------------------------
hexplot <- function(fill_){ggplot(exampleHex) + geom_sf(fill = fill_) +
  theme(panel.background =  element_blank(),
        axis.ticks = element_blank(),
        axis.text = element_blank())}
hhs_plot <- 
ggplot( StudyArea_hexes$landcover) + geom_sf(fill = NA, colour = 'white') +
  cowplot::theme_cowplot() +
  theme(axis.text = element_blank(), axis.line = element_blank(),
        axis.ticks = element_blank())
  

key_row <- (hhs_plot + geom_sf(data = exampleHex, fill = 'red')) +
  hhs_plot + geom_sf(data =  sample_hexes_sf) + 
  (hhs_plot + geom_sf(data = exampleHex, fill = 'red') + geom_sf(data = sample_hexes_sf)) +
     hhs_plot +geom_sf(fill = NA) +
  plot_layout(ncol = 4)

# (hex_wHHS + theme(axis.text = element_blank())) / 
  
(plot_single(8)  / ( key_row ) )  + plot_layout(heights = c(2,1))


## -----------------------------------------------------------------------------
(plot_single(14)  / ( key_row ) ) + plot_layout(heights = c(2,1))


## ---- fig.cap = "Figure 6. Distribution of land cover by focal sample unit, hypothetical sample set, hypothetical sample set plus focal sample unit and study area", fig.width=14, fig.height=8----
fullplot <- d%>% 
  ggplot(aes(sampletype, phabitat, fill = lcFac)) + geom_bar(stat= 'identity') +
  scale_fill_manual(values = pal_)+ labs(x = "" , y = "Percentage of total", fill = "Land Cover") + 
  cowplot::theme_cowplot()
(fullplot  / ( key_row ) ) + plot_layout(heights = c(2,1))


## -----------------------------------------------------------------------------

knitr::kable(samp_com, digits = 2)

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
         benefit = case_when(`Land Cover Benefit`== "Benefit"~abs(`Hypothetical Sample Set` - `Sample Set + Sample Unit`)/100,
                             TRUE~0) ) %>% 
  mutate(Benefit = ifelse(benefit == 0,"0", ifelse(benefit<0.001, "<0.001", as.character(round(benefit,3))))) 


knitr::kable(rep_tabl %>%
  dplyr::select(-benefit), digits = 2)

## ---- include =F, results = 'asis'--------------------------------------------
a <- sum(rep_tabl$benefit )
b <- quick_ben(d = exampleHex%>% as_tibble %>% 
             mutate_at(.vars = vars(contains("LC")),.funs = ~(.*hexsize)), 
          samples = sample_hexes$random_sample %>% 
            st_drop_geometry() |> 
             summarize_at(.vars = vars(contains("LC")),.funs = ~sum(.*hexsize)), 
          land_cover_summary = SA_sum %>% mutate(ha = pHab_SA*study_area_size), 
          col_ = SampleUnitID, pd=F)

print(glue::glue("The benefit is {round(a,3)}. If it is calculated using the script it is {round(b$benefit,3)}, with minor rounding difference of {a-b$benefit}"))



## ---- fig.cap ="Figure 7. Example focal sample unit benefit, calculated using 200 randomly drawn hypothetical sample sets. Mean benefit is shown in the vertical dotted line."----

landcover_ha <- StudyArea_hexes$landcover %>% 
  mutate_at(.vars = vars(contains("LC")),.funs = ~(.*area)) %>% ungroup
att.long <- BASSr::prepare_hab_long(as_tibble(landcover_ha))
set.seed(1234)
sample_hexes200 <- BASSr::draw_random_samples(att_cleaned = as_tibble(landcover_ha), 
                                           att.sf = st_centroid(landcover_ha), use_grts = F,
                                           num_runs = 200, nsamples = 10) 

multi_ex <- BASSr::calculate_benefit(grts_res = sample_hexes200, 
                                     HexID = SampleUnitID,
                                     att_long = att.long[att.long$SampleUnitID==exampleHex$SampleUnitID,], 
                                     q=T )

multi_exbroken <- purrr::map_df(1:200, 
                         ~quick_ben(d = exampleHex %>% as_tibble %>%
                                      dplyr::select(-geometry) %>%
                                      mutate_at(.vars = vars(contains("LC")),
                                                .funs = ~(.*hexsize)), 
          samples = sample_hexes200$random_sample %>% 
            st_drop_geometry() |> 
            filter(run == .x) %>% 
             summarize_at(.vars = vars(contains("LC")),.funs = ~sum(.)), 
          land_cover_summary = SA_sum %>% mutate(ha = pHab_SA*study_area_size), 
          col_ = SampleUnitID, pd=F) )
  

ggplot(multi_exbroken, aes(benefit)) +
  geom_density(fill= 'grey') + 
  geom_vline(xintercept = multi_ex$benefit, linetype =2) +
  theme_minimal() +
  labs(x= "Benefit of Example Sample Unit", y = "Density") +
  xlim(0, 0.15) +
  geom_text(aes(x = multi_ex$benefit +0.004, y = 16), label = "bar(beta)[j]", parse = T)
  

## ----all-benefits, fig.lab = "Figure 8. Single hypothetical sample set used to calculate benefit estimates across all sample units in a study area"----

one_sample <- quick_ben(
  d = StudyArea_hexes$landcover %>% as_tibble %>% 
             mutate_at(.vars = vars(contains("LC")),.funs = ~(.*hexsize)), 
          samples = sample_hexes$random_sample %>% 
    st_drop_geometry() |> 
             summarize_at(.vars = vars(contains("LC")),.funs = ~sum(.*hexsize)), 
          land_cover_summary = SA_sum %>% mutate(ha = pHab_SA*study_area_size), 
          col_ = SampleUnitID, pd=F)

ggplot(one_sample, aes(benefit)) + 
  geom_density(fill= 'grey') + 
  geom_vline(xintercept = multi_ex$benefit, linetype =2) +
  labs(x= "Benefit", y = "Density") +
  theme_minimal() +
  xlim(0, 0.15)  + 
  geom_text(aes(x = multi_ex$benefit +0.01, y = 16), label = "bar(beta)[example]", parse = T)


## ----200iterations-1, fig.cap="Figure 9. Distribution across all sample units in a study area of the mean benefit calculated using 200 randomly drawn (with replacment; black) hypothetical sample sets or 100 hypothetical sample sets (grey), each consisting of 10 sample units. The mean benefit for the example focal sample unit described above is shown in the dotted line"----

# set.seed(1234)
# sample_hexes2 <- BASSr::draw_random_samples(att_cleaned = as_tibble(landcover_ha), 
#                                            att.sf = st_centroid(landcover_ha), 
#                                            num_runs = 200, nsamples = 10) 

benefits2 <- calculate_benefit(sample_hexes200, HexID = SampleUnitID,att_long =  att.long, quick = T, 
                               output = 'mean.benefit')

sample_hexes100 <- list(random_sample = sample_hexes200$random_sample %>%  filter(run <=100),
                        random_sample_long = sample_hexes200$random_sample_long %>%  filter(run <=100))

benefits1 <- calculate_benefit(sample_hexes100, HexID = SampleUnitID,att_long =  att.long, quick = T, 
                               output = 'mean.benefit')

ggplot(benefits2, aes(benefit)) + 
  geom_density(fill= 'black', alpha = 1) + 
  geom_density(data = benefits1,fill= 'grey', alpha = 0.5) +
  geom_vline(xintercept = benefits2$benefit[benefits2$SampleUnitID==exampleHex$SampleUnitID], 
             linetype =2) +
  labs(x= "Benefit", y = "Density") +
  theme_minimal() +xlim(0, 0.15)








## ----200iterations-2, fig.cap="Figure 10. Distribution of mean benefit distribution across all sample units. Calculation of benefit completed using 200 randomly drawn hypothetical sample sets of 20 sample units each (grey distribution).This is compared with the distribution of 200 sample sets of 10 sample units each (black distribution). The mean benefit for the example hexagon with sample sets of 20 sample units is shown in the dotted line."----
set.seed(1234)
sample_hexes3 <- BASSr::draw_random_samples(att_cleaned = as_tibble(landcover_ha), 
                                           att.sf = st_centroid(landcover_ha), 
                                           use_grts = F,
                                           num_runs = 200, nsamples = 20) 

benefits3 <- calculate_benefit(sample_hexes3, HexID = SampleUnitID,att_long =  att.long, quick = T, 
                               output = 'mean.benefit')

ggplot(benefits3, aes(benefit)) + 
  geom_density(data = benefits2, fill = 'black') + 
  geom_density(fill= 'grey', alpha = 0.5) + 
  geom_vline(xintercept = benefits3$benefit[benefits3$SampleUnitID==exampleHex$SampleUnitID], 
             linetype =2) +
  labs(x= "Benefit", y = "Density") +
  theme_minimal() +xlim(0, 0.15)



## ---- fig.width=4, fig.height=4, fig.align='center', fig.cap = "Figure 11. The plotted mean benefit estimate running 200 iterations of hypothetical sample sets each of 10 sample units."----
benefit_sf <- 
ggplot(benefits2 %>% right_join(landcover_ha) %>% st_as_sf) +
  geom_sf(aes(fill = benefit)) + scale_fill_viridis_c() + theme_linedraw() +
  geom_sf(data = exampleHex, fill = NA, colour = 'red')#+
   # ggspatial::annotation_scale(location = "bl", width_hint = 0.4) 
benefit_sf

