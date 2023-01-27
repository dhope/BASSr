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

check_costs <- function(costs, hex_id, omit_flag, quiet) {

  if(is.null(costs)) rlang::abort("`costs` cannot be NULL", call = NULL)

  if (!"X" %in% names(costs)) {
    if(!quiet) rlang::inform(
      c("!" = "Did you forget to add coordinates?",
        "*" = "I am adding them based on centroids"))

    costs <- sf::st_set_agr(costs, "constant") %>%
      sf::st_centroid()

    costs <- costs %>%
      sf::st_coordinates() %>%
      dplyr::as_tibble() %>%
      dplyr::bind_cols(costs)
  }

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