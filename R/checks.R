check_costs <- function(costs, HexID, omit, quiet) {

  if(is.null(costs)) rlang::abort("`costs` cannot be NULL", call = NULL)

  check_column(costs, HexID)
  check_column(costs, omit)

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

  # Make omit column NA
  if(!rlang::quo_is_null(omit)) {
    costs <- dplyr::mutate(costs,
                           RawCost = dplyr::if_else({{ omit }},
                                                    NA_real_,
                                                    .data$RawCost))
  }

  if (!"RawCost" %in% names(costs) && "NEAR_DIST" %in% names(costs)) {
    rlang::inform(
      c("!" = "No `RawCost` column in `costs`",
        "*" = paste0("Assigning hex cost of 5000 when > 1000m from the road ",
                     "(`NEAR_DIST`)")))

    costs <- dplyr::mutate(costs,
                           RawCost = dplyr::if_else(.data$NEAR_DIST > 1000,
                                                    5000,
                                                    .data$NEAR_DIST))
  }

  check_column(costs, "RawCost")

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
  nm <- NULL
  if(is.character(col) & !is.null(col)) {
    nm <- col
  } else if(rlang::is_quosure(col) & !rlang::quo_is_null(col)) {
    nm <- rlang::as_label(col)
  }

  if(!is.null(nm) && !nm %in% names(data)) {
    rlang::abort(glue::glue(
      "Column '{nm}' not found in data frame `{deparse(substitute(data))}`"),
      call = NULL)
  }
}
