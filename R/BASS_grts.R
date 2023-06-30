### Functions associated with BASS
# David Hope
# Built from code by Nora Spencer
# 2019

#' Draw random sample
#'
#' @param use_grts Logical. Whether to use `spsurvey::grts()` or just sample
#'   randomly without spatial dispersion.
#'
#' @inheritParams common_docs
#'
#' @return Spatial data frame of samples
#' @export
#'
#' @examples
#'
#' draw_random_samples(psu_hexagons, num_runs = 1, n_samples = 10)
#'
draw_random_samples <- function(land_hex, num_runs, n_samples,
                                use_grts = TRUE,
                                crs = 4326, coords = c("lon", "lat"),
                                mindis = NULL, maxtry = 10,
                                seed = NULL, quiet = FALSE,
                                ...) {
  args <- list(...)

  # Checks
  land_hex <- check_land_hex(land_hex, crs, coords, quiet)
  check_int(num_runs, range = c(1, Inf))
  check_int(n_samples, range = c(1, Inf))
  check_int(seed, range = c(0, Inf))

  if (isTRUE(use_grts)) {

    land_hex <- check_land_hex(land_hex, crs, coords, quiet = quiet)

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

    set_seed(seed, {
      grts_output <- purrr::map(
        1:num_runs,
        ~ spsurvey::grts(sframe = land_hex,
                         # n_over = n_os,
                         n_base = n_samples,
                         # stratum_var = paste0(strat_),
                         mindis = mindis,
                         DesignID = "sample",
                         maxtry = maxtry)
      )
    })

    random_sample <- purrr::transpose(grts_output) |>
      purrr::pluck("sites_base") |>
      dplyr::bind_rows() |>
      dplyr::mutate(run = rep(1:.env$num_runs, each = .env$n_samples),
                    num_runs = .env$num_runs,
                    n_samples = .env$n_samples)

    if(!quiet) rlang::inform(
      c("i" = paste0("Finished GRTS draw of ", num_runs, " runs and ",
             n_samples, " samples")))
  }

  if (isFALSE(use_grts)) {
    set_seed(seed, {
      random_sample <- purrr::map_df(
        1:num_runs,
        ~{dplyr::slice_sample(land_hex, n = n_samples) |>
            dplyr::mutate(run = .x)})
    })
  }

  random_sample
}
