# library(tidyverse)
# library(sf)
# su <- read_rds("C:/Users/hoped/Documents/Local_Workspace/Projects/BASSr_ONT/output_data/rds/NOntario_BASS_hexes.rds")$SampleUnits
# df_hex <- su[1234:1236,]
# df <- su[1234:1236,]
# df_preped <- df %>% st_centroid %>% bind_cols(as_tibble(st_coordinates(.))) %>% dplyr::select(-geometry)
# df_preped2 <- df %>% st_centroid %>% bind_cols(as_tibble(st_coordinates(.))) %>% dplyr::select(-geometry) %>%
#   mutate(type = c("full", "4corners", "2corners"))

#' Extract Point Count or multiple locations within a sample unit.
#'
#' @param df data.table or tibble or sf object that contains sample units to add points to.
#' @param crs_ CRS to add to the points. Should be based on the centroids. Does not to be specificied if df is an 'sf' object.
#'
#' @return Returns an sf object with points within provided hexagons
#' @export
generate_Points_around_centroid <- function(df, crs_ = NULL) {
  if (is_null(crs_)) {
    crs_ <- st_crs(df)
  }

  if (!("X" %in% names(df) & "Y" %in% names(df))) {
    if (!"sf" %in% class(df)) {
      stop("Object must either contain X & Y coordinates or be an object of type sf. Please fix and try again")
    } else {
      if (all(sf::st_is(df, "POLYGON"))) {
        message("Spatial Feature object should be points not polygons or GRTS expects clusters. Don't worry, I'll fix it!")
        df <- st_centroid(df)
      }
      df <- df %>%
        bind_cols(as_tibble(st_coordinates(.))) %>%
        dplyr::select(-geometry)
    }
  }
  if (!"type" %in% names(df)) {
    df$type <- "full"
  }
  calc_loc <- function(X, Y, type = "full", crs_) {
    if (type == "full") {
      locs <- tibble(
        distance = c(
          0, 300, 424, 300, 424, 300, 424, 300, 424
        ),
        bearing = c(0, 0, 45, 90, 135, 180, 225, 270, 315)
      )
    }

    if (grepl("corners", type)) {
      locs <- tibble(
        distance = c(
          424, 424, 424, 424
        ),
        bearing = c(45, 135, 225, 315)
      )
    }
    if (type == "2corners") {
      b <- sample(c(1, 3), 1) * 45
      locs <- tibble(distance = rep(424, 2), bearing = c(b, b + 180))
    }


    locs %>%
      mutate(
        rad = bearing * pi / 180,
        x = cos(rad) * distance + X,
        y = sin(rad) * distance + Y,
        PointID = 1:nrow(.)
      ) %>%
      st_as_sf(coords = c("x", "y"), crs = crs_)
  }

  df %>%
    # nest(loc = c(X,Y,type)) %>%
    mutate(points = pmap(list(X, Y, type),
      calc_loc,
      crs_ = crs_
    )) %>%
    unnest(cols = c(points)) %>%
    st_as_sf()
}
