#' Create Hexagonal grid
#'
#' Function that takes a landscape as an sf object and returns a hexagonal grid of a given size.
#' Allowed inputs are hectres ('ha'), metres squared ('m2'), metres or kilometres ('m', or 'km')
#' as the diameter of each hexagon
#'
#' @details
#' If `hex_size` is provided as a units object (i.e., `units::set_units(100,
#' km^2)`) then the units can be any area or length unit recognized by the
#' `units` package and convertible to `m` or `m2`. Otherwise, if using a bare number in `hex_size` and
#' providing the units as a character in `units`, they must be one of `"m"`,
#' `"m2"`, `"km"`, `"km2"`, or `"ha"`.
#'
#' For example, `hex_size = units::set_units(100, ft)` will work, but `hex_size
#' = 100, units = "ft"` will not.
#'
#' @param land sf Spatial. Area over which to create hexagonal grid. Must be
#'   have a valid CRS. If lat/lon (i.e. CRS 4326) will be projected to 3347 to
#'   ensure proper units.
#' @param hex_size Numeric or Units. Size of hexagon in area or diagonal
#'   diameter. Can be a bear number (see `units`) or a `units` object with units
#'   embedded. See details for specifics.
#' @param units Character. Units of `hex_size` in `"m"`, `"m2"`, `"km"`,
#'   `"km2"`, or `"ha"`. Ignored if `hex_size` is a `units` object.
#' @param hex_prefix Character. Text to prefix to hexagon IDs. Default "SA_"
#'   results in hexagon ids of "SA_01", etc.
#' @param linear_type Character. Type of diameter to use when specifying linear
#'   hexagonal grid sizes. One of `"short_diagonal"` (default; for the short
#'   diameter from side to side, or centroid to centroid), or `"long_diagonal"`
#'   (for the long diameter from vertex to vertex passing through the centre of
#'   the hex).
#'
#' @return Returns a sf polygon layer of hexagons with unique IDs
#' @export
#'
#' @examples
#' library(sf)
#' plot <- st_polygon(list(cbind(c(-90,-90,-85,-85,-90),
#'                               c(50,55,55,50,50))))
#' plot <- sf::st_sfc(plot, crs = 4326) |>
#'   st_transform(3347)
#'
#' ggplot() +
#'   geom_sf(data = plot, fill = "white")
#'
#' # Create grid by area - 1000km2
#' grid <- create_study_area(plot, hex_size = 1000, units = "km2")
#'
#' # Check the area
#' st_area(grid[1,]) |>
#'   units::set_units("km2")
#'
#' # Check the visual
#' ggplot() +
#'   geom_sf(data = plot, fill = "white") +
#'   geom_sf(data = grid, fill = NA)
#'
#' # Create grid by diameter - 33.98088 km from side to side
#' grid2 <- create_study_area(plot, hex_size = 33.98088, units = "km")
#'
#' # Check the area - Hah! A hexagon with the diameter of 33.98088 km has an area of ~1,000km
#' st_area(grid2[1,]) |>
#'   units::set_units("km2")
#'
#' # Check the visual - Identical
#' ggplot() +
#'   geom_sf(data = plot, fill = "white") +
#'   geom_sf(data = grid2, fill = NA)
#'
#' # Diameter of a 1000 km2 hexagon is
#' area_km2 <- 1000
#' (sqrt(2 * area_km2 / (3 * sqrt(3)))) * sqrt(3)
#'
#' # Create grid by hectare
#' grid <- create_study_area(plot, hex_size = 40000, units = "ha")
#' ggplot() +
#'   geom_sf(data = plot, fill = "white") +
#'   geom_sf(data = grid, fill = NA)
#'
#' # Create grid with pre-set units
#' area <- units::set_units(1000, "km2", mode = "character")
#' grid <- create_study_area(plot, hex_size = area)
#' ggplot() +
#'   geom_sf(data = plot, fill = "white") +
#'   geom_sf(data = grid, fill = NA)

