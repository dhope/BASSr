




#' BASS cost benefit calculation
#'
#' Caculate the cost benefits and inclusion probabilities
#'
#' @param cost data frame with costs for each hexagon in a RawCost format
#' @param hexagon_benefits data frame with benefits for each hexagon
#' @param HexID column of hexagon ids
#' @param StratumID Column of larger area id
#'
#' @return A data frame with full inclusion probabilities for each raster.
#' @export
#'
calculate_inclusion_probs <- function(cost, hexagon_benefits, HexID, StratumID = StudyAreaID ) {
  if(!"RawCost" %in% names(cost)){
    cost <- cost %>%
      mutate(RawCost = ifelse(NEAR_DIST > 1000, 5000, NEAR_DIST)) ## scale the distance so anything greater than 1000m from the road is given a value of 5000
  }


  left_join(cost, hexagon_benefits
  ) %>%
    filter(INLAKE==F) %>% ## delete any centroids that are in water
    ## any NA in the 'INLAKE' column will be converted to a 0
    dplyr::select({{HexID}},{{StratumID}}, X, Y, RawCost, benefit) %>%
    mutate(
      LogCost = log10(RawCost),
      ScLogCost = LogCost / (max(LogCost, na.rm = T) + 1),
      scale_ben = benefit / max(benefit, na.rm = T),
      partIP = (1 - ScLogCost) * scale_ben, ## Inclusion probability
      inclpr = partIP / max(partIP, na.rm = T) ## scaled Inclusion probability
    )
}
