#' BASSr: Boreal Avian Strategic Sampling in R
#'
#' The BASSr package implements the Boreal Approach to Suitable Sampling Design
#'
#' @docType package
#' @name BASSr
#' @import dplyr
#' @import tidyr
#' @import rlang
#' @import spsurvey
#' @import sf
#' @importFrom methods as
#' @importFrom utils capture.output data
#' @useDynLib BASSr, .registration = TRUE
#'
NULL


#' Polygon SF of Ontario
#'
#' A dataset containing the prices and other attributes of almost 54,000
#' diamonds.
#'
#' @format A data frame with 53940 rows and 10 variables:
#' \describe{
#'   \item{price}{price, in US dollars}
#'   \item{carat}{weight of the diamond, in carats}
#'   ...
#' }
#' @source \url{http://www.diamondse.info/}
"ontario"

#' rgb colour codes to plot 2015 National Land Cover.
#'
#' A dataset containing red, blue, green values associated with
#' all the land cover types found in the 2015 Canadian National
#' Land Cover Classification
#'
#' @format A data frame with 20 rows and 6 variables:
#' \describe{
#'   \item{Value}{price, in US dollars}
#'   \item{red}{weight of the diamond, in carats}
#'   \item{green}{weight of the diamond, in carats}
#'   \item{blue}{weight of the diamond, in carats}
#'   \item{rgb}{weight of the diamond, in carats}
#'   \item{LCC_NAME}{weight of the diamond, in carats}
#'
#' }
#' @source \url{http://www.diamondse.info/}
"clrfile"

#' 2015 National Landcover Classification Table
#'
#' A dataset containing the prices and other attributes of almost 54,000
#' diamonds.
#'
#' @format A data frame with 53940 rows and 10 variables:
#' \describe{
#'   \item{price}{price, in US dollars}
#'   \item{carat}{weight of the diamond, in carats}
#'   ...
#' }
#' @source \url{http://www.diamondse.info/}
"lcc2015_codes"

#' All of Ontario's Study Areas
#'
#' A simple features (package SF) object with all of Ontario's Study Areas and the associated Land Cover
#'
#' @format A data frame with 746 rows and 19 variables:
#' \describe{
#'   \item{StudyAreaID}{Unique Identifier for each study area}
#'   \item{TOT_HA}{Total hectares in study area}
#'   \item{D_CLC15}{Dominant land cover in study area}
#'   \item{LC..}{Hectares covered by landcover type (00-18)}
#'   ...
#'   \item{geometry}{SF geometry}
#' }
#' @source Hexagons generated in R, landcover extracted from National Land Cover 2015.
"all_study_areas"

#' BASSr data needed for example study area
#'
#' A list containing the cost, landcover, and id for an example study area
#'
#' @format A list of 2 dataframes and one character string:
#' \describe{
#'   \item{cost}{cost estimates for each sample unit}
#'   \item{landcover}{SF polygon with land cover in percentages for each sample unit}
#'   \item{study_area}{Unique identifier for Study Area}
#' }
#' @source \url{http://www.diamondse.info/}
"StudyArea_hexes"


