#' Create sampling sites within hexagons
#'
#' Creates a grid of sites within the hexagon grid cells created by
#' `create_hexes()`. These sites can then be sampled with `sample_sites()`.
#'
#' @param hexes Spatial Data frame. Hexagon grid across sampling region.
#'   Requires column identifying the hexagon IDs (see `hex_id`)
#' @param spacing Numeric. Distance between sites. Units
#'   are assumed to be those of `hex` spatial data frame.
#' @param n Numeric. *Approximate* number of sites to create within a hex grid.
#'
#' @inheritParams common_docs
#'
#' @return Spatial data frame of sites as points.
#' @export
#'
#' @examples
#' # Get sites by exact within-hex distances
#' sites_sp <- create_sites(psu_hexagons, spacing = 5)
#'
#' # Get sites by approximate number of points (but equal spacing among hexes)
#' sites_n <- create_sites(psu_hexagons, n = 61)
#'
#' # Same number of sites, but in slightly different spots, because creating by
#' # n maximizes spacing, but creating by spacing using the exact spacing
#' # specified.
#'
#' library(ggplot2)
#' ggplot() +
#'   geom_sf(data = psu_hexagons) +
#'   geom_sf(data = sites_sp, size = 0.5, colour = "red") +
#'   geom_sf(data = sites_n, size = 0.5, colour = "blue")

create_sites <- function(hexes, spacing = NULL, n = NULL, hex_id = hex_id) {

  # Checks
  check_spatial(hexes)

  if((is.null(spacing) & is.null(n)) || (!is.null(spacing) & !is.null(n))) {
    abort("Must supply one of `spacing` or `n`")
  } else if(!is.null(spacing)) {
    check_int(spacing, range = c(1, Inf))
  } else if(!is.null(n)) {
    check_int(n, range = c(1, Inf))
  }

  # Prep data
  hexes <- sf::st_set_geometry(hexes, "geometry")
  hex <- hexes[1, ]

  # Assume all hexes are identical
  points <- dplyr::as_tibble(sf::st_coordinates(hex))
  top_point <- points[which.max(points$Y),]
  bottom_point <- points[which.min(points$Y),]

  if(!is.null(n)) {
    n <- n_points(hex, n)
    spacing <- as.numeric(sqrt(sf::st_area(hex) / n))
  }

  gridsize <- ceiling(abs(top_point[["Y"]] - bottom_point[["Y"]]) / spacing / 2) + 1
  rowAngle <- tanh((top_point[["X"]] - bottom_point[["X"]]) /
                     (top_point[["Y"]] - bottom_point[["Y"]]))

  # Get all hexes as centroids
  cent <- add_coords(hexes) |>
    sf::st_drop_geometry()

  create_row <- function(cX, cY){
    tibble::tibble(rowid = seq(-.env[["gridsize"]], .env[["gridsize"]])) |>
      dplyr::mutate(
        X = sin(60 * pi / 180 + .env[["rowAngle"]]) * .env[["spacing"]] * .data[["rowid"]] + {{ cX }},
        Y = cos(60 * pi / 180 + .env[["rowAngle"]]) * .env[["spacing"]] * .data[["rowid"]] + {{ cY }})
  }

  # Create a single grid of points for a single hex
  grid <- dplyr::tibble(crowid = seq(-gridsize, gridsize)) |>
    dplyr::mutate(
      cY = cos(.env[["rowAngle"]]) * .env[["spacing"]] * .data[["crowid"]] + cent$Y[1],
      cX =  sin(.env[["rowAngle"]]) * .env[["spacing"]] * .data[["crowid"]] + cent$X[1]) |>
    dplyr::mutate(row = purrr::map2(.data[["cX"]], .data[["cY"]], create_row)) |>
    tidyr::unnest("row") |>
    dplyr::select("X", "Y") |>
    sf::st_as_sf(coords = c("X", "Y"), crs = sf::st_crs(hex)) |>
    sf::st_filter(hex[1,])

  # Get the centroid of this grid
  cent_grid <- sf::st_union(grid) |>
    sf::st_centroid()

  # Shift and add the grid to each hexagon in turn
  # - subtract the cent_grid, then add the hex centroid points
  cent |>
    dplyr::mutate(
      grid = list(grid$geometry),
      sites = purrr::pmap(list(.data[["X"]], .data[["Y"]], .data[["grid"]]),
                          \(x, y, g) g - cent_grid + c(x, y))
    ) |>
    dplyr::select({{ hex_id }}, "sites") |>
    tidyr::unnest("sites") |>
    sf::st_as_sf(crs = sf::st_crs(hexes)) |>
    sf::st_set_geometry("geometry") |>
    dplyr::mutate(site_id = 1:dplyr::n()) |>
    dplyr::relocate("site_id", .after = "hex_id")
}


# Find the nearest appropriate number of points in the grid pattern
n_points <- function(hex, n) {

  area <- as.numeric(sf::st_area(hex))[1]
  diam <- sqrt((2 * area) / (3 * sqrt(3))) * 2

  # n points along the diameter
  n1 <- floor(diam / sqrt(area/n))
  if(n1 %% 2 == 0) n1 <- n1 + 1
  n2 <- ceiling(n1/2)

  # Best number of points
  sum(c(n1:n2)*2) - n1
}

