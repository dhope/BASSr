# common_docs ------------------
#' Common arguments and documentation for various functions
#'
#' @param num_runs Numeric. Number of times to draw random samples.
#' @param n_samples Numeric. Number of samples to draw in each run.
#' @param land_hex (Spatial) Data frame. Land Cover data by hexagon. If
#'   non-spatial, will be converted to spatial sf data frame using the `crs` and
#'   `coords` arguments. Requires columns identifying the Hex ID as well as the
#'   Stratum ID (see `hex_id` and `stratum_id` respectively).
#' @param stratum_id Column. Identifies larger area (e.g., `StudyAreaID` or
#'   `Province`).
#' @param hex_id Column. Identifies hexagon ids (e.g., `hex_id` or `ET_Index`).
#' @param omit_flag Column identifying hexes to omit (e.g., water hexes).
#' @param costs Data frame. Costs for each hexagon in a RawCost format.
#' @param crs Numeric, character, or sf/sfc. Coordinate reference system. Must
#'   be valid input to `sf::st_crs()`.
#' @param coords Character vector. Names of the columns containing X and Y
#'   coordinates (default `c("lon", "lat")`).
#' @param non_random_set Character vector. `hex_id`s of hexagons to include as a
#'   non randomly selected set.
#' @param benefit_weight Numeric. Weight assigned to benefit in the selection
#'   probabilities. 0.5 is equal weighting of cost and benefits. 1.0 is zero
#'   weighting to cost. Default 0.5.
#' @param land_cover_weights Data frame. Proportional weights
#'   (`weights` column) for specific types of landcover (`lc` column). `lc`
#'   should correspond to the same landcover column names as the hex data.
#' @param return_grts Logical. Return the `spsurvey` object(s).
#' @param ... Extra named arguments passed on to `spsurvey::grts()`.
#' @param seed Numeric. Random seed to use for random sampling. Seed only
#'   applies to specific sampling events (does not change seed in the
#'   environment). `NULL` does not set a seed.
#' @param quiet Logical. Whether to suppress progress messages.
#'
#' @details
#' Use `@inheritParams common_docs` to include the above in any function
#' documentation with a matching argument (will only include matching args)
#'
#' # Extra arguments
#'
#' Extra named arguments for `spsurvey::grts()` can also be passed on via `...`.
#' In particular, note that the default values for `mindis` (minimum distance
#' between sites) is `NULL`, and `maxtry` (maximum attempts to try to obtain the
#' minimum distance between sites) is 10.
#'
#' @keywords internal
#' @name common_docs
NULL
