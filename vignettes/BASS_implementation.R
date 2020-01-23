## ----setup, include = T-------------------------------------------------------
knitr::opts_chunk$set(
  eval=T,
  collapse = TRUE,
  fig.width = 8,
  comment = "#>"
)
library(tidyverse)
library(sf)
library(spsurvey)
library(glue)
library(BASSr)

## -----------------------------------------------------------------------------
shape.file <- "XYhex100_LC_ha_JoyceLake"
cost.table <- "XYhex100_LC_ha_JoyceLake_z15"

## -----------------------------------------------------------------------------
desired_crs <- "+proj=utm +zone=15 +ellps=GRS80 +datum=NAD83 +units=m +no_defs"

att <- spsurvey::read.dbf(system.file("extdata", glue("{shape.file}.shp"),
  package = "BASSr", mustWork = T
)) %>%
  dplyr::select(-LC_9_ha) %>% # This seems to be an error and should be cleaned prior to introducting to fuction
  rename_at(vars(contains("_ha")), ~ sub("_ha", "", .)) %>%
  rename_at(vars(contains("LC_")), ~ sub("LC_", "LC", .))

att.sp <- sf::st_read(system.file("extdata", glue("{shape.file}.shp"),
  package = "BASSr", mustWork = T
)) %>%
  sf::st_transform(desired_crs, check = T)
sf::st_crs(att.sp)

cost <- spsurvey::read.dbf(system.file("extdata", glue("{cost.table}.shp"),
  package = "BASSr", mustWork = T
)) %>% rename(NEAR_DIST = NDIST_open) # Rename for now

## -----------------------------------------------------------------------------
glimpse(att)

## -----------------------------------------------------------------------------
glimpse(cost)

## -----------------------------------------------------------------------------

grts_output <- draw_random_samples(att_cleaned = att, att.sf = att.sp, num_runs = 3, nsamples = 10)
glimpse(grts_output$grts_random_sample)

## ----benefits, fig.align='center'---------------------------------------------

att_cleaned_long <- prepare_hab_long(att)

# 
benefits <- calculate_benefit(grts_res = grts_output,
                              att_long = att_cleaned_long, output = "all", HexID = HEX100)
benefits2 <- calculate_benefit(grts_res = grts_output, 
                               att_long = att_cleaned_long, 
                               output = "nall", quick =T, 
                               HexID = HEX100)

bd <- 
benefits$hexagon_benefits %>% left_join(benefits2, by = 'HEX100') %>% 
  mutate(bd = benefit.x - benefit.y)
  ggplot(bd,aes(benefit.x, benefit.y)) + geom_point()
bd$bd %>% hist


plot(benefits$hexagon_benefits$benefit %>% sort, benefits2$benefit %>% sort)


# ggplot(benefits$hexagon_benefits_by_run_andLC, aes(HEX100, benefit)) +
#   geom_point(alpha = 0.2, aes(colour = run)) +
#   theme(axis.text.x = element_blank()) + facet_wrap(~lc) 


ggplot(benefits2, aes(HEX100, benefit)) +
  geom_point(alpha = 0.2) +
  theme(axis.text.x = element_blank()) 

## ---- eval=F------------------------------------------------------------------
#  ggplot(benefits$hexagon_benefits_by_run, aes(ben_by_run, fill = as.factor(run))) + geom_density(alpha = 0.5)

## ---- eval=F------------------------------------------------------------------
#  ggplot(benefits$hexagon_benefits_by_run_andLC, aes(total_phab, ha, size = benefit, colour = lc) )+ geom_point() +
#    scale_size_area()
#  

## -----------------------------------------------------------------------------
hsp <- left_join(att.sp,benefits2)  
hsp[c("X", "Y")] <-  st_coordinates(hsp)
pointswith_inclusion <- calculate_inclusion_probs(cost = cost %>% mutate(INLAKE = ifelse(INLAKE == "YES",T,F)), 
                                                  hexagon_benefits = hsp,
                                                  #benefits$hexagon_benefits, 
                                                  HexID = HEX100)

glimpse(pointswith_inclusion)

## -----------------------------------------------------------------------------
left_join(att, pointswith_inclusion) %>% 
  ggplot(aes(LC1, inclpr)) + geom_point() +
  geom_point(colour = 'red', aes(x = LC9), alpha = 0.5) +
  labs(x = "Land Cover 1 (Clear Open Water) and Land Cover 9 (Coniferous Swamp; red)", y = "Inclusion probability")

## -----------------------------------------------------------------------------
ggplot(pointswith_inclusion, aes(benefit, inclpr, colour = ScLogCost)) + geom_point() +
  scale_colour_viridis_c()

## ----full-run, eval=F---------------------------------------------------------
#  att[c("X", "Y")] <-  st_coordinates(att.sp)
#  att.sp[c("X", "Y")] <-  st_coordinates(att.sp)
#  cost[c("X", "Y")] <-  st_coordinates(att.sp)
#  inclusions <- full_BASS_run(num_runs = 3, nsamples = 20,
#                              att = as_tibble(att),
#                              att.sp = att.sp,
#                              cost = as_tibble(cost) %>% mutate(INLAKE = ifelse(INLAKE == "YES",T,F)), HexID = HEX100, q = T)
#  glimpse(inclusions)

## -----------------------------------------------------------------------------
ggplot(pointswith_inclusion, aes(inclpr)) + geom_density(fill = "red", alpha = 0.5)# +
  # geom_density(data = inclusions, fill = "purple", alpha = 0.5)

