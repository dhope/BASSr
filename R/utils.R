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
