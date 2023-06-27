
#' Calculate habitat probabilities
#'
#' Based on Van Wilgenburg et al. 2020
#' https://doi.org/10.1371/journal.pone.0234494
#'
#' @param land_hex
#' @param hex_id
#' @param stratum_id
#'
#' @return
#'
#' @examples
#'
#' calculate_BOSS_hab_inlc_pr(
#'   land_hex = psu_hexagons,
#'   hex_id = hex_id)
calculate_BOSS_hab_inlc_pr <- function(land_hex,
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
    dplyr::mutate(p_hab_BOSS = 1/(n()*sum(area_total)) ) |>
    dplyr::ungroup()


  dplyr::left_join(att_long, att_summary,
            by = by) |>
    dplyr::mutate(psel_hex_hab_BOSS = p_hab_BOSS * area) |>
    dplyr::summarize(p_sel_BOSS_hab = units::set_units(sum(psel_hex_hab_BOSS), NULL),
              .by = c({{stratum_id}},{{hex_id}})) |>
    dplyr::left_join(x = land_hex, by  = dplyr::join_by({{hex_id}}))


}


#' Calculate z-scores for each hexagon by sum of individual z scores
#'
#' @param land_hex
#' @param hex_id
#' @param stratum_id
#' @param quiet
#'
#' @return
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
