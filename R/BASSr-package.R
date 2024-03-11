#' BASSr: Benefit Applied Strategic Sampling in R
#'
#' The BASSr package implements the Benefit Applied Strategic Sampling
#'
#' @docType package
#' @name BASSr
#' @importFrom magrittr %>%
#' @import rlang
#' @importFrom Rcpp sourceCpp
#' @useDynLib BASSr, .registration = TRUE
#'
NULL


# Dealing with CRAN Notes due to Non-standard evaluation
.onLoad <- function(libname = find.package("BASSr"),
                    pkgname = "BASSr"){

  # CRAN Note avoidance
  if(getRversion() >= "2.15.1")
    utils::globalVariables(
      c(".", " " # piping requires '.' at times
      )
    )
  invisible()
}
