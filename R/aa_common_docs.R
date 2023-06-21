# common_docs ------------------
#' Common arguments and documentation for various functions
#'
#' @param num_runs Numeric. Number of times to draw random samples.
#' @param land_hex (Spatial) Data frame. Land Cover data by hexagon. If
#'   non-spatial, will be converted to spatial sf data frame using the `crs` and
#'   `coords` arguments. Requires columns identifying the Hex ID as well as the
#'   Stratum ID (see `hex_id` and `stratum_id` respectively).
#' @param stratum_id Column. Identifies larger area (e.g., `StudyAreaID` or
#'   `Province`).
#' @param hex_id Columns. Identifies hexagon ids (e.g., `hex_id` or `ET_Index`).
#' @param costs Data frame. Costs for each hexagon in a RawCost format.
#' @param crs Numeric, character, or sf/sfc. Coordinate reference system. Must
#'   be valid input to `sf::st_crs()`.
#' @param coords Character vector. Names of the columns containing X and Y
#'   coordinates (default `c("lon", "lat")`).
#'
#' @details
#' Use `@inheritParams common_docs` to include the above in any function
#' documentation with a matching argument (will only include matching args)
#'
#' @keywords internal
#' @name common_docs
NULL
