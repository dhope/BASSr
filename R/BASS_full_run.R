#' A full BASS run
#'
#' @param return_grts Logical. Return the `spsurvey` object.
#'
#' @inheritParams common_docs
#'
#' @return Data frame of inclusion probabilities. Or, if `return_grts = TRUE` a
#'   list including the data frame of inclusion probabilities as well as the
#'   `spsurvey` grts sampling object.
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
#' # Omit water hexes
#'
#' d <- full_BASS_run(
#'   land_hex = psu_hexagons,
#'   num_runs = 10,
#'   n_samples = 3,
#'   costs = psu_costs,
#'   hex_id = hex_id,
#'   omit_flag = water)

full_BASS_run <- function(land_hex, num_runs, n_samples, costs = NULL,
                          hex_id, stratum_id = NULL, omit_flag = NULL,
                          non_random_set = NULL,
                          benefit_weight = 0.5, land_cover_weights = NULL,
                          return_grts = FALSE,
                          crs = 4326, coords = c("lon", "lat"),
                          seed = NULL, quiet = FALSE) {

  # Checks *also* occur inside
  # - draw_random_samples
  # - calculate_benefit
  # - calculate_inclusion_probs
  # But this way, they fail early
  check_column(land_hex, {{ hex_id }})
  check_column(land_hex, {{ stratum_id }})
  land_hex <- check_land_hex(land_hex, crs, coords, quiet)
  check_int(num_runs, range = c(1, Inf))
  check_int(n_samples, range = c(1, Inf))
  check_int(seed, range = c(0, Inf))

  check_non_random_set(non_random_set, dplyr::pull(land_hex, {{ hex_id }}))
  check_land_cover_weights(land_cover_weights, land_hex)

  if (!is.null(costs)) {
    check_column(costs, {{ hex_id }})
    check_column(costs, {{ omit_flag }})
    check_column(costs, {{ stratum_id }})
    costs <- check_costs(costs, {{ omit_flag }})
  }

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
    non_random_set = non_random_set,
    hex_id = {{ hex_id }},
    stratum_id = {{ stratum_id }},
    land_cover_weights = land_cover_weights
  )

  # Costs
  if (!is.null(costs)) {
    r <- calculate_inclusion_probs(
      benefits = benefits, costs = costs,
      hex_id = {{ hex_id }}, stratum_id = {{ stratum_id }},
      omit_flag = {{ omit_flag }},
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
  if(return_grts) r <- stats::setNames(list(r, grts_output), c(type, "grts_output"))

  r
}


#' A calculate BASS from random samples
#'
#' @param samples Hypothetical sample set
#' @param num_runs The number of times to draw random samples from hexagons
#' @param n_samples The number of samples to draw in each sample
#' @param costs the cost table for each hexagon id
#'
#' @name noGRTS_BASS_run-deprecated
NULL

#' @rdname BASSr-deprecated
#' @export
noGRTS_BASS_run <- function(land_hex, samples, num_runs, n_samples, costs,
                            crs = 4326, coords = c("lon", "lat"),
                            quiet = FALSE) {

  .Deprecated(msg = "This function is depreciated")

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
