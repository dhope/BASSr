#' Run grts sampling on BASSr results
#'
#' @param probs Data frame. Output of `calculate_inclusion_probs()` or
#'   `full_BASS_run()`.
#' @param nARUs Numeric vector. Number of samples or named vector of number of
#'   samples per stratum.
#' @param os Numeric vector. Over sample size (proportional) or named vector of
#'   number of samples per stratum.
#' @param remove_hexes Character Vector. Ids of hexagons to remove.
#'
#' @inheritParams common_docs
#'
#' @return
#' @export
#'
run_grts_on_BASS <- function(probs, num_runs, nARUs, os,
                             hex_id = NULL,
                             stratum_id = NULL,
                             remove_hexes = NULL, seed = NULL) {

  mindis <-  NULL
  maxtry <-  10

  check_column(probs, {{ stratum_id }})

  # Check that NOT LIST, HAS geometry
  if(!is.null(remove_hexes)) {
    if(rlang::quo_is_null(rlang::enquo(hex_id))) {
      rlang::abort("`hex_id` must be specified to use `remove_hexes`",
                   call = NULL)
    }

    check_column(probs, {{ hex_id }})
    attframe <- dplyr::filter(probs,
                              !{{ hex_id }} %in% remove_hexes)
  } else {
    attframe <- probs
  }

  stratum_id <- rlang::enquo(stratum_id)

  if (rlang::quo_is_null(stratum_id)) {
    # Not stratified
    stratum_name <- NULL

    Stratdsgn <- rep(nARUs, length(nARUs))
    n_os <-  round(nARUs*os)
    if(n_os==0) n_os <- NULL

  } else {
    #Stratified

    stratum_name <- rlang::as_label(stratum_id)

    strata_vector <- attframe %>% # Vector of strata
      dplyr::pull({{ stratum_id }}) %>%
      unique()


    ## CHECK THE FOLLOWING....
    if (all(strata_vector %in% names(nARUs))){
      Stratdsgn <- nARUs
      #if(length(os)==1){
      #  n_os <- lapply(FUN = function(x) x * os, X = nARUs )
      #  if(n_os==0) n_os <- NULL
      #} else if ( all(strata_vector %in% names(nARUs)) ){
      n_os <- os

      if(!length(os) %in% c(1, length(nARUs))) {
        rlang::abort(
          c("x" = "Not all strata found in `os`, but `os` has length > 1",
            "*" = paste0("`os` should either be single value or named vector, ",
                         "one for each stratum.")))
      }
    }  else {
      rlang::abort(
        c("x" = "Not all strata found in `nARUs`, but `nARUs` has length >1",
          "*" = paste0("`nARUs` should either be single value or named vector, ",
                       "one for each stratum.")))
    }
  }

  set_seed(seed, {
    purrr::map(
      1:num_runs,
      ~ spsurvey::grts(sframe = attframe,
                       n_over = n_os,
                       n_base = Stratdsgn,
                       stratum_var = stratum_name,
                       mindis = mindis,
                       DesignID = "sample",
                       aux_var = "inclpr",
                       maxtry = maxtry)
    )
  })
}


