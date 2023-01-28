#' A full BASS run
#'
#' @param num_runs The number of times to draw random samples from hexagons
#' @param n_samples The number of samples to draw in each sample
#' @param return_all return each piece of BASS implementation
#' @param seed random seed to use for random grts samples
#' @param non_ran_set Non random set that is added to the hypothetical sample
#'   set in benefit calculation.
#' @param benefit_weight The weight assigned to benefit in the selection
#'   probabilities.0.5 is equal weighting of cost and benefits. 1.0 is zero
#'   weighting to cost.
#' @param land_cover_weights data frame with lc and weights
#'
#' @inheritParams common_docs
#'
#' @return a table with inclusion probabilities
#' @export
#'
#' @examples
#'
#' # With example data psu_hexagons and psu_costs...
#'
#' d <- full_BASS_run(
#'   att_sf = psu_hexagons,
#'   num_runs = 10,
#'   n_samples = 3,
#'   costs = psu_costs,
#'   hex_id = hex_id)
#'
#' d <- full_BASS_run(
#'   att_sf = psu_hexagons,
#'   num_runs = 10,
#'   n_samples = 0,
#'   costs = psu_costs,
#'   hex_id = hex_id)

full_BASS_run <- function(att_sf, num_runs, n_samples, costs = NULL,
                          hex_id, stratum_id = NULL, omit_flag = NULL,
                          non_ran_set = NULL,
                          benefit_weight = 0.5, land_cover_weights = NULL,
                          return_grts = FALSE, seed = as.integer(Sys.time()),
                          quiet = FALSE) {

  # Input checks
  check_column(att_sf, {{ hex_id }})
  check_column(att_sf, {{ stratum_id }})
  check_att_sf(att_sf)

  set.seed(seed)

  if (n_samples == 0) grts_output <- NULL

  if (n_samples != 0) {
    grts_output <- draw_random_samples(
      att_sf = att_sf,
      num_runs = num_runs, n_samples = n_samples,
      quiet = quiet)
    if(!quiet) rlang::inform("Sample draw complete")
  }

  # Benefits
  benefits <- calculate_benefit(
    att_sf = att_sf, samples = grts_output,
    non_random_set = non_ran_set,
    hex_id = {{ hex_id }},
    stratum_id = {{ stratum_id }},
    land_cover_weights = land_cover_weights
  )

  # Costs
  if (!is.null(costs)) {
    r <- calculate_inclusion_probs(
      benefits = benefits, costs = costs,
      hex_id = {{ hex_id }}, stratum_id = {{ stratum_id }},
      benefit_weight = benefit_weight)
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
noGRTS_BASS_run <- function(att_sf, samples, num_runs, n_samples, costs,
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
