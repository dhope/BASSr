#' Run grts sampling on BASSr results
#'
#' @param n_grts_tests Number of times to draw arus from grts
#' @param study_area_results BASSr results
#' @param nARUs Number of samples
#' @param os Over sample size (proportional)
#' @param idcol Identification column for units
#'
#' @return
#' @export
#'
run_grts_on_BASS <- function(n_grts_tests, study_area_results,nARUs, os, idcol) {
  if(is.list(study_area_results)){
    if(!is_null(study_area_results$inclusionPr)){
      attframe <- study_area_results$inclusionPr
    }
    if (is_null(study_area_results$inclusionPr)){
  fbr_t <- study_area_results %>% transpose()
  attframe <- fbr_t %>% .[['inclusion_probs']] %>% do.call('rbind',.) %>% as_tibble %>%
    dplyr::select(-geometry) %>% filter(!is.na(X))
  }
    } else{
    attframe <- study_area_results
  }
  Stratdesgn <- rep(list(PanelOne = list # a list named 'None" that contains:
                         (
                           panel = c(PanelOne = rep(nARUs)),
                           over = rep(nARUs*os) , # panelOne indicates the number of samples you want
                           seltype = "Continuous"
                         )) ,length( unique(attframe[[idcol]] )))
  names(Stratdesgn) <- unique(attframe[[idcol]])

  invisible(capture.output(grts_output <- map(
    1:n_grts_tests,
    ~ grts(
      design = Stratdesgn, ## selects the reference equaldesgn object
      src.frame = "att.frame", # the sample frame is coming from a shapefile
      sf.object = att.sf, # the shape file used
      att.frame = attframe, # attribute data frame
      type.frame = "finite", # type-area vs linear
      DesignID = "sample", # the prefix for each point name
      xcoord = "X",
      ycoord = "Y",
      stratum = idcol,
      mdcaty = 'inclpr',
      shapefile = FALSE,
    ) # no shapefile created here, will be created below)
  ) ))

  grts_output
}


#' Get the results from a BASS grts run
#'
#' @param grts_output
#' @param study_area_results
#' @param nARUs
#'
#' @return
#' @export
#'
#' @examples
getresults_BASS <- function(grts_output, study_area_results,  nARUs) {
  fbr_t <- study_area_results %>% transpose()
  landcover <- fbr_t %>% .[["landcover"]]
  studyareas <-fbr_t$study_area %>% do.call("c",.)
  sa_habsum <- map_df(1:length(study_area_results), ~as_tibble(landcover[[.x]])) %>% dplyr::select(-geometry, -X, -Y) %>%
    pivot_longer(cols = matches("LC\\d"),names_to = "LC", values_to = "hab_ha",values_drop_na = F) %>%
    mutate(hab_ha = replace_na(hab_ha, 0)) %>%
    group_by(StudyAreaID) %>% mutate(totalHA = sum(hab_ha, na.rm=T)) %>%
    group_by(StudyAreaID, LC) %>%
    summarize(pHab_SA = sum(hab_ha)/mean(totalHA)) %>% ungroup

  printphab <- function(saN, nARUs){
    # sa <- calculate_metrics(saN)
    # sa_df <- sa$r_df %>%
    #             mutate(LC_all = glue::glue("LC{stringr::str_pad(value, width= 2, pad = 0)}"))
    sa <- (landcover[[saN]]$StudyAreaID %>% unique())
    fixgrtsout <- function(i, saN,nARUs){
      invisible(capture.output(spbal <- spsurvey::spbalance(grts_output[[i]],
                                   grts_output[[i]]@data %>%
                                     left_join(st_centroid(landcover[[saN]]),.) %>%
                                     filter(panel == "PanelOne" &
                                              StudyAreaID == sa) ,
                                   tess_ind = F,
                                   sbc_ind = T)))

      grts_output[[i]]@data %>% right_join(landcover[[saN]]) %>%
        filter(panel == "PanelOne" & StudyAreaID == sa) %>%
        pivot_longer(names_to = "LC", values_to = "pHab", cols = matches("LC\\d")) %>%
        group_by(StudyAreaID ) %>% mutate(totalsamplehab = sum(pHab, na.rm=T)) %>%
        group_by(StudyAreaID, LC) %>% summarize(pHab = sum(pHab/totalsamplehab)) %>%
        mutate(run = i, spbal = spbal$sbc$J_subp, sa = sa, samplesize = nARUs) %>%
        left_join(sa_habsum, by = c("StudyAreaID", "LC"))

    }

    outputs <- map_df(1:length(grts_output), fixgrtsout, saN = saN, nARUs = nARUs)

    plt <- ggplot(outputs, aes(LC, pHab)) + geom_point() +
      geom_point(data = sa_habsum %>% filter(StudyAreaID == sa) ,
                 shape = "-", size = 5,
                aes( y=pHab_SA), colour = 'red') +
      facet_wrap(~StudyAreaID)+
      labs(title = glue::glue("SA - {sa}, Samples = {nARUs}") )

    list(plot = plt, outputs = outputs)
  }

  summary_lccsamples <- map(1:length(studyareas), printphab, nARUs = nARUs)

  library(patchwork)
  plots_lccsamples <- summary_lccsamples %>% purrr::transpose(.) %>% .[['plot']]



  outputs_all <- summary_lccsamples %>% purrr::transpose(.) %>% .[['outputs']] %>% do.call('rbind',.)

  spbalPlot <-   outputs_all  %>% group_by(run, sa) %>% summarize(spbal = mean(spbal)) %>%
    ggplot(aes(sa, spbal)) + geom_boxplot() + labs(y = "Spatial Balance (Pielou Evenness)",
                                                   x = "Study Area") +
    geom_abline(slope = 0,intercept = 1, linetype = 2)

  sse <- outputs_all %>% group_by(StudyAreaID, run) %>% mutate(ssHab = sum((pHab - pHab_SA)**2, na.rm=T)) %>%
    group_by(StudyAreaID, LC, run) %>% mutate(serHab = sum((pHab - pHab_SA)**2, na.rm=T)) %>%
    group_by(StudyAreaID, LC) %>% mutate(SSEbyhab = sum((pHab - pHab_SA)**2, na.rm=T)) %>% ungroup#

  sse_plot <-   sse %>%
    filter(StudyAreaID != "ONT_SA_0210") %>%
    ggplot(aes(StudyAreaID, serHab)) +
    # geom_point(alpha  = 0.5,aes(colour = LC),
    # position = position_jitter(width =0.1, height = 0)) +
    stat_summary(size = 3, aes(y = serHab, fill = LC), fun.y='mean', geom='bar', position = 'stack') +
    stat_summary(size = 3, aes(y = ssHab), fun.y='mean', geom='point', position = position_dodge(width = 0.2)) +
    scale_fill_viridis_d() + labs(y = "Mean across runs of SSE by Habitat")


  return(list(outputs  = outputs_all, pwplots = plots_lccsamples, sbpalPlot = spbalPlot, sse = sse, see_plot = sse_plot))


}
