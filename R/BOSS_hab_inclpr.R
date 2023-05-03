
#' Calculate habitat probabilities
#'
#' Based on Van Wilgenburg et al. 2020
#' https://doi.org/10.1371/journal.pone.0234494
#'
#' @param att_sf
#' @param hex_id
#' @param stratum_id
#'
#' @return
#'
#' @examples
#'
#' calculate_BOSS_hab_inlc_pr(
#'   att_sf = psu_hexagons,
#'   hex_id = hex_id)
calculate_BOSS_hab_inlc_pr <- function(att_sf,
                              hex_id, stratum_id = NULL,
                              quiet = FALSE) {

  # ADD CHECKS
  att_sf <- check_att_sf(att_sf, quiet = quiet)

  # Prep data

  att_long <- prepare_hab_long(att_sf, {{ stratum_id }})

  by <- c("lc", rlang::as_label(rlang::enquo(stratum_id)))
  by <- by[by != "NULL"] # omit NULL turned to label

  att_summary <- calculate_land_cover_summary(att_sf, {{stratum_id }}) |>
    dplyr::group_by( across(by)) |>
    dplyr::mutate(p_hab_BOSS = 1/(n()*sum(ha_total)) ) |>
    dplyr::ungroup()


  dplyr::left_join(att_long, att_summary,
            by = by) |>
    dplyr::mutate(psel_hex_hab_BOSS = p_hab_BOSS * ha) |>
    dplyr::summarize(p_sel_BOSS_hab = units::drop_units(sum(psel_hex_hab_BOSS)),
              .by = c({{stratum_id}},{{hex_id}})) |>
    dplyr::left_join(x = att_sf, by  = dplyr::join_by({{hex_id}}))


}


#' Calculate z-scores for each hexagon by sum of individual z scores
#'
#' @param att_sf
#' @param hex_id
#' @param stratum_id
#' @param quiet
#'
#' @return
#' @export
#'
#' @examples
calculate_z_scores <-  function(att_sf,
                                hex_id, stratum_id = NULL,
                                quiet = FALSE) {

  # ADD CHECKS
  att_sf <- check_att_sf(att_sf, quiet = quiet)

  by <- c("lc", rlang::as_label(rlang::enquo(stratum_id)))
  by <- by[by != "NULL"] # omit NULL turned to label


  # Prep data

  att_long <- prepare_hab_long(att_sf, {{ stratum_id }})

  # calculate mean and sd of eac land cover class
  att_sum <- att_long |>
    summarize(mean = mean(ha),
              sd = sd(ha),
              .by = by)


  att_long |>
    dplyr::select(-ha_total, -total_phab) |>
    dplyr::left_join(att_sum, by = by) |>
    dplyr::mutate(z_score = units::drop_units(ha-mean)/sd) |>
    dplyr::summarise(avg_z_score = mean(z_score, na.rm = T),
                     .by = {{hex_id}})




}
