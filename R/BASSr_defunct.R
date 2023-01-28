#' BASSr defunct functions
#'
#' @param ... Original function arguments
#'
#' @name BASSr-defunct
#'
#' @description
#'
#'
NULL


#' @rdname BASSr-defunct
clean_forBass <- function(...) {
  rlang::abort("'clean_forBass()' is defunct. Use 'clean_land_cover()` instead",
               call = NULL)
}
