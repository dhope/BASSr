#' Check landcover column names
#'
#' Catches problems and tries to guide user, otherwise simply removes `pattern`
#' from column names.
#'
#' @param cols Character vector. Matched column names to check.
#' @param pattern Character. Pattern to search for and remove from column names.
#'
#' @noRd
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

#' Check land hex data set
#'
#' - Check for required columns
#' - If not spatial, converts to sf using crs and coords
#' - Checks that GEOMETRY are points not polygons (and converts)
#' - Checks that landcover columns have been properly cleaned and formatted
#'
#' @param land_hex (Spatial) data frame of landcover hexes
#' @param crs Numeric. For converting to spatial (higher level functions
#'   generally assume GPS)
#' @param coords Numeric vector. X/Y coordinates (higher level functions
#'   generally assume lon/lat)
#' @param hex_id Column. Hex id column
#' @param stratum_id Column. Stratum column
#' @param quiet Logical. Whether to suppress progress/FYI messages.
#'
#' @noRd
check_land_hex <- function(land_hex, crs = NULL, coords = NULL, quiet = FALSE) {


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

#' Check samples data set
#'
#' - Check for required columns
#' - If spatial, removes geometry
#' - Checks that subset of `land_hex`
#'
#' @param samples Output of `draw_random_samples()`
#' @param hex_id Column. Hex id column
#' @param stratum_id Column. Stratum column
#' @param land_hex (Spatial) data frame of land cover hexes
#'
#' @noRd
check_samples <- function(samples, land_hex, hex_id, stratum_id) {

  samples <- sf::st_drop_geometry(samples)

  s <- dplyr::select(samples, {{ hex_id }}, {{ stratum_id }}, dplyr::starts_with("LC"))
  s <- try(dplyr::anti_join(s, land_hex, by = names(s)), silent = TRUE)

  if(inherits(s, "try-error") || nrow(s) > 1) {
    rlang::abort(
      c("`samples` are not a subset of `land_hex`",
        "!" = "`samples` should come from `draw_random_samples()` using the same `land_hex` as here."),
      call = NULL)
  }

  samples
}

check_probs <- function(probs) {

  if(!inherits(probs, "sf") || !"inclpr" %in% names(probs)) {
    rlang::abort(
      c("`probs` must be output of `calculate_inclusion_probs()`",
        "*" = "a spatial data frame with a 'inclpr' column"), call = NULL)
  }

}

#' Check that land cover column names are correctly formatted
#'
#' @param land_hex (Spatial) data frame. Hex grid with land cover.
#'
#' @noRd
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
#' @param land_hex Spatial data frame. Hex grid with land cover.
#' @param quiet Logical. Whether to suppress progress/FYI) messages.
#'
#' @noRd
check_points <- function(land_hex, quiet = FALSE) {

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

#' Check that non random set contains valid hex ids
#'
#' - Can be NULL
#' - Should be hex_ids from `land_hex`
#'
#' @param non_random_set Hex ids to compare
#' @param land_cover Data frame with hex ids
#' @param hex_id Column. Hex ids
#'
#' @noRd
check_non_random_set <- function(non_random_set, hex_ids) {
  if(!all(non_random_set %in% hex_ids)) {
    rlang::abort(
      c("`non_random_set` must contain hex ids found in `land_hex`",
        "!" = "Some are not present in `land_hex`"), call = NULL)
  }
}

#' Check that land cover weights are valid
#'
#' - Can be NULL
#' - Check that data frame with correct columns
#' - Warn if some land covers in the data frame do not exist in the `land_hex`
#'   data.
#'
#' @param land_cover_weights Object to check (should be data frame)
#' @param land_hex Data frame of hexs with land cover
#'
#' @noRd
check_land_cover_weights <- function(land_cover_weights, land_hex) {
  if(!is.null(land_cover_weights)) {
    if(!inherits(land_cover_weights, "data.frame") ||
       !all(c("lc", "weights") %in% names(land_cover_weights))) {
      rlang::abort(
        "`land_cover_weights` must be a data frame with columns `lc` and `weights`",
        call = NULL)
    }

    if(!all(land_cover_weights$lc %in% stringr::str_subset(names(land_hex), "^LC"))) {
      rlang::warn(
        "Some land covers in `land_cover_weights` do not exist in `land_hex`",
        call = NULL)
    }
  }
}

check_benefits <- function(benefits) {
  if(!inherits(benefits, "sf") || !"benefit" %in% names(benefits)) {
    rlang::abort(
      c("`benefits` must be output of `calculate_benefit()`",
        "*" = "a spatial data frame with a 'benefit' column"), call = NULL)
  }
}

#' Check costs data frame
#'
#' - Checks for appropriate columns (RawCosts, or uses NEARDIST instead)
#' - Sets costs to `NA` where omitted.
#'
#' @param costs (Spatial) Data frame. Contains information on sampling costs per
#'   hex
#' @param omit_flag Column. Column of TRUE/FALSEs identifying hexes which should
#'   be omitted from cost calculations.
#' @noRd
check_costs <- function(costs, omit_flag) {

  if(is.null(costs)) rlang::abort("`costs` cannot be NULL", call = NULL)

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

  # Make RawCosts NA, on omit column
  if(!rlang::quo_is_null(rlang::enquo(omit_flag))) {
    costs <- dplyr::mutate(costs,
                           RawCost = dplyr::if_else({{ omit_flag }},
                                                    NA_real_,
                                                    .data$RawCost))
  }

  sf::st_drop_geometry(costs)
}

#' Check if `col` is in `data` (tidyeval style)
#'
#' Only checks non-NULL columns (stringified by `as_label()`).
#'
#' @examples
#' check_column(mtcars, mpg)
#' @noRd
check_column <- function(data, col) {

  .col <- rlang::enquo(col)

  if(!rlang::quo_is_null(.col)) {
    nm <- rlang::as_label(.col)

    if(!nm %in% names(data)) {
      rlang::abort(glue::glue(
        "Column '{nm}' not found in data frame `{deparse(substitute(data))}`"),
        call = NULL)
    }
  }
}

#' Check if `col` is in `data` (text style)
#'
#' Must be non-NULL.
#'
#' @examples
#' check_column_text(mtcars, "mpg")
#' @noRd
check_column_text <- function(data, col) {
  if(!col %in% names(data)) {
    rlang::abort(glue::glue(
      "Column '{col}' not found in data frame `{deparse(substitute(data))}`"),
      call = NULL)
  }
}

#' Ensure CRS is valid
#'
#' @param crs Any object to test
#'
#' @noRd
check_crs <- function(crs) {
  if(!is_crs(crs)) {
    rlang::abort(
      "`crs` must be a valid Coordinate Reference System for `sf::st_crs()`",
      call = NULL)
  }
}

check_int <- function(int, range, arg = caller_arg(int), call = caller_env()) {

  if(missing(int) || (!is.null(int) && (round(int) != int || !(int >= range[1] && int <= range[2])))) {
    rlang::abort(glue::glue(
      "{arg} must be an integer between ",
      "{range[1]} and {range[2]}"), call = call)
  }
}

check_char <- function(char, arg = caller_arg(char), call = caller_env()) {
  if(!is.character(char)) {
    abort(glue::glue("{arg} must be text"), call = call)
  }
}
