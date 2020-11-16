## Create a study area with hexagons of a given size
# December 9, 2019
# David Hope

#' Create Study Area
#'
#' @param landscape larger area
#' @param study_area_size size of study area in area or diameter (valid values include 'm2', 'ha', 'km2','km', 'm')
#' @param study_unit_size size of study unit in area or diameter (valid values include 'm2', 'ha', 'km2','km', 'm')
#' @param units Units of study area and sample units (valid values include 'm2', 'ha', 'km2','km', 'm')
#' @param output output type
#'
#' @return
#' @export
#'
create_study_area <- function(landscape, study_area_size, study_unit_size, units, output = "small") {
  calculate_cellsize <- function(area_ha){2* (sqrt(2*area_ha/(3*sqrt(3)))) * sqrt(3)/2 * 100}
  if(units == 'm2'){
    study_area_diam <- calculate_cellsize(study_area_size*1000)
    hex_diam <- calculate_cellsize(study_unit_size*10000) }
  if(units == 'km2'){
    study_area_diam <- calculate_cellsize(study_area_size*0.01)
    hex_diam <- calculate_cellsize(study_unit_size*0.01)    }
  if(units == 'ha'){
    study_area_diam <- calculate_cellsize(study_area_size)
    hex_diam <- calculate_cellsize(study_unit_size)
  }
  if(units == 'm'){study_area_diam <- study_area_size
  hex_diam <- study_unit_size}
  if(units == 'km'){study_area_diam <- study_area_size/1000
  hex_diam <- study_unit_size/1000   }

  # x <- raster::rasterToPoints(landscape, spatial = T)
  # sp::proj4string(x) <- sp::CRS(landscape)


  HexPols_lg <- st_make_grid(landscape, cellsize = study_area_diam,
                             square = F, what = 'polygons', offset = c(0,0)) %>%
    st_as_sf() %>%  mutate(StudyAreaID = glue::glue("SA_{str_pad(1:nrow(.), width = 4, pad = 0)}"))
  # sp::spsample(x, type = "hexagonal", cellsize = study_area_diam, offset = c(0, 0))

  # HexPols_lg <- sp::HexPoints2SpatialPolygons(study_area) %>%
  #   as("sf") %>%
  #   mutate(StudyAreaID = glue::glue("SA_{str_pad(1:nrow(.), width = 4, pad = 0)}"))

  if (output == "large") {
    return(HexPols_lg)
  }

  HexPols <- st_make_grid(landscape, cellsize = hex_diam, square = F, what = 'polygons', offset = c(0,0)) %>%
    st_as_sf() %>%  mutate(SampleUnitID = glue::glue("ONT_Hex_{str_pad(1:nrow(.), width = 7, pad = 0)}"))
  # small_hexes <- sp::spsample(x, type = "hexagonal", cellsize = hex_diam, offset = c(0, 0)) %>%
  #   sf::as("sf") %>%
  #   sf::st_join(., HexPols_lg, join = sf::st_covered_by)
  #
  # HexPols <- sp::HexPoints2SpatialPolygons(small_hexes) %>%
  #   mutate(SampleUnitID = glue::glue("ONT_Hex_{str_pad(1:nrow(.), width = 7, pad = 0)}"))

  if (output == "small") {
    return(HexPols)
  }

  if (output == "all") {
    return(list(small = HexPols, large = HexPols_lg))
  }
}
