#' BASS cost benefit calculation
#'
#' Calculate the cost-benefits and inclusion probabilities.
#'
#' @param benefits Spatial Data frame. Benefits associated with each hexagon
#'   (output of `calculate_benefits()`).

#'
#' @inheritParams common_docs
#'
#' @return A data frame with full inclusion probabilities for each hex.
#'
#' @export
#'
#' @examples
#'
#' b <- calculate_benefit(land_hex = psu_hexagons,
#'                        samples = psu_samples)
#'
#' inc <- calculate_inclusion_probs(
#'   benefits = b,
#'   costs = psu_costs)
#'
#' # Omit water hexes (identified by column `water`)
#'
#' inc <- calculate_inclusion_probs(
#'   benefits = b,
#'   costs = psu_costs,
#'   omit_flag = water)

calculate_inclusion_probs <- function(benefits, costs,
                                      hex_id = hex_id, stratum_id = NULL,
                                      omit_flag = NULL,
                                      benefit_weight = 0.5) {

  # Checks
  check_column(costs, {{ hex_id }})
  check_column(costs, {{ omit_flag }})
  check_column(costs, {{ stratum_id }})
  check_column(benefits, {{ hex_id }})
  costs <- check_costs(costs, {{ omit_flag }})
  check_benefits(benefits)

  if(benefit_weight < 0 || benefit_weight > 1) {
    rlang::abort(
      "`benefit_weight` is a proportional weight ranging from 0 to 1",
      call = NULL)
  }

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
