#' A full BASS run
#'
#' @param num_runs The number of times to draw random samples from hexagons
#' @param nsamples The number of samples to draw in each sample
#' @param att  the attribute table correctly formatted
#' @param att.sp the shape file from the attribute table
#' @param cost the cost table for each hexagon id
#' @param return_all return each piece of BASS implementation
#' @param seed_ random seed to use for random grts samples
#' @param HexID_ Column for hexagon id
#' @param stratumID Column for larger area id. Likely StudyAreaID or Province
#' @param quick Run the benefit calculation quickly
#' @param non_ran_set Non random set that is added to the hypothetical sample set in benefit calculation.
#' @param lakeN The land cover number to represent open water. 1 for FNLC, 18 for CLC
#' @param benefit_weight The weight assigned to benefit in the selection probabilities.0.5 is equal weighting of cost and benefits. 1.0 is zero weighting to cost.
#' @param noCost Do you only want to run the benefit calculation?
#' @param weighted_benefits data frame with lc and weights
#'
#' @return a table with inclusion probabilities
#' @export
#'
full_BASS_run <- function(num_runs, nsamples, att, att.sp, cost,
                          return_all = FALSE, seed_ = as.integer(Sys.time()),
                          HexID_ = HEX100, stratumID = StudyAreaID,
                          quick = FALSE, non_ran_set = NULL, lakeN = 18,
                          benefit_weight = 0.5, noCost = F,
                          weighted_benefits = NULL) {

  # Input Checks

  # Check if habitat and sp object have same numbers of rows
  if(nrow(att.sp)!= nrow(att)) rlang::abort(message = "att.sp and att must be the same size. They do not currently have the same number of rows")
  ## Check if any NA in habitat columns
  if(!any(grepl("^LC\\d",names(att)))) rlang::abort(message = "Habitat data table not formatted correctly. Try running clean_forBass.")
  if (!"sf" %in% class(att)){
    if(is.na(rowSums(summarise(att , across( matches("^LC\\d"), sum))))) rlang::abort(message = "Habitat data table not formatted correctly. Try running clean_forBass.")
  }else{
    if(is.na(rowSums(summarise(st_drop_geometry(att) , across( matches("^LC\\d"), sum))))) rlang::abort(message = "Habitat data table not formatted correctly. Try running clean_forBass.")
  }

  set.seed(seed_)

  if (!"INLAKE" %in% names(cost) & !isTRUE(noCost)) {
    message("Did you forget to add a lake specification to the cost? I am addig it based on dominant land cover for now.")
    inlake <- NA
    try(inlake <- dplyr::filter_at(att, dplyr::vars(dplyr::matches("^D_.+")), dplyr::any_vars(. == lakeN)))
    cost <- dplyr::mutate(cost, INLAKE = {{ HexID_ }} %in% inlake$ET_Index)
  }
  if (!"sf" %in% class(att.sp)) {
    stop("Spatial object att.sp must be an object of package sf. Please fix and try again")
  } else {
    if (all(sf::st_is(att.sp, "POLYGON"))) {
      message("Spatial Feature object should be points not polygons or GRTS expects clusters. Don't worry, I'll fix it!")
      att.sp <- sf::st_centroid(att.sp)
    }
  }
  if (!"X" %in% names(cost) & !isTRUE(noCost)) {
    message("Did you forget to add coordinates? I am adding it based centroids of the att.sp for now.")

    cost <- sf::st_centroid(cost)
    cost <- cost %>%
      sf::st_coordinates() %>%
      dplyr::as_tibble() %>%
      dplyr::bind_cols(cost)
  }

  if (nsamples ==0) grts_output <- NULL
  if (nsamples !=0) {

  grts_output <- draw_random_samples(att_cleaned = att, att.sf = att.sp,
                                     num_runs = num_runs, nsamples = nsamples)
  message("sample draw complete")
  }

  att_cleaned_long <- prepare_hab_long(att, {{ stratumID }})

  if (!isTRUE(return_all)) {
    benefits <- calculate_benefit(
      grts_res = grts_output, att_long = att_cleaned_long,
      non_random_set = non_ran_set, output = "benefit_by_run",
      HexID = {{ HexID_ }}, quick = quick,
      land_cover_weights = weighted_benefits
    )

    if (isTRUE(noCost)) {
      run_results <- dplyr::mutate(benefits,
                                   num_runs = .env$num_runs,
                                   nsamples = .env$nsamples)
    } else {
      pointswith_inclusion <- calculate_inclusion_probs(
        cost = cost, hexagon_benefits = benefits, HexID = {{ HexID_ }},
        StratumID = {{ stratumID }}, benefit_weight = benefit_weight)

      run_results <- dplyr::mutate(pointswith_inclusion,
                                   num_runs = .env$num_runs,
                                   nsamples = .env$nsamples)
    }
  }

  if (isTRUE(return_all)) {
    benefits <- calculate_benefit(
      grts_res = grts_output, att_long = att_cleaned_long,
      non_random_set = non_ran_set, output = "all",
      HexID = {{ HexID_ }}, quick = quick,
      land_cover_weights = weighted_benefits
    )
    if (isTRUE(noCost)) {
      return(benefits %>% mutate(num_runs = num_runs, nsamples = nsamples))
    }
    if (isTRUE(q)) {
      b <- benefits
    } else {
      b <- benefits$hexagon_benefits
    }
    pointswith_inclusion <- calculate_inclusion_probs(
      cost = cost, hexagon_benefits = b,
      HexID = {{ HexID_ }},
      StratumID = {{ stratumID }},
      benefit_weight = benefit_weight
    )

    return(list(
      inclusionPr = pointswith_inclusion %>% mutate(num_runs = num_runs, nsamples = nsamples),
      benefits_full = benefits, grts_samples = grts_output, att_long = att_cleaned_long
    ))
  }

  run_results
}


#' A calculate BASS from random samples
#'
#' @param grts_output Hypothetical sample set
#' @param num_runs The number of times to draw random samples from hexagons
#' @param nsamples The number of samples to draw in each sample
#' @param att  the attribute table correctly formatted
#' @param att.sp the shape file from the attribute table
#' @param cost the cost table for each hexagon id
#' @param return_all return each piece of BASS implementation
#' @param seed_ random seed to use for random grts samples
#'
#' @return a table with inclusion probabilities
#' @export
#'
noGRTS_BASS_run <- function(grts_output, num_runs, nsamples, att, att.sp, cost,
                            return_all = FALSE, seed_ = as.integer(Sys.time())) {

  att_cleaned_long <- prepare_hab_long(att)

  if (!isTRUE(return_all)) {
    benefits <- calculate_benefit(grts_res = grts_output,
                                  att_long = att_cleaned_long,
                                  output = "mean_benefit")

    pointswith_inclusion <- calculate_inclusion_probs(
      cost = cost, hexagon_benefits = benefits)

    run_results <- dplyr::mutate(pointswith_inclusion,
                                 num_runs = .env$num_runs,
                                 nsamples = .env$nsamples)
  }

  if (isTRUE(return_all)) {
    benefits <- calculate_benefit(grts_res = grts_output,
                                  att_long = att_cleaned_long,
                                  output = "all")

    pointswith_inclusion <- calculate_inclusion_probs(
      cost = cost, hexagon_benefits = benefits$hexagon_benefits)

    run_results <- list(
      inclusionPr =  dplyr::mutate(pointswith_inclusion,
                                   num_runs = .env$num_runs,
                                   nsamples = .env$nsamples),
      benefits_full = benefits,
      grts_samples = grts_output,
      att_long = att_cleaned_long
    )
  }

  run_results
}
