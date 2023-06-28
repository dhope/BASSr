check_lc_names <- function(cols, pattern) {

  # Make sure matches
  if(length(cols) == 0) {
    rlang::abort("`pattern` did not match any names in `land_hex`", call = NULL)
  }

  # Make sure leftover is numeric
  cols2 <- stringr::str_remove(cols, pattern)

  t <- withr::with_options( # Temporarily return warnings as errors
    list(warn = 2),
    try(as.numeric(cols2), silent = TRUE))

  if(inherits(t, "try-error")) {
    msg <- c("x" = "`pattern` did not match all the land cover preamble")

    # Try to help
    add <- unique(stringr::str_remove(cols2, "[[:digit:]]+$"))
    if(length(add) == 1) {
      msg <- c(
        msg,
        "*" = paste0("Consider using '",
                     stringr::str_remove(pattern, "\\^"), add,
                     "' instead"))
    }

    rlang::abort(msg, call = NULL)
  }
}

check_land_hex <- function(land_hex, crs = NULL, coords = NULL, quiet) {

  # If not sf, convert
  if (!inherits(land_hex, "sf")) {
    check_crs(crs)
    if(all(is.na(coords)) || is.null(coords) || length(coords) != 2) {
      rlang::abort(
        paste0("`coords` must be names of coordinate columns in `land_hex` ",
               "which can be used to convert\nthis data frame to a ",
               "spatial data frame (see `coords` in ?sf::st_as_sf())."),
        call = NULL)
    }

    check_column_text(land_hex, coords[1])
    check_column_text(land_hex, coords[2])

    land_hex <- sf::st_as_sf(land_hex, coords = coords, crs = crs)
    if(!quiet) {
      rlang::inform(
        c("!" = "Converting `land_hex` to spatial data frame",
          "*" = glue::glue("crs = {crs}"),
          "*" = glue::glue("coords = {glue::glue_collapse(coords, ',')} (X,Y)")))
    }

  }

  land_hex <- check_points(land_hex, quiet)
  check_land_cover(land_hex)

  land_hex
}

check_land_cover <- function(land_hex) {
  if(!any(grepl("^LC\\d",names(land_hex)))) {
    rlang::abort(c("Land cover columns not formatted correctly",
                   "*" = "Try running `clean_land_cover()`"), call = NULL)
  }
  if(sum(is.na(dplyr::select(land_hex, dplyr::matches("^LC\\d"))))) {
    rlang::abort("Missing values in land cover columns", call = NULL)
  }
}

#' Check POINT vs. POLYGON
#'
#' Checks for polygons and converts to points if necessary.
#'
#' @param land_hex Spatial hex grid with Land cover attributes
#' @param quiet Logical. Whether to suppress progress messages.
#'
#' @noRd
check_points <- function(land_hex, quiet) {

  if (all(sf::st_is(land_hex, "POLYGON"))) {
    if(!quiet) {
      nm <- deparse(substitute(land_hex))
      rlang::inform(c(
        "i" = paste0("Spatial object ", nm, " should be POINTs not POLYGONs"),
        "*" = "Don't worry, I'll fix it!",
      "*" = "Assuming constant attributes and using centroids as points"))
    }
    land_hex <- land_hex %>%
      sf::st_set_agr("constant") %>%
      sf::st_centroid(land_hex)
  }
  land_hex
}

check_costs <- function(costs, hex_id, omit_flag) {

  if(is.null(costs)) rlang::abort("`costs` cannot be NULL", call = NULL)

  # Make RawCosts NA, on omit column
  if(!rlang::quo_is_null(rlang::enquo(omit_flag))) {
    costs <- dplyr::mutate(costs,
                           RawCost = dplyr::if_else({{ omit_flag }},
                                                    NA_real_,
                                                    .data$RawCost))
  }

  if (!"RawCost" %in% names(costs)) {
    if("NEAR_DIST" %in% names(costs)) {
      rlang::inform(
        c("!" = "No `RawCost` column in `costs`",
          "*" = "Calculating rough costs with `NEAR_DIST`",
          "*" = "Assigning hex cost of 5000 when > 1000m from the road"))

      costs <- dplyr::mutate(costs,
                             RawCost = dplyr::if_else(.data$NEAR_DIST > 1000,
                                                      5000,
                                                      .data$NEAR_DIST))
    } else {
      rlang::abort(
        c("No `RawCost` column in `costs`",
          "!" = "Cannot calculate rough costs: No `NEAR_DIST` column"),
        call = NULL)
    }
  }

  costs
}

#' Check if `col` is in `data` (tidyeval style)
#'
#' Only checks non-NULL columns (stringified by `as_label()`).
#'
#' @examples
#' check_column(mtcars, mpg)
#' @noRd
check_column <- function(data, col) {
  col <- rlang::enquo(col)

  if(!rlang::quo_is_null(col)) {
    nm <- rlang::as_label({{ col }})

    if(!nm %in% names(data)) {
      rlang::abort(glue::glue(
        "Column '{nm}' not found in data frame `{deparse(substitute(data))}`"),
        call = NULL)
    }
  }
}

check_column_text <- function(data, col) {
  if(!col %in% names(data)) {
    rlang::abort(glue::glue(
      "Column '{col}' not found in data frame `{deparse(substitute(data))}`"),
      call = NULL)
  }
}

check_crs <- function(crs) {
  if(!is_crs(crs)) {
    rlang::abort(
      "`crs` must be a valid Coordinate Reference System for `sf::st_crs()`",
      call = NULL)
  }
}

