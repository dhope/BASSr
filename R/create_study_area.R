## Create a study area with hexagons of a given size
# December 9, 2019
# David Hope

#' Create Hexagonal grid
#'
#' Function that takes a landscape as an sf object and returns a hexagonal grid of a given size.
#' Allowed inputs are hectres ('ha'), metres squared ('m2'), metres or kilometres ('m', or 'km')
#' as the diameter of each hexagon
#'
#' @param landscape larger area to create hexagonal grid over.must be sf object
#' @param hexagon_size size of hexagon in area or diameter in units (see variable units for options)
#' @param units Units of hexagonal units in area or diameter (valid values include 'm2', 'ha', 'km2','km', 'm')
#' @param HexagonID_label Name of column for hexigon id
#' @param HexagonID_prefix Prefix to affix to hexagon ID
#'
#' @return Returns a sf polygon layer of hexagons with unique IDs
#' @export
#'
create_study_area <- function(landscape, hexagon_size, units, HexagonID_label, HexagonID_prefix) {
  if(!any(grepl(pattern = "sf",class(landscape)))) rlang::abort("Landscape must be an sf object")
  if(any(all(sf::st_geometry_type(landscape)%in% c("POINT", "LINESTRING", "MULTIPOINT", "MULTILINESTRING")))){
    rlang::warn(c("POINT or LINESTRING geometry types detected.",
    "x"="Hexagon grid may not be valid or cover study area.",
    "i"= "Polygon layers are recomended for landscape"))
  }

  # Convert units to diameter of hexagon from vertex to vertex.
  # If units are provided as an area, much use small gemetric function to convert to m
  calculate_cellsize <- function(area_ha){2* (sqrt(2*area_ha/(3*sqrt(3)))) * sqrt(3)/2 * 100}

  if(units == 'm2'){    hex_diam <- calculate_cellsize(hexagon_size*1e-4) } # Covert to ha and calculate diameter
  if(units == 'km2'){    hex_diam <- calculate_cellsize(hexagon_size/0.01)    } # Convert km2 to ha then calculate diameter
  if(units == 'ha'){    hex_diam <- calculate_cellsize(hexagon_size)  } # calculate diameter from ha
  if(units == 'm'){  hex_diam <- hexagon_size} # Keep value as metres is provided
  if(units == 'km'){  hex_diam <- hexagon_size*1000   } # Covert to metres

  # Generate grid using sf::st_make_grid
  HexPols <- sf::st_make_grid(landscape, cellsize = hex_diam, square = F, what = 'polygons', offset = c(0,0)) %>%
    sf::st_as_sf() %>%
    dplyr::mutate({{HexagonID_label}} := # Generate hexagon ID labels
             glue::glue("{HexagonID_prefix}_{stringr::str_pad(1:nrow(.), width = floor(log10(nrow(.))) + 1, pad = 0)}"))
 return(HexPols)
}
