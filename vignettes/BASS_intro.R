## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  eval=T,
  collapse = TRUE,
  comment = "#>", 
  fig.width = 8
)
library(tidyverse)
library(sf)
library(spsurvey)
library(glue)
library(BASSr)
library(patchwork)

## ----paramaters---------------------------------------------------------------
num_runs <- 3
samples <- 100

## ----filenames----------------------------------------------------------------
shape.file <- "XYhex100_LC_ha_JoyceLake"
cost.table <- "XYhex100_LC_ha_JoyceLake_z15"

## ----load-sourcefiles---------------------------------------------------------
desired_crs <- "+proj=utm +zone=15 +ellps=GRS80 +datum=NAD83 +units=m +no_defs"

att <- spsurvey::read.dbf(system.file("extdata", glue("{shape.file}.shp"),
  package = "BASSr", mustWork = T
)) %>%
  dplyr::select(-LC_9_ha) # This seems to be an error and should be cleaned prior to introducting to fuction
att.sp <- sf::st_read(system.file("extdata", glue("{shape.file}.shp"),
  package = "BASSr", mustWork = T
)) %>%
  sf::st_transform(desired_crs, check = T)
sf::st_crs(att.sp)

## ---- fig.cap="Number of hectres of Temperatue needleleaf forest (left) and open water (right)"----

(ggplot(att.sp) + geom_sf(aes(colour = LC1_ha)) ) + ggplot(att.sp) + geom_sf(aes(colour = LC18_ha))

## ----load-cost----------------------------------------------------------------
cost <- spsurvey::read.dbf(system.file("extdata", glue("{cost.table}.shp"),
  package = "BASSr", mustWork = T
)) %>% rename(NEAR_DIST = NDIST_open) # Rename for now

## ----output-names-------------------------------------------------------------
benefit_csv <- "./benefit_JoyceLake.csv"


InclProb_csv <- "./InclProb_JoyceLake.csv"


InclProb_shpfile <- "InclProb_JoyceLake"

## -----------------------------------------------------------------------------
workspace_name <- "JoyceLake_environment.rds"

## -----------------------------------------------------------------------------

ptm <- proc.time() ### records time at start of loop



## This code deletes columns 1 (HEX100K) and 5 (_NAME_)
# att2 <- att[,- c( 1, 5)]
## now lets rename the "LC9_ha" to "LC9", to make it easier for coding
# colnames(att2) <- sub( "_ha", "", names(att2) )
## change LC_99 to LC99
# colnames(att2)[25] <- "LC99"

# Now a more general version

att_cleaned <- att %>%
  # dplyr::select(-contains("100K"), -contains("NAME")) %>%
  rename_at(vars(contains("_ha")), ~ sub("_ha", "", .)) %>%
  rename_at(vars(contains("LC_")), ~ sub("LC_", "LC", .))

str(att_cleaned)

## -----------------------------------------------------------------------------

equaldesgn <- list(None = list # a list named 'None" that contains:
(
  panel = c(PanelOne = samples), # panelOne indicates the number of samples you want
  seltype = "Equal"
)) # equal probability sample

## -----------------------------------------------------------------------------

grts_output <- map(
  1:num_runs,
  ~ grts(
    design = equaldesgn, ## selects the reference equaldesgn object
    src.frame = "sf.object", # the sample frame is coming from a shapefile
    sf.object = att.sp, # the shape file used
    att.frame = att_cleaned, # attribute data frame
    type.frame = "finite", # type-area vs linear
    DesignID = "sample", # the prefix for each point name
    shapefile = FALSE
  ) # no shapefile created here, will be created below)
)


grts_random_sample <- as.list(grts_output) %>%
  do.call("rbind", .) %>%
  as_tibble() %>%
  mutate(run = rep(1:num_runs, each = samples))

## -----------------------------------------------------------------------------

grts_random_sample_long <- pivot_longer(grts_random_sample,
  cols = matches("LC\\d"),
  names_to = "lc", values_to = "ha"
)

## -----------------------------------------------------------------------------

land_cover_summary <- att_cleaned %>%
  summarize_at(vars(matches("LC\\d")), sum) %>%
  pivot_longer(cols = everything(), names_to = "lc", values_to = "ha") %>%
  mutate(total_phab = ha / sum(ha))


