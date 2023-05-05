### Functions associated with BASS - Benefit calculation
# David Hope
# Built from code by Nora Spencer
# 2019

#' Calculate the benefit of a hexagon from  grts results.
#'
#' @param samples (Spatial) Data frame. Results from `draw_random_samples()`.
#' @param non_random_set Set of hexagons to include as a non randomly selected
#'   set
#' @param land_cover_weights Data table with 'lc' and 'weights' column. Or could
#'   be NULL to have all equal.
#'
#' @return
#' @export
#'
#' @examples
#'
#' # Using example data psu_hexagons and psu_samples
#'
#' calculate_benefit(
#'   att_sf = psu_hexagons,
#'   samples = psu_samples,
#'   hex_id = hex_id,
#'   non_random_set = c("SA_0009", "SA_0022", "SA_0047", "SA_0052"))
#'
#' # Specify a non-random set
#'
#' calculate_benefit(
#'  att_sf = psu_hexagons,
#'  samples = psu_samples,
#'  hex_id = hex_id,
#'  non_random_set = c("SA_0009", "SA_0022", "SA_0047", "SA_0052"))
#'
#' # Without GRTS
#'
#' non_grts_samples <- draw_random_samples(
#'   att_sf = psu_hexagons,
#'   num_runs = 3,
#'   n_samples = 10,
#'   use_grts = FALSE)
#'
#' calculate_benefit(
#'  att_sf = psu_hexagons,
#'  samples = non_grts_samples,
#'  hex_id = hex_id)
#'
#'
#'
calculate_benefit <- function(att_sf, samples,
                              hex_id, stratum_id = NULL,
                              non_random_set = NULL,
                              land_cover_weights = NULL,
                              quiet = FALSE) {

  # ADD CHECKS
  att_sf <- check_att_sf(att_sf, quiet = quiet)

  # Prep data
  samples <- sf::st_drop_geometry(samples)

  att_long <- prepare_hab_long(att_sf, {{ stratum_id }})

  if (is.null(non_random_set)) {
    random_sample_summary_widenest <-
      samples %>%
      dplyr::group_by(.data$run) %>%
      dplyr::summarize(dplyr::across(dplyr::matches("LC\\d"), sum))
  }
  if (!is.null(non_random_set)) {

    # CHECKS

    if (is.vector(non_random_set)) {

      extra <- att_long %>%
        dplyr::mutate({{ hex_id }} := as.character({{ hex_id }})) %>%
        tidyr::pivot_wider(id_cols = {{ hex_id }},
                           names_from = "lc", values_from = "ha") %>%
        dplyr::filter({{ hex_id }} %in% .env$non_random_set) %>%
        tidyr::expand_grid(run = 1:dplyr::n_distinct(samples$run))

      random_sample_summary_widenest <-
        dplyr::bind_rows(samples, extra)

    } else if(is.data.frame(non_random_set)){

      random_sample_summary_widenest <- tidyr::expand_grid(
        non_random_set,
        run = 1:dplyr::n_distinct(samples$run))

      if(!is.null(samples)){
        random_sample_summary_widenest <-
          dplyr::bind_rows(
            samples,
            random_sample_summary_widenest)
      }

    }

    random_sample_summary_widenest <- random_sample_summary_widenest %>%
      dplyr::group_by(run) %>%
      dplyr::summarize_at(dplyr::vars(dplyr::matches("LC\\d")), sum) %>%
      dplyr::mutate(dplyr::across(dplyr::matches("LC\\d"),
                                  ~tidyr::replace_na(as.numeric(.x), 0)))
  }

  hexes <- att_long %>%
    dplyr::select({{ hex_id }}, "lc", "ha") %>%
    dplyr::mutate({{ hex_id }} := as.character({{ hex_id }})) %>%
    tidyr::pivot_wider(names_from = "lc", values_from = "ha")

  total <- att_long %>%
    dplyr::select("lc", "ha_total") %>%
    dplyr::distinct() %>%
    dplyr::rename("ha" = "ha_total")

  quick_ben(
    d = hexes,
    samples = random_sample_summary_widenest,
    land_cover_summary = total, land_cover_weights = land_cover_weights,
    hex_id = {{ hex_id }}, print = FALSE) %>%
    dplyr::left_join(dplyr::select(att_sf, {{ hex_id }}), .,
                      by = rlang::as_label(rlang::enquo(hex_id)))
}

#' Summarize land cover attributes by stratum
#'
#' Land cover attributes (columns starting with `LC`) are summarized by total
#' and proportion of area.
#'
#' @inheritParams common_docs
#'
#' @return Sumary of land cover types by area
#'
#' @noRd
calculate_land_cover_summary <- function(att_sf, stratum_id){
   att_sf %>%
    dplyr::group_by({{ stratum_id }}) %>%
    dplyr::summarize(dplyr::across(dplyr::matches("^LC\\d+$"), sum)) %>%
    tidyr::pivot_longer(cols = dplyr::matches("^LC\\d+$"),
                        names_to = "lc", values_to = "ha_total") %>%
    dplyr::mutate(total_phab = .data$ha_total / sum(.data$ha_total,
                                                    na.rm = TRUE)) %>%
    dplyr::ungroup() %>%
    sf::st_drop_geometry()
}


#' Summarize land cover attributes
#'
#' Land cover attributes (columns starting with `LC`) are summarized by total
#' and proportion of area.
#'
#' @inheritParams common_docs
#'
#' @return Long version with summarized area
#'
#' @noRd

