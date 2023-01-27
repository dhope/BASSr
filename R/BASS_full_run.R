#' A full BASS run
#'
#' @param num_runs The number of times to draw random samples from hexagons
#' @param n_samples The number of samples to draw in each sample
#' @param costs the cost table for each hexagon id
#' @param return_all return each piece of BASS implementation
#' @param seed random seed to use for random grts samples
#' @param non_ran_set Non random set that is added to the hypothetical sample set in benefit calculation.
#' @param lakeN The land cover number to represent open water. 1 for FNLC, 18 for CLC
#' @param benefit_weight The weight assigned to benefit in the selection probabilities.0.5 is equal weighting of cost and benefits. 1.0 is zero weighting to cost.
#' @param land_cover_weights data frame with lc and weights
#'
#' @inheritParams common_docs
#'
#' @return a table with inclusion probabilities
#' @export
#'
full_BASS_run <- function(num_runs, n_samples, att_sf, costs = NULL,
                          seed = as.integer(Sys.time()),
                          hex_id, stratum_id = NULL, omit_flag = NULL,
                          non_ran_set = NULL, lakeN = 18,
                          benefit_weight = 0.5,
                          land_cover_weights = NULL, return_grts = FALSE,
                          quiet = FALSE) {

  # CHECK
  ## Check if any NA in habitat columns

  set.seed(seed)

  if (!"sf" %in% class(att_sf)) {
    stop("Spatial object att_sf must be an object of package sf. Please fix and try again")
  } else {
    if (all(sf::st_is(att_sf, "POLYGON"))) {
      if(!quiet) message("Spatial Feature object should be points not polygons or GRTS expects clusters. Don't worry, I'll fix it!")
      att_sf <- sf::st_centroid(att_sf)
    }
  }

  if(!any(grepl("^LC\\d",names(att_sf)))) rlang::abort(message = "Habitat data table not formatted correctly. Try running clean_forBass.")
  if(is.na(rowSums(dplyr::summarize(sf::st_drop_geometry(att_sf), dplyr::across(dplyr::matches("^LC\\d"), sum))))) rlang::abort(message = "Habitat data table not formatted correctly. Try running clean_forBass.")


  if (n_samples == 0) grts_output <- NULL
  if (n_samples != 0) {
    grts_output <- draw_random_samples(
      att_sf = att_sf,
      num_runs = num_runs, n_samples = n_samples,
      quiet = quiet)
    if(!quiet) message("sample draw complete")
  }

  # Benefits
  benefits <- calculate_benefit(
    samples = grts_output, att_sf = att_sf,
    non_random_set = non_ran_set,
    hex_id = {{ hex_id }},
    stratum_id = {{ stratum_id }},
    land_cover_weights = land_cover_weights
  )

  # Costs
  if (!is.null(costs)) {
    r <- calculate_inclusion_probs(
      costs = costs, benefits = benefits, hex_id = {{ hex_id }},
      stratum_id = {{ stratum_id }}, benefit_weight = benefit_weight)
    type <- "inclusion_probs"
  } else {
    r <- benefits
    type <- "benefits"
  }

  # Meta
  r <- dplyr::mutate(r,
                     num_runs = .env$num_runs,
                     n_samples = .env$n_samples)


  # GRTS
  if(return_grts) r <- setNames(list(r, grts_output), c(type, "grts_output"))

  r
}


#' A calculate BASS from random samples
#'
#' @param samples Hypothetical sample set
#' @param num_runs The number of times to draw random samples from hexagons
#' @param n_samples The number of samples to draw in each sample
#' @param costs the cost table for each hexagon id
#' @param seed random seed to use for random grts samples
#'
#' @inheritParams common_docs
#'
#' @return a table with inclusion probabilities
#' @export
#'
noGRTS_BASS_run <- function(samples, num_runs, n_samples, att_sf, costs,
                            seed = as.integer(Sys.time())) {

  set.seed(seed)

  benefits <- calculate_benefit(samples = samples,
                                att_sf = att_sf,
                                output = "mean_benefit")

  pointswith_inclusion <- calculate_inclusion_probs(
    costs = costs, benefits = benefits)

  dplyr::mutate(pointswith_inclusion,
                num_runs = .env$num_runs,
                n_samples = .env$n_samples)
}
