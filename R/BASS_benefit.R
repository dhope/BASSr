### Functions associated with BASS - Benefit calculation
# David Hope
# Built from code by Nora Spencer
# 2019

#' Calculate the benefit of a hexagon from  grts results.
#'
#' @param grts_res Results from GRTS random sample set.
#' @param att_long Attribute table
#' @param HexID column for hexagons
#' @param att_long Data frame with habitat information, in long format
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
#' # Using example data psu_land_cover and psu_samples
#' hab <- prepare_hab_long(psu_land_cover, lg_area = province)
#'
#' calculate_benefit(
#'   grts_res = psu_samples,
#'   att_long = hab,
#'   HexID = hex_id,
#'   non_random_set = c("SA_0009", "SA_0022", "SA_0047", "SA_0052"))
#'
#' # Specify a non-random set
#'
#' calculate_benefit(
#'  grts_res = psu_samples,
#'  att_long = hab,
#'  HexID = hex_id,
#'  non_random_set = c("SA_0009", "SA_0022", "SA_0047", "SA_0052"))
#'
#'
#'
calculate_benefit <- function(grts_res, HexID, att_long,
                              non_random_set = NULL,
                              land_cover_weights = NULL) {

  # ADD CHECKS

  if("sf" %in% class(grts_res$random_sample)){
    grts_res$random_sample <- sf::st_drop_geometry(grts_res$random_sample)
  }

  if (is.null(non_random_set)) {
    random_sample_summary_widenest <-
      grts_res$random_sample %>%
      dplyr::group_by(.data$run) %>%
      dplyr::summarize(dplyr::across(dplyr::matches("LC\\d"), sum))
  }
  if (!is.null(non_random_set)) {

    # CHECKS

    if (is.vector(non_random_set)) {

      extra <- att_long %>%
        dplyr::mutate({{ HexID }} := as.character({{ HexID }})) %>%
        tidyr::pivot_wider(id_cols = {{ HexID }},
                           names_from = "lc", values_from = "ha") %>%
        dplyr::filter({{ HexID }} %in% .env$non_random_set) %>%
        tidyr::expand_grid(run = 1:dplyr::n_distinct(grts_res$random_sample$run))

      random_sample_summary_widenest <-
        dplyr::bind_rows(grts_res$random_sample, extra)

    } else if(is.data.frame(non_random_set)){

      random_sample_summary_widenest <- tidyr::expand_grid(
        non_random_set,
        run = 1:dplyr::n_distinct(grts_res$random_sample$run))

      if(!is.null(grts_res)){
        random_sample_summary_widenest <-
          dplyr::bind_rows(
            grts_res$random_sample,
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
    dplyr::select({{ HexID }}, "lc", "ha") %>%
    dplyr::mutate({{ HexID }} := as.character({{ HexID }})) %>%
    tidyr::pivot_wider(names_from = "lc", values_from = "ha")

  total <- att_long %>%
    dplyr::select("lc", "ha_total") %>%
    dplyr::distinct() %>%
    dplyr::rename("ha" = "ha_total")

  quick_ben(
    d = hexes,
    samples = random_sample_summary_widenest,
    land_cover_summary = total, land_cover_weights = land_cover_weights,
    col_ = {{ HexID }}, print = FALSE)

}





#' Summarize land cover in attribute and add it to a longer table
#'
#' @param att attribute table
#' @param lg_area Column for larger area. Either study area or region
#'
#' @return
#' @export
#'
prepare_hab_long <- function(att, lg_area = StudyAreaID) {
  # sa_a <- sum(att$area)
  land_cover_summary <- att %>%
    dplyr::group_by({{ lg_area }}) %>%
    dplyr::summarize(dplyr::across(dplyr::matches("^LC\\d+$"), sum)) %>%
    tidyr::pivot_longer(cols = dplyr::matches("^LC\\d+$"),
                        names_to = "lc", values_to = "ha") %>%
    dplyr::mutate(total_phab = .data$ha / sum(.data$ha, na.rm = T)) %>%
    dplyr::ungroup()


  att_cleaned_long <- tidyr::pivot_longer(
    att,
    cols = dplyr::matches("^LC\\d+$"),
    names_to = "lc", values_to = "ha"
  ) %>%
    dplyr::left_join(
      dplyr::rename(land_cover_summary, "ha_total" = "ha"),
      by = c("lc", rlang::as_label(rlang::enquo(lg_area))))

  att_cleaned_long
}



#' Subsample GRTS and calculate benefit
#'
#' @param nsamples Number of Samples
#' @param num_runs Number of iterations
#' @param grts_file grts file to run
#' @param att Att frame
#' @param quick run it using CPP quick calc
#'
#' @return
#' @export
subsample_grts_and_calc_benefit <- function(nsamples, num_runs, grts_file, att,
                                            quick = T) {
  runs_to_pull <- sample(1:1000, num_runs)

  grts_res <- readr::read_rds(grts_file)[nsamples]$random_sample_long %>%
    dplyr::filter(.data$run %in% .env$runs_to_pull)

  grts_res <- list(random_sample_long = grts_res)

  calculate_benefit(grts_res = grts_res, att_long = att,
                    output = "all", quick = quick)
}




#' Quick Benefits
#'
#' @param d Hexagon data.frame - Needs to include Land Cover types in format
#'   LC_
#' @param samples Hypothetical sample set
#' @param land_cover_summary Land cover summary for larger area
#' @param col_ ID column
#' @param print print details
#' @param land_cover_weights a data frame with lc specifying land cover and
#'   'weights' specifying weight.
#'
#' @return
#' @export
quick_ben <- function(d, samples, land_cover_summary, col_, print,
                      land_cover_weights = NULL) {

  # col <- rlang::enquo(col_)
  hexes <- d  |>
    dplyr::as_tibble()  |>
    dplyr::select(dplyr::matches("LC\\d"))


  if (all(round(rowSums(hexes), 0) == 100) | all(round(rowSums(hexes), 0) == 1)) {
    stop("I think you have inputed percentages into your hexagons.
                This will not calculate accurate benefit values.")
  }
  hexNames <- # as.character(d[[col_]])
    dplyr::select(dplyr::as_tibble(d), {{ col_ }}) |>
    dplyr::pull(1)
  # print(names(d))
  # samples <- grts_random_sample_summary_widenest
  # browser()

  if (nrow(land_cover_summary) > dplyr::n_distinct(land_cover_summary$lc)) {
    stop("Stratification of benefit calculation not yet supported. ",
         "Your land cover summary had too many rows.")
  }
  total <- land_cover_summary  |>
    dplyr::select(lc, ha)  |>
    tidyr::pivot_wider(names_from = lc, values_from = ha)

  total <- total[names(hexes)]

  if (all(round(rowSums(total), 0) == 100) | all(round(rowSums(total), 0) == 1)) {
    stop("I think you have inputed percentages into your total values.
                This will not calculate accurate benefit values.")
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
    stop("I think you have inputed percentages into your sample values.
                This will not calculate accurate benefit values.")
  }

  if (all(names(hexes) != names(total))) {
    print(names(hexes))
    print(names(total))
    stop("Hexes and total are not organized correctly")
  }
  if (all(names(hexes) != names(samp))) {
    print(names(hexes))
    print(names(samp))
    stop("Hexes and samples are not organized correctly")
  }
  if (all(names(samp) != names(total))) {
    print(names(samp))
    print(names(total))
    stop("Samples and total are not organized correctly")
  }

  h <- as.matrix(hexes)
  s <- as.matrix(samp)
  tot <- total[1, ] %>%
    t() %>%
    as.vector()

  dplyr::tibble({{ col_ }} := hexNames,
                benefit = allhexes(h, s, tot, w, printDets = print))
}
