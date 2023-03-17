check_lc_names <- function(cols, pattern) {

  # Make sure matches
  if(length(cols) == 0) {
    rlang::abort("`pattern` did not match any names in `att_sf`", call = NULL)
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

check_att_sf <- function(att_sf, quiet) {

  if (!inherits(att_sf, "sf")) {
    rlang::abort(paste0("`att_sf` must be an 'sf' spatial object ",
                        "(see https://r-spatial.github.io/sf/)"), call = NULL)
  }

  att_sf <- check_points(att_sf, quiet)
  check_land_cover(att_sf)

  att_sf
}

check_land_cover <- function(att_sf) {
  if(!any(grepl("^LC\\d",names(att_sf)))) {
    rlang::abort(c("Land cover columns not formatted correctly",
                   "*" = "Try running `clean_land_cover()`"), call = NULL)
  }
  if(sum(is.na(dplyr::select(att_sf, dplyr::matches("^LC\\d"))))) {
    rlang::abort("Missing values in land cover columns", call = NULL)
  }
}

#' Check POINT vs. POLYGON
#'
#' Checks for polygons and converts to points if necessary.
#'
#' @param att_sf
#' @param quiet
#'
#' @noRd
check_points <- function(att_sf, quiet) {

  if (all(sf::st_is(att_sf, "POLYGON"))) {
    if(!quiet) {
      nm <- deparse(substitute(att_sf))
      rlang::inform(c(
        "i" = paste0("Spatial object ", nm, " should be POINTs not POLYGONs"),
        "*" = "Don't worry, I'll fix it!",
      "*" = "Assuming constant attributes and using centroids as points"))
    }
    att_sf <- att_sf %>%
      sf::st_set_agr("constant") %>%
      sf::st_centroid(att_sf)
  }
  att_sf
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
