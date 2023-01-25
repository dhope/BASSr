#' BASS cost benefit calculation
#'
#' Calculate the cost benefits and inclusion probabilities
#'
#' @param costs Data frame. Costs for each hexagon in a RawCost format
#' @param benefits Data frame. Benefits associated with each hexagon ( output of
#'   `calculate_benefits()`)
#' @param hex_id Column containing hexagon IDs.
#' @param omit Column identifying hexes to omit (e.g., water hexes). Default
#'   INLAKE.
#' @param stratum_id Column containing larger area id (e.g., Province,
#'   StudyAreaID). Default StudyAreaID.
#' @param benefit_weight Numeric. Weight assigned to benefit in the selection
#'   probabilities. 0.5 is equal weighting of cost and benefits. 1.0 is zero
#'   weighting to cost. Default 0.5.
#'
#' @return A data frame with full inclusion probabilities for each raster.
#'
#' @export
#'
#' @examples
#'
#' h <- prepare_hab_long(psu_land_cover, province)
#' b <- calculate_benefit(grts_res = psu_samples,
#'                        att_long = h,
#'                        hex_id = hex_id)
#'
#' inc <- calculate_inclusion_probs(
#'   costs = psu_costs,
#'   benefits = b,
#'   hex_id = hex_id,
#'   stratum_id = province)
#'
calculate_inclusion_probs <- function(costs, benefits,
                                      hex_id,
                                      omit_flag = NULL,
                                      stratum_id = NULL,
                                      benefit_weight = 0.5) {

  # Checks
  check_column(costs, {{ hex_id }})
  check_column(costs, {{ omit_flag }})
  check_column(costs, {{ stratum_id }})
  check_column(benefits, {{ hex_id }})

  costs <- check_costs(costs, {{ hex_id }}, {{ omit_flag }}, quiet = TRUE)

  # Add benefits
  costs <- dplyr::left_join(costs, benefits,
                            by = rlang::as_label(rlang::enquo(hex_id))) %>%
    dplyr::select({{ hex_id }}, {{ stratum_id }},
                  "X", "Y", "RawCost", "benefit")

  # By stratum
  if(!rlang::quo_is_null(rlang::enquo(stratum_id))) {
    costs <- dplyr::group_by(costs, {{ stratum_id }})
  }

  # Calculate inclusion probabilities
  costs %>%
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
