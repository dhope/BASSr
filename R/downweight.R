#' Adjust selection weighting
#'
#' @param sample_locs sf object with the selection weighting column (polygons or points)
#' @param scalingFactor scaling factor to downweight
#' @param sigma_value sigma value of distribution effect for existing sampling. Larger value means sampling has wider effect
#' @param selection_column Column with sampling weights to be adjusted. If null return only the weights.
#' @param fun Type of decay function. Current options are 'cauchy', 'normal' or 'exp'
#' @param existing_sampling exisint sampling to down weight around (points)
#' @param dmat distance matrix from sample locations (rows) to existing sampling (columns)
#'
#' @return data.frame sample_locs with downweights and adjusted selection probabilities included.
#' If selection column is null return a vector of the downweights alone.
#' @export
#'
#' @examples
#' downweight_selection_pr(BASSr::all_study_areas[1:10,], BASSr::all_study_areas[20:30,], scalingFactor = 0.1, sigma_value = 1e5, fun = 'cauchy', selection_column = NULL)
downweight_selection_pr <- function(sample_locs,
                                    scalingFactor,
                                    sigma_value,
                                    selection_column = NULL,
                                    fun='cauchy',
                                    existing_sampling = NULL,
                                    dmat = NULL){
  f <- switch (fun,
    cauchy = function(x,mn,sd)dcauchy(x,mn, sd),
    normal = function(x,mn,sd)dnorm(x,mn, sd),
    exp = function(x,mn,sd) {exp(-x**2/ sd**2)},

  )
  if(is_null(dmat)) dmat <- gen_dist_mat(sample_locs, existing_sampling)
  z <- exp(rowSums(log( 1.-scalingFactor*
                          f(units::drop_units(dmat),
                                           mn = 0,
                                           sd = sigma_value) /
                          f(0,0,sd = sigma_value))))
  if(!rlang::quo_is_null(enquo(selection_column))) {
    # browser()
    # stopifnot(as_label(enquo(selection_column)) %in% names(sample_locs))
    if(!as_label(enquo(selection_column)) %in% names(sample_locs)){
      abort(glue::glue("Column name {as_label(enquo(selection_column))} not found in sample_locs.\n Use NULL to return weights only"))}
    return(
  dplyr::mutate(sample_locs,
         downweight = z,
         adjusted_selection = {{ selection_column }} * z))}
  else(return(z))
}

#' Wrapper for st_distance from sf that uses centroids of sample locations
#'
#' @param sample_locs sf object with the selection weighting column (polygons or points)
#' @param existing_sampling exisint sampling to down weight around (points)
#'
#' @return sf_distance matrix of distances with sample locations as rows and existing sampling as columns
#' @export
#'
#' @examples gen_dist_mat(BASSr::all_study_areas[1:10,], BASSr::all_study_areas[20:30,])
gen_dist_mat <- function(sample_locs,existing_sampling){
  suppressWarnings({
     sf::st_distance(sf::st_centroid(sample_locs), existing_sampling)
  })
}
