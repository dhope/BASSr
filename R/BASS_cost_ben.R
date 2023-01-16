
#' BASS cost benefit calculation
#'
#' Caculate the cost benefits and inclusion probabilities
#'
#' @param cost data frame with costs for each hexagon in a RawCost format
#' @param hexagon_benefits data frame with benefits for each hexagon
#' @param HexID column of hexagon ids
#' @param StratumID Column of larger area id
#' @param benefit_weight The weight assigned to benefit in the selection probabilities.0.5 is equal weighting of cost and benefits. 1.0 is zero weighting to cost.
#'
#' @return A data frame with full inclusion probabilities for each raster.
#' @export
#'
calculate_inclusion_probs <- function(cost, hexagon_benefits, HexID,
                                      StratumID = StudyAreaID,
                                      benefit_weight = 0.5) {

  if (!"RawCost" %in% names(cost)) {
    # scale distance so anything >1000m from the road is given a value of 5000
    cost <- dplyr::mutate(cost,
                          RawCost = ifelse(.data$NEAR_DIST > 1000,
                                           5000,
                                           .data$NEAR_DIST))
  }

  dplyr::left_join(cost, hexagon_benefits,
                   by = rlang::as_label(rlang::enquo(HexID))) %>%
    # delete any centroids that are in water
    dplyr::filter(INLAKE == FALSE) %>%
    # convert NA in the 'INLAKE' column to 0  ---> CHECK
    dplyr::select({{ HexID }}, {{ StratumID }}, "X", "Y", "RawCost", "benefit") %>%
    dplyr::group_by({{StratumID}}) %>%
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
