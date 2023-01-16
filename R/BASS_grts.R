### Functions associated with BASS
# David Hope
# Built from code by Nora Spencer
# 2019

#' Draw random sample
#'
#' @param att_cleaned The attribute file for hexagons. Must include Habitat Layers and hexid
#' @param att.sf The simple features shape.file object
#' @param num_runs The number of times to draw random samples from the attribute files
#' @param nsamples The number of samples to draw from each run
#' @param use_grts Logical. Indicates if should draw using GRTS or just random sample without
#'                spatial dispersion.
#'
#' @return Returns a sample output in long and wide formats.
#' @export
#'
draw_random_samples <- function(att_cleaned, att.sf, num_runs, nsamples,
                                use_grts = TRUE, ...) {
  args <- list(...)

  if (isTRUE(use_grts)) {

    mindis <-  NULL
    maxtry <-  10
    DesignID <-  "Sample"
    list2env(args, envir = environment())
    # if(length(N)==1){
    #   Stratdsgn <- rep(N, length(arus))
    #   n_os <-  round(N*os)
    #   names(Stratdsgn) <- arus
    #   if(n_os==0) n_os <- NULL
    # } else if ( all(arus %in% names(N)) ){
    #   Stratdsgn <- N
    #   if(length(os)==1){
    #     if(n_os==0){ n_os <- NULL
    #     } else  n_os <- lapply(FUN = function(x) x * os, X = N )
    #   } else if ( all(arus %in% names(N)) ){
    #     n_os <- os
    #   } else{simpleError("OS should either be single value or list with all strata ID. Not all Strata found in OS and OS has length >1")}
    # }

    grts_output <- purrr::map(
      1:num_runs,
      ~ spsurvey::grts(sframe = att.sf,
                       # n_over = n_os,
                       n_base = nsamples,
                       # stratum_var = paste0(strat_),
                       mindis = mindis,
                       DesignID = "sample",
                       maxtry = maxtry)
    )

    random_sample <- purrr::transpose(grts_output) |>
      purrr::pluck("sites_base") |>
      dplyr::bind_rows() |>
      dplyr::mutate(run = rep(1:.env$num_runs, each = .env$nsamples),
                    num_runs = .env$num_runs,
                    nsamples = .env$nsamples)

    message(glue::glue("Finished GRTS draw of {num_runs} runs and {nsamples} samples\n\r"))
  }

  if (isFALSE(use_grts)) {
    random_sample <- purrr::map_df(
      1:num_runs,
      ~{dplyr::slice_sample(att.sf, n = nsamples) |>
          dplyr::mutate(run = .x)})
  }

  random_sample_long <- tidyr::pivot_longer(
    random_sample,
    cols = dplyr::matches("LC\\d"),
    names_to = "lc",
    values_to = "ha"
  )

  list(random_sample = random_sample,
       random_sample_long = random_sample_long)
}
