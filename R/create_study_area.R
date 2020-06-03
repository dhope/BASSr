## Create a study area with hexagons of a given size
# December 9, 2019
# David Hope

#' Create Study Area
#'
#' @param landscape larger area
#' @param study_area_diam study area diameter
#' @param hex_diam hexagon diameter
#' @param output output type
#'
#' @return
#' @export
#'
create_study_area <- function(landscape, study_area_diam, hex_diam, output = "small") {
  x <- raster::rasterToPoints(landscape, spatial = T)
  sp::proj4string(x) <- sp::CRS(landscape)

  study_area <- sp::spsample(x, type = "hexagonal", cellsize = study_area_diam, offset = c(0, 0))

  HexPols_lg <- sp::HexPoints2SpatialPolygons(study_area) %>%
    as("sf") %>%
    rownames_to_column("HEX100K")

  if (output == "large") {
    return(HexPols_lg)
  }

  small_hexes <- sp::spsample(x, type = "hexagonal", cellsize = hex_diam, offset = c(0, 0)) %>%
    sf::as("sf") %>%
    sf::st_join(., HexPols_lg, join = sf::st_covered_by)

  HexPols <- sp::HexPoints2SpatialPolygons(small_hexes) %>%
    rownames_to_column("HEX100")

  if (output == "small") {
    return(HexPols)
  }

  if (output == "all") {
    return(list(small = HexPols, large = HexPols_lg))
  }
}
