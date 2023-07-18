#' Run grts sampling on BASSr results
#'
#' Sample sites based on the cost/benefit probabilities calculated in previous
#' steps. Sites can be sampled with or without stratification.
#'
#' @param probs Data frame. Output of `calculate_inclusion_probs()` or
#'   `full_BASS_run()`.
#' @param nARUs Numeric, Data frame, Vector, or List. Number of base samples to
#'   choose. For stratification, a named vector/list of samples per stratum, or
#'   a data frame with columns `n` for samples, `n_os` for oversamples and the
#'   column matching `stratum_id`.
#' @param os Numeric, Vector, or List. Over sample size (proportional) or named
#'   vector/list of number of samples per stratum. Ignored if `nARUs` is a data
#'   frame.
#' @param remove_hexes Character Vector. Ids of hexagons to remove prior to
#'   sampling.
#'
#' @inheritParams common_docs
#' @inheritSection common_docs Extra arguments
#'
#'
#' @return If `num_runs` is 1, a single `spsurvey` object, otherwise a list of
#'   `spsurvey` objects.
#' @export
#'
#' @examples
#' d <- full_BASS_run(
#'   land_hex = psu_hexagons,
#'   num_runs = 10,
#'   n_samples = 3,
#'   costs = psu_costs,
#'   hex_id = hex_id)
#'
#' # Simple selection
#' sel <- run_grts_on_BASS(
#'   probs = d,
#'   nARUs = 5,
#'   os = 0.2)
#'
#' # Stratify
#' d <- dplyr::mutate(d, Province = c(rep("ON", 16), rep("MB", 17))) # Add Strata
#'
#' # With lists...
#' sel <- run_grts_on_BASS(
#'   probs = d,
#'   nARUs = list("ON" = 5, "MB" = 2),
#'   stratum_id = Province,
#'   os = 0.2)
#'
#' # With data frame...
#' sel <- run_grts_on_BASS(
#'   probs = d,
#'   nARUs = data.frame(Province = c("ON", "MB"),
#'                      n = c(5, 2),
#'                      n_os = c(1, 1)),
#'   stratum_id = Province)
#'
run_grts_on_BASS <- function(probs, nARUs, os = NULL, num_runs = 1,
                             hex_id = NULL, stratum_id = NULL,
                             remove_hexes = NULL, seed = NULL,
                             ...) {

  # Checks
  check_column(probs, {{ hex_id }})
  check_column(probs, {{ stratum_id }})
  check_probs(probs)
  check_int(num_runs, c(1, Inf))
  check_int(seed, c(0, Inf))

  stratum_id <- rlang::enquo(stratum_id)

  if(!rlang::is_named(os) && length(os) == 1 && (os < 0 || os > 1)) {
    rlang::abort(
      "`os` as a single value is a proportion, and must range between 0 and 1",
      call = NULL)
  }

  if(is.null(os) && !inherits(nARUs, "data.frame")) {
    rlang::abort(
      "`os` can only be NULL if nARUs is a data frame with a column `n_os`",
      call = NULL)
  }


  # Prepare samples
  if(!is.null(remove_hexes)) {
    if(rlang::quo_is_null(rlang::enquo(hex_id))) {
      rlang::abort("`hex_id` must be specified to use `remove_hexes`",
                   call = NULL)
    }

    check_column(probs, {{ hex_id }})
    probs <- dplyr::filter(probs,
                              !{{ hex_id }} %in% remove_hexes)
  }

  # Check for stratification - Create a list of problems
  s <- c(!rlang::quo_is_null(stratum_id),
         inherits(nARUs, "data.frame") | length(nARUs) > 1 | rlang::is_named(nARUs))

  # Not stratified
  if (all(!s)) {

    if(length(os) > 1) {
      rlang::abort("`os` must be a single value unless using stratification", call = NULL)
    }

    stratum_name <- NULL
    n_strata <- rep(nARUs, length(nARUs))
    n_os <- round(nARUs * os)
    if(n_os == 0) n_os <- NULL

  #Stratified
  } else {

    # Missing strata column name
    if(rlang::quo_is_null(stratum_id)) {
      abort_strat("`stratum_id` must be the column containing strata names")
    }

    # Missing appropriate nARUs object
    if(!(inherits(nARUs, "data.frame") |
         length(nARUs) > 1 |
         rlang::is_named(nARUs))) {
      abort_strat()
    }

    # Get strata columns and names
    stratum_name <- rlang::as_label(stratum_id)
    strata_vector <- probs %>% # Vector of strata
      dplyr::pull({{ stratum_id }}) %>%
      unique()


    # Get n_strata and n_os depending on inputs

    # Check data frame
    if(inherits(nARUs, "data.frame")) {

      # Problem: Miss named or wrong strata
      if(!all(names(nARUs) %in% c(stratum_name, "n", "n_os")) ||
         !all(nARUs[[stratum_name]] %in% strata_vector)) {
        abort_strat()
      }

      # Convert from data frame
      n_os <- as.list(nARUs$n_os) |>
        stats::setNames(nARUs[[stratum_name]])
      n_strata <- as.list(nARUs$n) |>
        stats::setNames(nARUs[[stratum_name]])

    } else {
      # Check list (convert if vector)
      nARUs <- as.list(nARUs)
      if(length(os) > 1) os <- as.list(os)

      # Problem: List not named correctly
      if(!(rlang::is_named(nARUs) && all(names(nARUs) %in% strata_vector))) {
        abort_strat()
      }

      # Problem: List not named correctly (and not length = 1)
      if(!((rlang::is_named(os) && all(names(os) %in% strata_vector)) ||
           length(os) == 1)) {
        abort_strat("`os` must be a single value, or a vector/list named by strata")
      }

      n_strata <- nARUs

      if(!rlang::is_named(os) && length(os) == 1) {
        n_os <- lapply(n_strata, \(x) round(x * os))

        # If all 0, use NULL
        if(all(vapply(n_os, \(x) x == 0, logical(1)))) n_os <- NULL
      } else n_os <- os
    }

    # Problem: Chose stratification, but only one strata
    if(length(n_strata) == 1 || (rlang::is_named(n_os) && length(n_os) == 1)) {
      abort_strat("There is only one stratum")
    }
  }

  s <- set_seed(seed, {
    purrr::map(
      1:num_runs,
      # Must be \(x) to use ... (otherwise ... overwritten)
      \(x) spsurvey::grts(sframe = probs,
                          n_over = n_os,
                          n_base = n_strata,
                          stratum_var = stratum_name,
                          DesignID = "sample",
                          aux_var = "inclpr",
                          ...)
    )
  })

  # If only one run
  if(length(s) == 1) s <- s[[1]]

  s
}



#' Abort during stratification
#'
#' Wrapper around `rlang::abort()` for consistent messaging when stratification
#' arguments are not correct.
#'
#' @param msg Alternative message if required (otherwise returns defaul message
#'   regarding the `nARUs` parameter)
#'
#' @noRd
abort_strat <- function(msg = NULL) {
  m <- "Not all requirements met for sampling with stratification"
  if(is.null(msg)) {
    msg <- paste0("`nARUs` must be a data frame with appropriate ",
                  "columns, or vector/list named by strata")
  }
  rlang::abort(c(m, "x" = msg), call = NULL)
}


#' Get the results from a BASS grts run
#'
#' @param grts_output Hypothetical sample set
#' @param study_area_results Study area results of BASS
#' @param nARUs Number of ARUs to deploy
#'
#' @name getresults_BASS-deprecated
NULL

#' @rdname BASSr-deprecated
#' @export
getresults_BASS <- function(grts_output, study_area_results, nARUs) {

  .Deprecated(msg = "This function is depreciated")

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
