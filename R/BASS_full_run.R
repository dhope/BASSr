#' A full BASS run
#'
#' @param num_runs The number of times to draw random samples from hexagons
#' @param n_samples The number of samples to draw in each sample
#' @param return_all return each piece of BASS implementation
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
#'   land_hex = psu_hexagons,
#'   num_runs = 10,
#'   n_samples = 3,
#'   costs = psu_costs,
#'   hex_id = hex_id)
#'
#' d <- full_BASS_run(
#'   land_hex = psu_hexagons,
#'   num_runs = 10,
#'   n_samples = 0,
#'   costs = psu_costs,
#'   hex_id = hex_id)

full_BASS_run <- function(land_hex, num_runs, n_samples, costs = NULL,
                          hex_id, stratum_id = NULL, omit_flag = NULL,
                          non_ran_set = NULL,
                          benefit_weight = 0.5, land_cover_weights = NULL,
                          return_grts = FALSE,
                          crs = 4326, coords = c("lon", "lat"),
                          seed = NULL, quiet = FALSE) {

  # Input checks
  land_hex <- check_land_hex(land_hex, crs, coords, quiet)
  check_column(land_hex, {{ hex_id }})
  check_column(land_hex, {{ stratum_id }})

  if (n_samples == 0) grts_output <- NULL

  if (n_samples != 0) {
    grts_output <- draw_random_samples(
      land_hex = land_hex,
      num_runs = num_runs, n_samples = n_samples,
      seed = seed,
      quiet = quiet)
  }

  # Benefits
  benefits <- calculate_benefit(
    land_hex = land_hex, samples = grts_output,
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
#'
#' @inheritParams common_docs
#'
#' @return a table with inclusion probabilities
#' @export
#'
noGRTS_BASS_run <- function(land_hex, samples, num_runs, n_samples, costs,
                            crs = 4326, coords = c("lon", "lat"),
                            quiet = FALSE) {

  land_hex <- check_land_hex(land_hex, crs, coords, quiet)

  benefits <- calculate_benefit(samples = samples,
                                land_hex = land_hex,
                                output = "mean_benefit")

  pointswith_inclusion <- calculate_inclusion_probs(
    costs = costs, benefits = benefits)

  # QUESTION: No actual sampling done here...
  dplyr::mutate(pointswith_inclusion,
                num_runs = .env$num_runs,
                n_samples = .env$n_samples)
}
