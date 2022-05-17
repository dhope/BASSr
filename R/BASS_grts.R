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
draw_random_samples <- function(att_cleaned, att.sf, num_runs, nsamples,use_grts = TRUE, ...) {
  args <- list(...)
  if(isTRUE(use_grts)){
  if(packageVersion("spsurvey")<5){
  equaldesgn <- list(None = list # a list named 'None" that contains:
  (
    panel = c(PanelOne = nsamples), # panelOne indicates the number of samples you want
    seltype = "Equal"
  )) # equal probability sample

  invisible(capture.output(grts_output <- purrr::map(
    1:num_runs,
    ~ grts(
      design = equaldesgn, ## selects the reference equaldesgn object
      src.frame = "sf.object", # the sample frame is coming from a shapefile
      sf.object = att.sf, # the shape file used
      att.frame = att_cleaned, # attribute data frame
      type.frame = "finite", # type-area vs linear
      DesignID = "sample", # the prefix for each point name
      shapefile = FALSE,
    ) # no shapefile created here, will be created below)
  )))

  grts_random_sample <- as.list(grts_output) |>
    do.call("rbind", .) |>
    as_tibble() |>
    mutate(run = rep(1:num_runs, each = nsamples), num_runs = num_runs, nsamples = nsamples)

  }
  if(packageVersion("spsurvey")>=5){
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

    invisible(capture.output(grts_output <- purrr::map(
      1:num_runs,
      ~ spsurvey::grts(sframe = att.sf,
                           # n_over = n_os,
                           n_base = nsamples,
                           # stratum_var = paste0(strat_),
                           mindis = mindis,
                           DesignID = "sample",
                           maxtry = maxtry)
    )
    )
    )

    grts_random_sample <- purrr::transpose(grts_output) |>
      purrr::pluck("sites_base") |>
      bind_rows() |>
      mutate(run = rep(1:num_runs, each = nsamples), num_runs = num_runs, nsamples = nsamples)


  }
  grts_random_sample_long <- pivot_longer(grts_random_sample,
                                          cols = matches("LC\\d"),
                                          names_to = "lc", values_to = "ha"
  )

  message(glue::glue("Finished GRTS draw of {num_runs} runs and {nsamples} samples\n\r"))
  return(list(random_sample = grts_random_sample, random_sample_long = grts_random_sample_long))
  }
  if(isFALSE(use_grts)){
    random_sample <- purrr::map_df(1:num_runs, ~{dplyr::slice_sample(att.sf, n = nsamples) |>
      dplyr::mutate(run = .x)} )

    random_sample_long <- pivot_longer(random_sample,
                                       cols = matches("LC\\d"),
                                       names_to = "lc", values_to = "ha"
    )

    return(list(random_sample = random_sample,
                random_sample_long = random_sample_long))


  }


}
