#' BASS cost benefit calculation
#'
#' Calculate the cost benefits and inclusion probabilities
#'
#' @param benefits Spatial Data frame. Benefits associated with each hexagon (
#'   output of `calculate_benefits()`)
#' @param hex_id Column containing hexagon IDs.
#' @param omit Column identifying hexes to omit (e.g., water hexes). Default
#'   INLAKE.
#' @param stratum_id Column containing larger area id (e.g., Province,
#'   StudyAreaID). Default StudyAreaID.
#' @param benefit_weight Numeric. Weight assigned to benefit in the selection
#'   probabilities. 0.5 is equal weighting of cost and benefits. 1.0 is zero
#'   weighting to cost. Default 0.5.
#'
#' @inheritParams common_docs
#'
#' @return A data frame with full inclusion probabilities for each raster.
#'
#' @export
#'
#' @examples
#'
#' b <- calculate_benefit(att_sf = psu_hexagons,
#'                        samples = psu_samples,
#'                        hex_id = hex_id)
#'
#' inc <- calculate_inclusion_probs(
#'   benefits = b,
#'   costs = psu_costs,
#'   hex_id = hex_id)
#'
calculate_inclusion_probs <- function(benefits, costs,
                                      hex_id, stratum_id = NULL,
                                      omit_flag = NULL,
                                      benefit_weight = 0.5) {

  # Checks
  check_column(costs, {{ hex_id }})
  check_column(costs, {{ omit_flag }})
  check_column(costs, {{ stratum_id }})
  check_column(benefits, {{ hex_id }})

  costs <- check_costs(costs, {{ hex_id }}, {{ omit_flag }}, quiet = TRUE)

  # Add benefits
  costs <- dplyr::right_join(benefits, costs,
                            by = rlang::as_label(rlang::enquo(hex_id))) %>%
    dplyr::select({{ hex_id }}, {{ stratum_id }}, "RawCost", "benefit")

  # Calculate inclusion probabilities
  costs %>%
    dplyr::group_by({{ stratum_id }}) %>%   # By stratum if applicable
    dplyr::mutate(
      LogCost = log10(.data$RawCost),
      ScLogCost = .data$LogCost / (max(.data$LogCost, na.rm = TRUE) + 1),
      scale_ben = .data$benefit / max(.data$benefit, na.rm = TRUE),
      # Inclusion probability
      partIP = (1 - .data$ScLogCost) * .data$scale_ben,
      # Benefit weighted by benefit weight
      weightedIP = (1 - (.data$ScLogCost * (1 - .env$benefit_weight))) *
        .data$scale_ben * .env$benefit_weight,
      # Scaled inclusion probability
      inclpr = .data$weightedIP / max(.data$weightedIP, na.rm = TRUE)
    ) %>%
    dplyr::ungroup()
}
