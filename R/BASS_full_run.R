#' A full BASS run
#'
#' @param num_runs The number of times to draw random samples from hexagons
#' @param n_samples The number of samples to draw in each sample
#' @param att  the attribute table correctly formatted
#' @param att.sp the shape file from the attribute table
#' @param costs the cost table for each hexagon id
#' @param return_all return each piece of BASS implementation
#' @param seed random seed to use for random grts samples
#' @param hex_id Column for hexagon id
#' @param stratum_id Column for larger area id. Likely StudyAreaID or Province
#' @param quick Run the benefit calculation quickly
#' @param non_ran_set Non random set that is added to the hypothetical sample set in benefit calculation.
#' @param lakeN The land cover number to represent open water. 1 for FNLC, 18 for CLC
#' @param benefit_weight The weight assigned to benefit in the selection probabilities.0.5 is equal weighting of cost and benefits. 1.0 is zero weighting to cost.
#' @param land_cover_weights data frame with lc and weights
#'
#' @return a table with inclusion probabilities
#' @export
#'
full_BASS_run <- function(num_runs, n_samples, att, att.sp, costs = NULL,
                          seed = as.integer(Sys.time()),
                          hex_id, stratum_id = NULL, omit_flag = NULL,
                          non_ran_set = NULL, lakeN = 18,
                          benefit_weight = 0.5,
                          land_cover_weights = NULL, return_grts = FALSE,
                          quiet = FALSE) {

  # CHECK

  # Check if habitat and sp object have same numbers of rows
  if(nrow(att.sp)!= nrow(att)) rlang::abort(message = "att.sp and att must be the same size. They do not currently have the same number of rows")
  ## Check if any NA in habitat columns
  if(!any(grepl("^LC\\d",names(att)))) rlang::abort(message = "Habitat data table not formatted correctly. Try running clean_forBass.")
  if (!"sf" %in% class(att)){
    if(is.na(rowSums(dplyr::summarize(att, dplyr::across(dplyr::matches("^LC\\d"), sum))))) rlang::abort(message = "Habitat data table not formatted correctly. Try running clean_forBass.")
  }else{
    if(is.na(rowSums(dplyr::summarize(sf::st_drop_geometry(att), dplyr::across(dplyr::matches("^LC\\d"), sum))))) rlang::abort(message = "Habitat data table not formatted correctly. Try running clean_forBass.")
  }

  set.seed(seed)

  if (!"sf" %in% class(att.sp)) {
    stop("Spatial object att.sp must be an object of package sf. Please fix and try again")
  } else {
    if (all(sf::st_is(att.sp, "POLYGON"))) {
      if(!quiet) message("Spatial Feature object should be points not polygons or GRTS expects clusters. Don't worry, I'll fix it!")
      att.sp <- sf::st_centroid(att.sp)
    }
  }

  if (n_samples == 0) grts_output <- NULL
  if (n_samples != 0) {
    grts_output <- draw_random_samples(
      att_cleaned = att, att.sf = att.sp,
      num_runs = num_runs, n_samples = n_samples,
      quiet = quiet)
    if(!quiet) message("sample draw complete")
  }

  att_cleaned_long <- prepare_hab_long(att, {{ stratum_id }})

  # Benefits
  benefits <- calculate_benefit(
    grts_res = grts_output, att_long = att_cleaned_long,
    non_random_set = non_ran_set,
    hex_id = {{ hex_id }},
    land_cover_weights = land_cover_weights
  )

  # Costs
  if (!is.null(costs)) {
    r <- calculate_inclusion_probs(
      costs = costs, benefits = benefits, hex_id = {{ hex_id }},
      stratum_id = {{ stratum_id }}, benefit_weight = benefit_weight)
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
