#' BASS cost benefit calculation
#'
#' Calculate the cost benefits and inclusion probabilities
#'
#' @param cost data frame with costs for each hexagon in a RawCost format
#' @param hexagon_benefits data frame with benefits for each hexagon
#' @param HexID column of hexagon ids
#' @param StratumID Column of larger area id
#' @param benefit_weight The weight assigned to benefit in the selection
#'   probabilities. 0.5 is equal weighting of cost and benefits. 1.0 is zero
#'   weighting to cost. Default 0.5.
#'
#' @return A data frame with full inclusion probabilities for each raster.
#'
#' @export
#'
#' @examples
#'
#' h <- prepare_hab_long(psu_land_cover, lg_area = province)
#' b <- calculate_benefit(grts_res = psu_samples,
#'                        att_long = h,
#'                        HexID = hex_id)
#'
#' inc <- calculate_inclusion_probs(
#'   costs = psu_costs,
#'   benefits = b,
#'   HexID = hex_id,
#'   StratumID = province)
#'
calculate_inclusion_probs <- function(costs, benefits,
                                      HexID,
                                      omit = NULL,
                                      StratumID = NULL,
                                      benefit_weight = 0.5) {

  # Setup quosures
  HexID <- rlang::enquo(HexID)
  omit <- rlang::enquo(omit)
  StratumID = rlang::enquo(StratumID)

  # Checks
  costs <- check_costs(costs, HexID, omit, quiet = TRUE)

  # Add benefits
  costs <- dplyr::left_join(costs, benefits, by = rlang::as_label(HexID)) %>%
    dplyr::select({{ HexID }}, {{ StratumID }}, "X", "Y", "RawCost", "benefit")

  # By stratum
  if(!rlang::quo_is_null(StratumID)) {
    costs <- dplyr::group_by(costs, {{StratumID}})
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
