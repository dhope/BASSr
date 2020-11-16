




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
calculate_inclusion_probs <- function(cost, hexagon_benefits, HexID, StratumID = StudyAreaID, benefit_weight = 0.5) {
  if (!"RawCost" %in% names(cost)) {
    cost <- cost %>%
      mutate(RawCost = ifelse(NEAR_DIST > 1000, 5000, NEAR_DIST)) ## scale the distance so anything greater than 1000m from the road is given a value of 5000
  }


  left_join(cost, hexagon_benefits) %>%
    filter(INLAKE == F) %>% ## delete any centroids that are in water
    ## any NA in the 'INLAKE' column will be converted to a 0
    dplyr::select({{ HexID }}, {{ StratumID }}, X, Y, RawCost, benefit) %>%
    group_by({{StratumID}}) %>%
    mutate(
      LogCost = log10(RawCost),
      ScLogCost = LogCost / (max(LogCost, na.rm = T) + 1),
      scale_ben = benefit / max(benefit, na.rm = T),
      partIP = (1 - ScLogCost) * scale_ben, ## Inclusion probability
      weightedIP = (1 - (ScLogCost * (1 - benefit_weight))) * scale_ben * benefit_weight, # Benefit weighted by benefit weight
      inclpr = weightedIP / max(weightedIP, na.rm = T) ## scaled Inclusion probability
    ) %>% ungroup
}
