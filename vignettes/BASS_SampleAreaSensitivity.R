## -----------------------------------------------------------------------------

knitr::opts_chunk$set(eval=F)
library(BASSr)
library(tidyverse)
library(patchwork)

## -----------------------------------------------------------------------------
#  studyarea <- purrr::transpose(fbr_study_area_test)$study_area %>% do.call('c',.)
#  test_sa <- c("0322", "0740", "0404","0165","0247")#, "0197")
#  allhexes <- read_rds("output/NOntario_BASS_hexes.rds")
#  studyareas <-  allhexes$StudyAreas%>% filter(grepl(glue_collapse( test_sa,"|"), StudyAreaID))
#  rm(allhexes)

## -----------------------------------------------------------------------------
#  lcc2015 <- "//int.ec.gc.ca/sys/InGEO/GW/EC1130MigBirds_OiseauxMig/ON_CWS/THEMES/BMS_ON/SANDBOX/dhdev/OnBMS/spatial/NontariobrandtLCC2015_reproj.tif"
#  fbr_study_area_test <- read_rds("output/study_area_test_results.rds")
#  fbr_t <- fbr_study_area_test %>% transpose()
#  
#  attframe <- fbr_t %>% .[['inclusion_probs']] %>% do.call('rbind',.) %>% as_tibble %>%
#    dplyr::select(-geometry) %>% filter(!is.na(X))
#  nARUs <- 20
#  os <- 0.5
#  num_runs <- 100
#  
#   Stratdesgn <- rep(list(PanelOne = list # a list named 'None" that contains:
#    (
#      panel = c(PanelOne = rep(nARUs)),over = rep(nARUs*os) , # panelOne indicates the number of samples you want
#      seltype = "Continuous"
#    )) ,5)
#   names(Stratdesgn) <- unique(attframe$StudyAreaID)
#  
#    grts_output <- map(
#      1:num_runs,
#      ~ grts(
#        design = Stratdesgn, ## selects the reference equaldesgn object
#        src.frame = "att.frame", # the sample frame is coming from a shapefile
#        sf.object = att.sf, # the shape file used
#        att.frame = attframe, # attribute data frame
#        type.frame = "finite", # type-area vs linear
#        DesignID = "sample", # the prefix for each point name
#        xcoord = "X",
#        ycoord = "Y",
#        stratum = "StudyAreaID",
#        mdcaty = 'inclpr',
#        shapefile = FALSE,
#      ) # no shapefile created here, will be created below)
#    )
#  

## -----------------------------------------------------------------------------
#  landcover <- fbr_t %>% .[["landcover"]]
#  sa_habsum <- map_df(1:5, ~as_tibble(landcover[[.x]])) %>% dplyr::select(-geometry, -X, -Y) %>%
#    pivot_longer(cols = matches("LC\\d"),names_to = "LC", values_to = "hab_ha",values_drop_na = F) %>%
#    mutate(hab_ha = replace_na(hab_ha, 0)) %>%
#    group_by(StudyAreaID) %>% mutate(totalHA = sum(hab_ha, na.rm=T)) %>%
#    group_by(StudyAreaID, LC) %>%
#    summarize(pHab_SA = sum(hab_ha)/mean(totalHA)) %>% ungroup
#  
#  studyareas$StudyAreaID
#  printphab <- function(saN,ss=20){
#    # sa <- calculate_metrics(saN)
#    # sa_df <- sa$r_df %>%
#    #             mutate(LC_all = glue::glue("LC{stringr::str_pad(value, width= 2, pad = 0)}"))
#    fixgrtsout <- function(i, saN){
#      spbal <- spsurvey::spbalance(grts_output[[i]],
#                        grts_output[[i]]@data %>%
#                          left_join(st_centroid(landcover[[saN]]),.) %>%
#                                       filter(panel == "PanelOne" &
#                                                StudyAreaID == studyareas$StudyAreaID[[saN]]) ,
#                        tess_ind = F,
#                        sbc_ind = T)
#  
#      grts_output[[i]]@data %>% right_join(landcover[[saN]]) %>%
#      filter(panel == "PanelOne" & StudyAreaID == studyareas$StudyAreaID[[saN]]) %>%
#      pivot_longer(names_to = "LC", values_to = "pHab", cols = matches("LC\\d")) %>%
#      group_by(StudyAreaID ) %>% mutate(totalsamplehab = sum(pHab, na.rm=T)) %>%
#      group_by(StudyAreaID, LC) %>% summarize(pHab = sum(pHab/totalsamplehab)) %>%
#      mutate(run = i, spbal = spbal$sbc$J_subp, sa = studyareas$StudyAreaID[[saN]], samplesize = ss) %>%
#        left_join(sa_habsum, by = c("StudyAreaID", "LC"))
#  
#    }
#  
#  outputs <- map_df(1:length(grts_output), fixgrtsout, saN = saN)
#  
#  plt <- ggplot(
#    outputs, aes(LC, pHab)) + geom_point() +
#    geom_line(data = sa_habsum,
#              aes(group = StudyAreaID, y = pHab_SA), colour = 'red') +
#    labs(title = glue::glue("SA - {studyareas$StudyAreaID[[saN]]}, Samples = {ss}") )
#  
#   list(plot = plt, outputs = outputs)
#   }
#  
#  summary_lccsamples <- map(1:5, printphab)
#  
#  library(patchwork)
#  plots_lccsamples <- summary_lccsamples %>% purrr::transpose(.) %>% .[['plot']]
#  plots_lccsamples[[1]] + plots_lccsamples[[2]] +
#    plots_lccsamples[[3]] + plots_lccsamples[[4]] + plots_lccsamples[[5]]
#  
#  
#  outputs_all <- summary_lccsamples %>% purrr::transpose(.) %>% .[['outputs']] %>% do.call('rbind',.)
#  
#  
#  outputs_all  %>% group_by(run, sa) %>% summarize(spbal = mean(spbal)) %>%
#    ggplot(aes(sa, spbal)) + geom_boxplot() + labs(y = "Spatial Balance (Pielou Evenness)",
#                                                   x = "Study Area") +
#    geom_abline(slope = 0,intercept = 1, linetype = 2)
#  
#  sse <- outputs_all %>% group_by(StudyAreaID, run) %>% mutate(ssHab = sum((pHab - pHab_SA)**2, na.rm=T)) %>%
#    group_by(StudyAreaID, LC, run) %>% mutate(serHab = sum((pHab - pHab_SA)**2, na.rm=T)) %>%
#    group_by(StudyAreaID, LC) %>% mutate(SSEbyhab = sum((pHab - pHab_SA)**2, na.rm=T)) %>% ungroup#
#  
#  
#  sse %>%
#    filter(StudyAreaID != "ONT_SA_0210") %>%
#    ggplot(aes(StudyAreaID, serHab)) +
#    scale_fill_viridis_d() +
#    # geom_point(alpha  = 0.5,aes(colour = LC),
#               # position = position_jitter(width =0.1, height = 0)) +
#    stat_summary(size = 3, aes(y = serHab, fill = LC), fun.y='mean', geom='bar', position = 'stack') +
#    stat_summary(size = 3, aes(y = ssHab), fun.y='mean', geom='point', position = position_dodge(width = 0.2))
#  

