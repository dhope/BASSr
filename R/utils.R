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

is_crs <- function(crs) {
  chk <- withr::with_options(
    list(warn = 2),
    try(sf::st_crs(crs), silent = TRUE))

  # No error/warning, no NA, no NULL = CRS!
  !(inherits(chk, "try-error") | is.na(chk) | is.null(chk))
}


set_seed <- function(seed, code) {
  if(is.null(seed)) code else withr::with_seed(seed, code)
}
