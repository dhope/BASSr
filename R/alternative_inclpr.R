
#' Calculate Propbability Proportional to Size (PPS) inclusion probabilities
#'
#' See for more information:
#' https://www150.statcan.gc.ca/n1/en/pub/12-001-x/2011001/article/11450-eng.pdf?st=0oyBln55
#' or
#' https://en.wikipedia.org/wiki/Probability-proportional-to-size_sampling
#'
#'
#' @inheritParams common_docs
#'
#' @return
#'
#' @examples
#'
#' calculate_PPS_hab_inlc_pr(
#'   land_hex = psu_hexagons,
#'   hex_id = hex_id)
calculate_PPS_hab_inlc_pr <- function(land_hex,
                              hex_id, stratum_id = NULL,
                              quiet = FALSE) {

  # ADD CHECKS
  land_hex <- check_land_hex(land_hex, quiet = quiet)

  # Prep data

  att_long <- prepare_hab_long(land_hex, {{ stratum_id }})

  by <- c("lc", rlang::as_label(rlang::enquo(stratum_id)))
  by <- by[by != "NULL"] # omit NULL turned to label

  att_summary <- calculate_land_cover_summary(land_hex, {{stratum_id }}) |>
    dplyr::group_by( across(by)) |>
    dplyr::mutate(p_hab_PPS = 1/(n()*sum(area_total)) ) |>
    dplyr::ungroup()


  dplyr::left_join(att_long, att_summary,
            by = by) |>
    dplyr::mutate(psel_hex_hab_PPS = p_hab_PPS * area) |>
    dplyr::summarize(p_sel_PPS_hab = units::set_units(sum(psel_hex_hab_PPS), NULL),
              .by = c({{stratum_id}},{{hex_id}})) |>
    dplyr::left_join(x = land_hex, by  = dplyr::join_by({{hex_id}}))


}


#' Calculate z-scores for each hexagon by sum of individual z scores
#'
#' @inheritParams common_docs
#'
#' @return data frame
#'
#' @examples
calculate_z_scores <-  function(land_hex,
                                hex_id, stratum_id = NULL,
                                quiet = FALSE) {

  # ADD CHECKS
  land_hex <- check_land_hex(land_hex, quiet = quiet)

  by <- c("lc", rlang::as_label(rlang::enquo(stratum_id)))
  by <- by[by != "NULL"] # omit NULL turned to label


  # Prep data

  att_long <- prepare_hab_long(land_hex, {{ stratum_id }}) |>
    mutate(area = units::set_units(area, NULL))

  # calculate mean and sd of eac land cover class
  att_sum <- att_long |>
    summarize(mean = mean(area),
              sd = sd(area),
              .by = by)


  att_long |>
    dplyr::select(-area_total, -total_phab) |>
    dplyr::left_join(att_sum, by = by) |>
    dplyr::mutate(z_score =(area-mean)/sd) |>
    dplyr::summarise(avg_z_score = mean(z_score, na.rm = T),
                     .by = {{hex_id}})




}