att_cleaned_long <- pivot_longer(att_cleaned,
  cols = matches("LC\\d"),
  names_to = "lc", values_to = "ha"
) %>%
  left_join(land_cover_summary %>%
    rename(ha_total = ha), by = "lc")

## -----------------------------------------------------------------------------
grts_random_sample_summary <-
  grts_random_sample_long %>%
  group_by(run, lc) %>%
  summarize(ha_random = sum(ha)) %>%
  group_by(run) %>%
  mutate(phab_random = ha_random / sum(ha_random)) %>%
  ungroup()

grts_random_sample_summary_widenest <- 
  grts_random_sample %>% 
  group_by(run) %>% 
  summarize_at(vars(matches("LC\\d")), sum ) %>%
  mutate(cat = "cat") %>% ungroup %>% 
  group_by(cat, run) %>%
  nest() %>%
  ungroup()


nested_random_samples <-
  grts_random_sample %>%
  mutate(cat = "cat") %>%
  group_by(cat, run) %>%
  nest() %>%
  ungroup()

## ---- eval = F----------------------------------------------------------------
#  start_time <- Sys.time()
#  hexagon_adjustment_df <-
#    att_cleaned_long %>%
#    mutate(cat = "cat") %>%
#    as_tibble() %>%
#    left_join(
#      nested_random_samples,
#      by = "cat"
#    ) %>%
#    dplyr::select(-cat) %>%
#    mutate(ha_adjust = pmap(., function(data, lc, ha, ...) sum(data[, lc], na.rm = T) + ha)) %>%
#    left_join(grts_random_sample_summary, by = c("run", "lc")) %>%
#    dplyr::select(-data) %>%
#    unnest(cols = ha_adjust)
#  
#   difftime( Sys.time(),start_time)
#  start_time <- Sys.time()
#  
#  #BestHere
#  hexagon_adjustment_df2 <-
#    att_cleaned_long %>%
#    mutate(cat = "cat") %>%
#    as_tibble() %>%
#    left_join(
#      nested_random_samples,
#      by = "cat"
#    ) %>%
#    dplyr::select(-cat) %>%
#    mutate(ha_adjust = pmap(., function(data, lc, ha, ...) sumH(data[[lc]],  ha))) %>%
#    left_join(grts_random_sample_summary, by = c("run", "lc")) %>%
#    dplyr::select(-data) %>%
#    unnest(cols = ha_adjust)
#   difftime( Sys.time(),start_time)
#  start_time <- Sys.time()
#  
#  hexagon_adjustment_df3 <-
#    att_cleaned_long %>%
#    mutate(cat = "cat") %>%
#    as_tibble() %>%
#    left_join(
#      grts_random_sample_summary_widenest,
#      by = "cat"
#    ) %>%
#    dplyr::select(-cat) %>%
#    mutate(ha_adjust = pmap(., function(data, lc, ha, ...) data[[lc]]+ha)) %>%
#    left_join(grts_random_sample_summary, by = c("run", "lc")) %>%
#    dplyr::select(-data) %>%
#    unnest(cols = ha_adjust)
#  difftime( Sys.time(),start_time)
#  
#  
#  

## ---- eval =F-----------------------------------------------------------------
#  hexagon_benefits_by_run_andLC <- hexagon_adjustment_df2 %>%
#    group_by( run) %>%
#    mutate(random_total_hab = sum(ha_adjust)) %>%
#    ungroup() %>%
#    # group_by(HEX100,run, lc, phab_random, total_phab) %>%
#    mutate(
#      phab_ran_plus1 = ha_adjust / random_total_hab,
#      desired_direction = case_when(
#        phab_random > total_phab ~ "neg",
#        phab_random < total_phab ~ "pos",
#        phab_random == total_phab ~ "none",
#        TRUE ~ ""
#      ),
#      observed_direct = case_when(
#        phab_ran_plus1 > total_phab ~ "neg",
#        phab_ran_plus1 < total_phab ~ "pos",
#        phab_ran_plus1 == total_phab ~ "none",
#        TRUE ~ ""
#      ),
#      change = phab_ran_plus1 - phab_random,
#      ben_yes_no = case_when(
#        ((change < 0 & desired_direction == "neg") | (change > 0 & desired_direction == "pos")) ~ 1,
#        ((change < 0 & desired_direction == "pos") | (change > 0 & desired_direction == "neg")) ~ 0,
#        (change == 0 & desired_direction == "none") ~ 0,
#        (change == 0 & desired_direction != "none") ~ 0,
#        (desired_direction == "none" & change != 0) ~ -956498465,
#        TRUE ~ -999999
#      ),
#      benefit = as.numeric(ben_yes_no) * abs(change)
#    ) %>%
#    group_by(run, lc, phab_random, total_phab) %>%
#    mutate(sum_hex = sum(phab_ran_plus1)) %>%
#    ungroup()