prepare_hab_long <- function(att_sf, stratum_id = NULL) {
  # sa_a <- sum(att$area)

  att_sf <- sf::st_drop_geometry(att_sf)

  land_cover_summary <- calculate_land_cover_summary(att_sf, {{stratum_id}})

  by <- c("lc", rlang::as_label(rlang::enquo(stratum_id)))
  by <- by[by != "NULL"] # omit NULL turned to label

  tidyr::pivot_longer(
    att_sf,
    cols = dplyr::matches("^LC\\d+$"),
    names_to = "lc", values_to = "ha"
  ) %>%
    dplyr::left_join(land_cover_summary, by = by)

}

#' Subsample GRTS and calculate benefit
#'
#' @param n_samples Number of Samples
#' @param num_runs Number of iterations
#' @param grts_file grts file to run
#' @param att Att frame
#' @param quick run it using CPP quick calc
#'
#' @return
#' @export
subsample_grts_and_calc_benefit <- function(n_samples, num_runs, grts_file, att_sf,
                                            quick = T) {
  runs_to_pull <- sample(1:1000, num_runs)

  grts_res <- readr::read_rds(grts_file)[n_samples] %>%
    tidyr::pivot_longer(
      cols = dplyr::matches("LC\\d"),
      names_to = "lc",
      values_to = "ha"
    ) %>%
    dplyr::filter(.data$run %in% .env$runs_to_pull)

  calculate_benefit(grts_res = grts_res, att_sf = att_sf,
                    output = "all", quick = quick)
}




#' Quick Benefits
#'
#' @param d Hexagon data.frame - Needs to include Land Cover types in format
#'   LC_
#' @param samples Hypothetical sample set
#' @param land_cover_summary Land cover summary for larger area
#' @param print print details
#' @param land_cover_weights a data frame with lc specifying land cover and
#'   'weights' specifying weight.
#'
#' @inheritParams common_docs
#'
#' @return
#' @export
quick_ben <- function(d, samples, land_cover_summary, hex_id, print,
                      land_cover_weights = NULL) {

  d <- sf::st_drop_geometry(d)
  land_cover_summary <- sf::st_drop_geometry(land_cover_summary)

  hexes <- d  |>
    dplyr::as_tibble()  |>
    dplyr::select(dplyr::matches("LC\\d"))


  if (all(round(rowSums(hexes), 0) == 100) | all(round(rowSums(hexes), 0) == 1)) {
    rlang::warn(c("!" = "Values across LC columns sum to 100 or 1, ",
                  "i" =  "Check to be sure you have not input inputed percentages into your values.",
                  "x" = "Using percentages will not calculate accurate benefit values."), call = NULL)
  }
  hexNames <- dplyr::as_tibble(d) %>%
    dplyr::select({{ hex_id }}) |>
    dplyr::pull(1)

  if (nrow(land_cover_summary) > dplyr::n_distinct(land_cover_summary$lc)) {
    rlang::abort(
      paste0("Stratification of benefit calculation not yet supported. ",
             "Your land cover summary had too many rows."), call = NULL)
  }
  total <- land_cover_summary  |>
    dplyr::select(lc, ha)  |>
    tidyr::pivot_wider(names_from = lc, values_from = ha)

  total <- total[names(hexes)]

  if (all(round(rowSums(total), 0) == 100) | all(round(rowSums(total), 0) == 1)) {
    rlang::abort(
      paste0("I think you have inputed percentages into your total values. ",
             "This will not calculate accurate benefit values."), call = NULL)
  }

  samp <-  dplyr::select(samples, matches("LC\\d"))

  if (!all(names(hexes) %in% names(samp))) {
    nm <- names(hexes)[!names(hexes) %in% names(samp)]
    extraN <- dplyr::select(hexes, dplyr::all_of(.env$nm))  |>
      dplyr::mutate(across(.funs = ~ {.x * 0}))
    samp <- dplyr::bind_cols(samp, extraN)
  }
  samp <- samp[names(hexes)]

  if (is.null(land_cover_weights)) {
    w <- rep(1, length(names(hexes)))
  } else {
    if (!all(names(hexes) %in% land_cover_weights$lc)) {
      nm <- names(hexes)[!names(hexes) %in% names(land_cover_weights)]
      extraNw <- dplyr::select(hexes, dplyr::all_of(.env$nm))  |>
        tidry::pivot_longer(cols = dplyr::everything(),
                            values_to = "weights", names_to = "lc")  |>
        dplyr::mutate(weights = 1)
      land_cover_weights <- dplyr::bind_rows(land_cover_weights, extraNw)
    }
    w <- match(names(hexes), land_cover_weights$lc)
    w <- land_cover_weights$weights[w]
  }

  if (all(round(rowSums(samp), 0) == 100) | all(round(rowSums(samp), 0) == 1)) {

    rlang::warn(c("!" = "Values across LC columns in samples sum to 100 or 1, ",
                 "i" =  "Check samples to be sure you have not input inputed percentages into your values.",
                 "x" = "Using percentages will not calculate accurate benefit values."), call = NULL)
  }

  if (all(names(hexes) != names(total))) {
    print(names(hexes))
    print(names(total))
    rlang::abort("Hexes and total are not organized correctly", call = NULL)
  }
  if (all(names(hexes) != names(samp))) {
    print(names(hexes))
    print(names(samp))
    rlang::abort("Hexes and samples are not organized correctly", call = NULL)
  }
  if (all(names(samp) != names(total))) {
    print(names(samp))
    print(names(total))
    rlang::abort("Samples and total are not organized correctly", call = NULL)
  }

  h <- as.matrix(hexes)
  s <- as.matrix(samp)
  tot <- total[1, ] %>%
    t() %>%
    as.vector()

  dplyr::tibble({{ hex_id }} := hexNames,
                benefit = allhexes(h, s, tot, w, printDets = print))
}
