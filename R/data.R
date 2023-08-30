#' Polygon SF of Ontario
#'
#' A poloygon with the outline of Ontario
#'
#' @format A simple feature data frame with 1 rows and 2 variables:
#' \describe{
#'   \item{PROV}{Two letter code for Ontario}
#'   \item{NAME}{Name of Province}
#'   \item{geometry}{SF geometry}
#' }
#' @source Map of Canadian Jurisdictions
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
#' @source \url{https://open.canada.ca/data/en/dataset/4e615eae-b90c-420b-adee-2ca35896caf6}
"clrfile"

#' 2015 National Landcover Classification Table
#'
#' Key for land cover codes and names
#'
#' @format A data frame with 19 rows and 2 variables:
#' \describe{
#'   \item{LCC_CODE}{Land cover code}
#'   \item{LCC_NAME}{Land cover name}
#'   ...
#' }
#' @source \url{https://open.canada.ca/data/en/dataset/4e615eae-b90c-420b-adee-2ca35896caf6}
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
#' @source Hexagons generated in R, landcover extracted from National Land Cover 2015 (\url{https://open.canada.ca/data/en/dataset/4e615eae-b90c-420b-adee-2ca35896caf6}).
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
#' @source BASSr analysis for N. Ontario
"StudyArea_hexes"

#' Dummy hex data to be cleaned
#' @format A spatial data frame with 33 features and 9 fields
#' \describe{
#'   \item{hex_id}{ID of the hex}
#'   \item{province}{Province code for that hex}
#'   \item{water}{Whether that hex is in water or not}
#'   \item{CLC...}{Land cover columns}
#'   \item{x}{Geometry}
#' }
#' @source Data generated in data-raw/data_create_study_area.R
"psu_hex_dirty"

#' Dummy hex data
#' @format A spatial data frame with 33 features and 9 fields
#' \describe{
#'   \item{hex_id}{ID of the hex}
#'   \item{province}{Province code for that hex}
#'   \item{water}{Whether that hex is in water or not}
#'   \item{LC...}{Land cover columns}
#'   \item{x}{Geometry}
#' }
#' @source Data generated in data-raw/data_create_study_area.R
"psu_hexagons"

#' Dummy costs data
#' @format A data frame with 33 rows and 27 columns
#' \describe{
#'   \item{hex_id}{ID of the hex}
#'   \item{province}{Province code for that hex}
#'   \item{water}{Whether that hex is in water or not}
#'   \item{area}{Area of the hex in m2}
#'   \item{pr-total_heli_cost}{Specific costs for each hex (see ?`estimate_cost_study_area`)}
#'   \item{narus}{Number of ARUs to be deployed}
#'   \item{RawCost}{Total raw cost of sampling this hex}
#' }
#' @source Data generated in data-raw/data_create_study_area.R
"psu_costs"

#' Dummy sampled hexes
#' @format A spatial data frame with 30 features and 21 fields
#' \describe{
#'   \item{siteID-caty}{Sampling output (see `spsurvey::grts()`)}
#'   \item{hex_id}{ID of the hex}
#'   \item{province}{Province code for that hex}
#'   \item{water}{Whether that hex is in water or not}
#'   \item{LC...}{Land cover columns}
#'   \item{x}{Geometry}
#'   \item{run}{Run number}
#'   \item{num_runs}{Total number of runs performed}
#'   \item{n_samples}{Total number of samples drawn in a run}
#' }
#' @source Data generated in data-raw/data_create_study_area.R
"psu_samples"

#' Dummy SSU points
#' @format A spatial data frame with 3003 features and 3 fields
#' \describe{
#'   \item{geometry}{Geometry}
#'   \item{hex_id}{ID of the hex}
#'   \item{ssuID}{ID of subsampling unit (hex)}
#'   \item{province}{Province code for that hex}
#' }
#' @source Data generated in data-raw/data_create_study_area.R
"ssu_points"

#' Dummy SSU land cover
#' @format A data frame with 3003 rows and 10 columns
#' \describe{
#'   \item{hex_id}{ID of the hex}
#'   \item{ssuID}{ID of subsampling unit (hex)}
#'   \item{HexArea}{Area of the SSU hex}
#'   \item{LC...}{Land cover columns}
#'   \item{province}{Province code for that hex}
#' }
#' @source Data generated in data-raw/data_create_study_area.R
"ssu_land_cover"