create_study_area <- function(land, hex_size, units = NULL, hex_prefix = "SA_",
                              linear_type = "short_diagonal") {

  if(!inherits(land, c("sf", "sfc")) ||
     is.na(sf::st_crs(land))) {
    abort("Landscape must be an sf/sfc object with a valid CRS.")
  }

  if(sf::st_is_longlat(land)) {
    warn(c("Projecting `land` using CRS 3347 (Stats Canada)",
         paste0("If this is inappropriate, use `st_transform(land, crs = XXXX)` with your ",
                "own CRS before using `create_study_area()`.")))
    land <- sf::st_transform(land, crs = 3347)
  }

  if(any(sf::st_geometry_type(land) %in% c("POINT", "LINESTRING", "MULTIPOINT", "MULTILINESTRING"))) {
    warn(c("POINT or LINESTRING geometry types detected.",
           "x" = "Hexagon grid may not be valid or cover study area.",
           "i" = "Polygon layers are recomended for landscape"))
  }

  # Check and set units
  hex_size <- check_units(hex_size, units) # Check and set

  # If linear cellsize, sf::st_make_grid() assumes short diagonals
  # So convert long_diagonal to short_diagonal
  if(is_linear(hex_size) & linear_type == "long_diagonal") hex_size <- hex_size * sqrt(3) / 2

  # Convert to non-ha - avoids issues with st_make_grid()
  # - Problem presumably arises because the units package cannot convert ha to m
  # - Cannot take the square root of ha, but can sqrt(m2) -> m
  # - https://github.com/r-quantities/units/issues/359
  if(is_ha(hex_size)) hex_size <- units::set_units(hex_size, "m2")

  # Diameter - vertice to vertice - is equal to the length of two sides

  # if(units == "m" | units == "km2") {
  #   warn(
  #     c("The units 'm' and 'km' require further development.",
  #       "x" = "Current values for these units are provide the  distance between the centroids of adjacent hexagons.",
  #       "i" = "Future implementation will allow selection of diameters and radii of the hexagons"))
  # }

  # Convert units to diameter of hexagon from vertex to vertex.
  # If units are provided as an area, much use small gemetric function to convert to m

  # ORIGINAL METHOD
  # calculate_cellsize <- function(area_ha) 2 * (sqrt(2 * area_ha / (3 * sqrt(3)))) * sqrt(3) / 2 * 100
  #
  # if(units == 'm2')  hex_diam1 <- calculate_cellsize(hex_size*1e-4) # Covert to ha and calculate diameter
  # if(units == 'km2') hex_diam1 <- calculate_cellsize(hex_size/0.01) # Convert km2 to ha then calculate diameter
  # if(units == 'ha')  hex_diam1 <- calculate_cellsize(hex_size)    # calculate diameter from ha
  # if(units == 'm')   hex_diam1 <- hex_size # Keep value as metres is provided
  # if(units == 'km')  hex_diam1 <- hex_size*1000    # Covert to metres

  # Generate grid
  land |>
    sf::st_make_grid(cellsize = hex_size, square = FALSE) |>
    sf::st_as_sf() |>
    sf::st_set_geometry("geometry") |>
    sf::st_filter(land) |>
    dplyr::mutate(
      hex_num = stringr::str_pad(1:dplyr::n(),
                                 width = floor(log10(dplyr::n())) + 1,
                                 pad = 0),
      hex_id = glue::glue("{hex_prefix}{hex_num}")) |>
    dplyr::select(-"hex_num")
}

check_units <- function(size, units, arg = caller_arg(size), call = caller_env()) {
  m <- NULL

  # Units in `units`
  if(!inherits(size, "units")) {

    if(!is.character(units)) {
      m <- "No units specified"
    } else if(!units %in% c("m", "km", "m2", "km2", "ha")) {
      m <- "Incorrect units specified"
    }

    if(!is.null(m)) {
      abort(c(
        m,
        "i" = paste0("Either `", arg, "` must be a units object, ",
                     "or `units` must contain the units as a character string ",
                     "('m', 'km', 'm2', 'km2', or 'ha')")
      ), call = call)
    }

    size <- units::set_units(size, units, mode = "character")
  }

  # Ensure area or linear
  if(!is_area(size) && !is_linear(size)) {
    abort(c("Incorrect units specified",
            "i" = paste0("Units from `", arg, "` or `units` must be convertible ",
                         "to 'm' or 'm2 (e.g., 'km', 'ha', etc.)")), call = call)
  }

  size
}

is_area <- function(x) {
  inherits(x, "units") && units::ud_are_convertible(units(x), "m2")
}

is_linear <- function(x) {
  inherits(x, "units") && units::ud_are_convertible(units(x), "m")
}

is_ha <- function(x) {
  inherits(x, "units") && units::ud_are_convertible(units(x), "ha")
}

sf_units <- function(x) {
  sf::st_crs(x, parameters = TRUE)$ud_unit
}
