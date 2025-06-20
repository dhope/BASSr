# library(tidyverse)
# library(sf)
# su <- read_rds("C:/Users/hoped/Documents/Local_Workspace/Projects/BASSr_ONT/output_data/rds/NOntario_BASS_hexes.rds")$SampleUnits
# df_hex <- su[1234:1236,]
# df <- su[1234:1236,]
# df_preped <- df %>% sf::st_centroid %>% dplyr::bind_cols(as_tibble(st_coordinates(.))) %>% dplyr::select(-geometry)
# df_preped2 <- df %>% sf::st_centroid %>% dplyr::bind_cols(as_tibble(st_coordinates(.))) %>% dplyr::select(-geometry) %>%
#   mutate(type = c("full", "4corners", "2corners"))

#' Extract Point Count or multiple locations within a sample unit.
#'
#' @param df data.table or dplyr::tibble or sf object that contains sample units to add points to.
#' @param crs_ CRS to add to the points. Should be based on the centroids. Does not to be specificied if df is an 'sf' object.
#'
#' @return Returns an sf object with points within provided hexagons
#' @noRd
generate_Points_around_centroid <- function(df, crs_ = NULL) {

  if (is.null(crs_)) {
    crs_ <- sf::st_crs(df)
  }

  if (!("X" %in% names(df) & "Y" %in% names(df))) {
    if (!"sf" %in% class(df)) {
      stop("Object must either contain X & Y coordinates or be an object of type sf. Please fix and try again")
    } else {
      if(attr(df, "sf_column")=="x") sf::st_geometry(df) = "geometry"
      if (all(sf::st_is(df, "POLYGON"))) {
        message("Spatial Feature object should be points not polygons or GRTS expects clusters. Don't worry, I'll fix it!")
        df <- sf::st_centroid(df)
      }
      df <- df %>%
        dplyr::bind_cols(as_tibble(st_coordinates(.))) %>%
        dplyr::select(-geometry)
    }
  }
  if (!"type" %in% names(df)) {
    df$type <- "full"
  }
  calc_loc <- function(X, Y, type = "full", crs_) {
    if (type == "full") {
      locs <- dplyr::tibble(
        distance = c(
          0, 300, 424, 300, 424, 300, 424, 300, 424
        ),
        bearing = c(0, 0, 45, 90, 135, 180, 225, 270, 315)
      )
    }

    if (grepl("corners", type)) {
      locs <- dplyr::tibble(
        distance = c(
          424, 424, 424, 424
        ),
        bearing = c(45, 135, 225, 315)
      )
    }
    if (type == "2corners") {
      b <- sample(c(1, 3), 1) * 45
      locs <- dplyr::tibble(distance = rep(424, 2), bearing = c(b, b + 180))
    }


    locs %>%
      dplyr::mutate(
        rad = bearing * pi / 180,
        x = cos(rad) * distance + X,
        y = sin(rad) * distance + Y,
        PointID = 1:nrow(.)
      ) %>%
      sf::st_as_sf(coords = c("x", "y"), crs = crs_)
  }
  df %>%
    sf::st_drop_geometry() |>
    dplyr::rowwise() |>
    dplyr::mutate(points = list(calc_loc(X, Y, type, crs_ = crs_))) %>%
    tidyr::unnest(cols = c(points)) %>%
    sf::st_as_sf()
}