#' Get the results from a BASS grts run
#'
#' @param grts_output Hypothetical sample set
#' @param study_area_results Study area results of BASS
#' @param nARUs Number of ARUs to deploy
#'
#' @return
#'
getresults_BASS <- function(grts_output, study_area_results, nARUs) {
  fbr_t <- study_area_results %>% transpose()
  landcover <- fbr_t %>% .[["landcover"]]
  studyareas <- fbr_t$study_area %>% do.call("c", .)
  sa_habsum <- purrr::map_df(1:length(study_area_results), ~ as_tibble(landcover[[.x]])) %>%
    dplyr::select(-geometry, -X, -Y) %>%
    pivot_longer(cols = matches("LC\\d"), names_to = "LC", values_to = "hab_ha", values_drop_na = F) %>%
    mutate(hab_ha = replace_na(hab_ha, 0)) %>%
    group_by(StudyAreaID) %>%
    mutate(totalHA = sum(hab_ha, na.rm = T)) %>%
    group_by(StudyAreaID, LC) %>%
    summarize(pHab_SA = sum(hab_ha) / mean(totalHA)) %>%
    ungroup()

  printphab <- function(saN, nARUs) {
    # sa <- calculate_metrics(saN)
    # sa_df <- sa$r_df %>%
    #             mutate(LC_all = glue::glue("LC{stringr::str_pad(value, width= 2, pad = 0)}"))
    sa <- (landcover[[saN]]$StudyAreaID %>% unique())
    fixgrtsout <- function(i, saN, nARUs) {
      invisible(utils::capture.output(spbal <- spsurvey::spbalance(grts_output[[i]],
        grts_output[[i]]@data %>%
          left_join(st_centroid(landcover[[saN]]), .) %>%
          filter(panel == "PanelOne" &
            StudyAreaID == sa),
        tess_ind = F,
        sbc_ind = T
      )))

      grts_output[[i]]@data %>%
        right_join(landcover[[saN]]) %>%
        filter(panel == "PanelOne" & StudyAreaID == sa) %>%
        pivot_longer(names_to = "LC", values_to = "pHab", cols = matches("LC\\d")) %>%
        group_by(StudyAreaID) %>%
        mutate(totalsamplehab = sum(pHab, na.rm = T)) %>%
        group_by(StudyAreaID, LC) %>%
        summarize(pHab = sum(pHab / totalsamplehab)) %>%
        mutate(run = i, spbal = spbal$sbc$J_subp, sa = sa, samplesize = nARUs) %>%
        left_join(sa_habsum, by = c("StudyAreaID", "LC"))
    }

    outputs <- purrr::map_df(1:length(grts_output), fixgrtsout, saN = saN, nARUs = nARUs)

    plt <- ggplot(outputs, aes(LC, pHab)) +
      geom_point() +
      geom_point(
        data = sa_habsum %>% filter(StudyAreaID == sa),
        shape = "-", size = 5,
        aes(y = pHab_SA), colour = "red"
      ) +
      facet_wrap(~StudyAreaID) +
      labs(title = glue::glue("SA - {sa}, Samples = {nARUs}"))

    list(plot = plt, outputs = outputs)
  }

  summary_lccsamples <- map(1:length(studyareas), printphab, nARUs = nARUs)

  library(patchwork)
  plots_lccsamples <- summary_lccsamples %>%
    purrr::transpose(.) %>%
    .[["plot"]]



  outputs_all <- summary_lccsamples %>%
    purrr::transpose(.) %>%
    .[["outputs"]] %>%
    do.call("rbind", .)

  spbalPlot <- outputs_all %>%
    group_by(run, sa) %>%
    summarize(spbal = mean(spbal)) %>%
    ggplot(aes(sa, spbal)) +
    geom_boxplot() +
    labs(
      y = "Spatial Balance (Pielou Evenness)",
      x = "Study Area"
    ) +
    geom_abline(slope = 0, intercept = 1, linetype = 2)

  sse <- outputs_all %>%
    group_by(StudyAreaID, run) %>%
    mutate(ssHab = sum((pHab - pHab_SA)**2, na.rm = T)) %>%
    group_by(StudyAreaID, LC, run) %>%
    mutate(serHab = sum((pHab - pHab_SA)**2, na.rm = T)) %>%
    group_by(StudyAreaID, LC) %>%
    mutate(SSEbyhab = sum((pHab - pHab_SA)**2, na.rm = T)) %>%
    ungroup() #

  sse_plot <- sse %>%
    filter(StudyAreaID != "ONT_SA_0210") %>%
    ggplot(aes(StudyAreaID, serHab)) +
    # geom_point(alpha  = 0.5,aes(colour = LC),
    # position = position_jitter(width =0.1, height = 0)) +
    stat_summary(size = 3, aes(y = serHab, fill = LC), fun.y = "mean", geom = "bar", position = "stack") +
    stat_summary(size = 3, aes(y = ssHab), fun.y = "mean", geom = "point", position = position_dodge(width = 0.2)) +
    scale_fill_viridis_d() +
    labs(y = "Mean across runs of SSE by Habitat")


  return(list(outputs = outputs_all, pwplots = plots_lccsamples, sbpalPlot = spbalPlot, sse = sse, see_plot = sse_plot))
}
