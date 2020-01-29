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
#' @param q Run the benefit calculation quickly
#'
#' @return a table with inclusion probabilities
#' @export
#'
#' @examples
full_BASS_run <- function(num_runs, nsamples, att, att.sp, cost, return_all=F, seed_ = as.integer(Sys.time()), HexID_ = HEX100, q=F) {
  set.seed(seed_)
  grts_output <- draw_random_samples(att_cleaned = att, att.sf = att.sp, num_runs = num_runs, nsamples = nsamples)
  message("sample draw complete")

  att_cleaned_long <- prepare_hab_long(att)

  if(!isTRUE(return_all)){
  benefits <- calculate_benefit(grts_res = grts_output, att_long = att_cleaned_long, output = "mean_benefit", HexID = {{HexID_}}, quick = q)

  pointswith_inclusion <- calculate_inclusion_probs(cost = cost, hexagon_benefits = benefits, HexID = {{HexID_}})

  return(pointswith_inclusion %>% mutate(num_runs = num_runs, nsamples = nsamples))
  }
  if(isTRUE(return_all)){
    benefits <- calculate_benefit(grts_res = grts_output, att_long = att_cleaned_long, output = "all", HexID = {{HexID_}}, quick = q)
    if(isTRUE(q)){b <-  benefits}else{b <- benefits$hexagon_benefits}
    pointswith_inclusion <- calculate_inclusion_probs(cost = cost, hexagon_benefits = b, HexID = {{HexID_}})

    return(list(inclusionPr = pointswith_inclusion %>% mutate(num_runs = num_runs, nsamples = nsamples),
                benefits_full = benefits, grts_samples = grts_output, att_long = att_cleaned_long))
  }
}


#' A calculate BASS from random samples
#'
#' @param grts_output
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
#' @examples
noGRTS_BASS_run <- function(grts_output, num_runs, nsamples, att, att.sp, cost, return_all=F, seed_ = as.integer(Sys.time())) {

  att_cleaned_long <- prepare_hab_long(att)

  if(!isTRUE(return_all)){
    benefits <- calculate_benefit(grts_res = grts_output, att_long = att_cleaned_long, output = "mean_benefit")

    pointswith_inclusion <- calculate_inclusion_probs(cost = cost, hexagon_benefits = benefits)

    return(pointswith_inclusion %>% mutate(num_runs = num_runs, nsamples = nsamples))
  }
  if(isTRUE(return_all)){
    benefits <- calculate_benefit(grts_res = grts_output, att_long = att_cleaned_long, output = "all")

    pointswith_inclusion <- calculate_inclusion_probs(cost = cost, hexagon_benefits = benefits$hexagon_benefits)

    return(list(inclusionPr = pointswith_inclusion %>% mutate(num_runs = num_runs, nsamples = nsamples),
                benefits_full = benefits, grts_samples = grts_output, att_long = att_cleaned_long))
  }
}