## -----------------------------------------------------------------------------


## -----------------------------------------------------------------------------

hexagon_benefits <- BASSr::quick_ben(d = att_cleaned, 
                             samples = grts_random_sample_summary_widenest$data[[1]],
                             land_cover_summary = land_cover_summary,col_ = HEX100, pd =T )


## -----------------------------------------------------------------------------
hexagon_benefits

## ---- eval=F------------------------------------------------------------------
#  
#  
#  hexagon_benefits_by_run <- hexagon_benefits_by_run_andLC %>%
#    group_by(HEX100, run) %>%
#    summarize(ben_by_run = sum(benefit, na.rm = T))
#  
#  
#  hexagon_benefits <- hexagon_benefits_by_run %>%
#    group_by(HEX100) %>%
#    summarise(benefit = mean(ben_by_run, na.rm = T)) %>%
#    filter(!is.na(benefit))
#  
#  
#  benefit.sp <- att.sp %>% left_join(hexagon_benefits, by = "HEX100")

## -----------------------------------------------------------------------------
cost_ben <- left_join(cost, hexagon_benefits,
  by = "HEX100"
) %>%
  filter(INLAKE == "NO") %>% ## delete any centroids that are in water
  ## any NA in the 'INLAKE' column will be converted to a 0
  dplyr::select(HEX100, LONG_DD, LAT_DD, NEAR_DIST, benefit) %>%
  mutate(
    RawCost = ifelse(NEAR_DIST > 1000, 5000, NEAR_DIST), ## scale the distance so anything greater than 1000m from the road is given a value of 5000
    LogCost = log10(RawCost),
    ScLogCost = LogCost / (max(LogCost, na.rm = T) + 1),
    scale_ben = benefit / max(benefit, na.rm = T),
    partIP = (1 - ScLogCost) * scale_ben, ## Inclusion probability
    inclpr = partIP / max(partIP, na.rm = T) ## scaled Inclusion probability
  )

proc.time() - ptm ### ouputs time taken for routine

## ---- eval=F------------------------------------------------------------------
#  cost_ben_sp <- cost_ben
#  ## set up the spatial dataframe
#  cost_ben_sp <- SpatialPointsDataFrame(cost_ben_sp[, c("LONG_DD", "LAT_DD")], cost_ben_sp)
#  ## set the projection for the spatial file to be written.  For a different projection use this website,
#  ## http://spatialreference.org/ --> Use the search to find coordinate system you would like.  On the 'results' page,
#  ## click on the link for the correct coordinate system you want.  You can either define the EPSG number (like this: "+init=epsg:4269" )
#  # or below I am using "Proj4" definition. Either works
#  proj4string(cost_ben_sp) <- CRS("+proj=longlat +ellps=GRS80 +datum=NAD83") ## Sets the CRS to lat/lon NAD83
#  ## use this code to project the data properly
#  cost_ben_sp <- spTransform(cost_ben_sp, CRS("+proj=utm +zone=15 +ellps=GRS80 +datum=NAD83 +units=m+no_defs"))
#  ## More details on how to select a CRS are available in BorealRep/METHODS/Boreal_Methods_R_2016May.doc
#  
#  ## write the file
#  # writeOGR(cost_ben_sp, ".", InclProb_shpfile, driver = "ESRI Shapefile")

## -----------------------------------------------------------------------------

sf_out <- att.sp %>% left_join(cost_ben)

ggplot(sf_out, aes(colour = inclpr)) + geom_sf(size = 3) + scale_colour_viridis_c() + labs(title = "Inclusion Probability")
ggplot(sf_out, aes(colour = scale_ben)) + geom_sf(size = 3) + scale_colour_viridis_c() + labs(title = "Scaled Benefit")
ggplot(sf_out, aes(colour = ScLogCost)) + geom_sf(size = 3) + scale_colour_viridis_c() + labs(title = "Scaled Cost")

