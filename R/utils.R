

#' Add coordinates of an sf object to itself
#'
#' @param sf Spatial data frame
#' @noRd
add_coords <- function(sf) {
  # Set attributes as constant to avoid sf warnings
  # (cf. https://github.com/r-spatial/sf/issues/406)
  sf <- sf::st_set_agr(sf, "constant") %>%
    sf::st_centroid()

  sf %>%
    sf::st_coordinates() %>%
    dplyr::as_tibble() %>%
    dplyr::bind_cols(sf, .)
}


#' Check whether value is valid CRS
#'
#' Uses `sf::st_crs()` to see if can be coerced. Returns `TRUE` if yes, `FALSE`
#' if not. (No errors)
#'
#' @param crs Object to test
#'
#' @noRd
is_crs <- function(crs) {
  chk <- withr::with_options(
    list(warn = 2),
    try(sf::st_crs(crs), silent = TRUE))

  # No error/warning, no NA, no NULL = CRS!
  !(inherits(chk, "try-error") | is.na(chk) | is.null(chk))
}


#' Set seed unless NULL
#'
#' Wrapper around `withr::with_seed()` to ensure that if `seed` is `NULL`, it
#' is just *quietly* ignored (otherwise `withr` sends a warning)
#'
#' @param seed Numeric. Seed to use.
#' @param code Code. Code to be evaluated with the seed.
#' @noRd
#' @examples
#'
#' set_seed(NULL, sample(1:10, 2))
#' set_seed(NULL, sample(1:10, 2))
#' set_seed(NULL, sample(1:10, 2))
#'
#' set_seed(123, sample(1:10, 2))
#' set_seed(123, sample(1:10, 2))
#' set_seed(123, sample(1:10, 2))
set_seed <- function(seed, code) {
  if(is.null(seed)) code else withr::with_seed(seed, code)
}
