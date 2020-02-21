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
#'
#' @return Returns a sample output in long and wide formats.
#' @export
#'
draw_random_samples <- function(att_cleaned, att.sf, num_runs, nsamples) {
  equaldesgn <- list(None = list # a list named 'None" that contains:
  (
    panel = c(PanelOne = nsamples), # panelOne indicates the number of samples you want
    seltype = "Equal"
  )) # equal probability sample

  invisible(capture.output(grts_output <- map(
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
  )
  ))

  grts_random_sample <- as.list(grts_output) %>%
    do.call("rbind", .) %>%
    as_tibble() %>%
    mutate(run = rep(1:num_runs, each = nsamples), num_runs=num_runs, nsamples= nsamples)

  grts_random_sample_long <- pivot_longer(grts_random_sample,
    cols = matches("LC\\d"),
    names_to = "lc", values_to = "ha"
  )

  cat(glue::glue("Finished GRTS draw of {num_runs} runs and {nsamples} samples\n\r"))

  return(list(grts_random_sample = grts_random_sample, grts_random_sample_long = grts_random_sample_long))
}
