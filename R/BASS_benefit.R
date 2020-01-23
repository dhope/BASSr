### Functions associated with BASS - Benefit calculation
# David Hope
# Built from code by Nora Spencer
# 2019

#' Title
#'
#' @param grts_res
#' @param att_long
#' @param output  Must be one of 'all'(default), 'full','by_run', or 'mean_benefit'
#' @param HexID column for hexagons
#' @param att_long Data frame with habitat information, in long format
#' @param output if not using quick. Output format
#' @param quick should you run it fast?
#'
#' @return
#' @export
#'
#' @examples
calculate_benefit <- function(grts_res, HexID, att_long, output = "all", quick = F) {
  if (!output %in% c("all", "full", "by_run", "mean_benefit")) {
    simpleError("output must be one of 'all'(default), 'full','by_run', or 'mean_benefit'")
  }

  if(isTRUE(quick)){
    pd <- F#ifelse(output == 'all',  T, F)
  grts_random_sample_summary_widenest <-
    grts_res$grts_random_sample %>%
    group_by(run) %>%
    summarize_at(vars(matches("LC\\d")), sum )

  hexes <- att_long %>%
    dplyr::select({{HexID}},lc, ha) %>%
    mutate({{HexID}} := as.character({{HexID}})) %>%
    pivot_wider(names_from = lc, values_from = ha)

  total <- att_long %>%
    dplyr::select(lc, ha_total) %>% distinct %>% rename(ha = ha_total)

  return(quick_ben(d = hexes,samples  = grts_random_sample_summary_widenest, land_cover_summary = total,
                   col_ =  {{HexID}}, pd ))


  }

  grts_random_sample_summary <-
    grts_res$grts_random_sample_long %>%
    group_by(run, lc) %>%
    summarize(ha_random = sum(ha)) %>%
    group_by(run) %>%
    mutate(phab_random = ha_random / sum(ha_random)) %>%
    ungroup()

  nested_random_samples <-
    grts_res$grts_random_sample %>%
    mutate(cat = "cat") %>%
    group_by(cat, run) %>%
    nest() %>%
    ungroup()


  hexagon_adjustment_df <-
    att_long %>%
    mutate(cat = "cat") %>%
    as_tibble() %>%
    left_join(
      nested_random_samples,
      by = "cat"
    ) %>%
    dplyr::select(-cat) %>%
    mutate(ha_adjust = pmap(., function(data, lc, ha, ...) sumH(data[[lc]], ha))) %>%
    left_join(grts_random_sample_summary, by = c("run", "lc")) %>%
    dplyr::select(-data) %>%
    unnest(cols = ha_adjust)


  full <-
    hexagon_adjustment_df %>%
    group_by(run) %>%
    mutate(random_total_hab = sum(ha_adjust)) %>%
    ungroup() %>%
    # group_by({{HexID}},run, lc, phab_random, total_phab) %>%
    mutate(
      phab_ran_plus1 = ha_adjust / random_total_hab,
      desired_direction = case_when(
        phab_random > total_phab ~ "neg",
        phab_random < total_phab ~ "pos",
        phab_random == total_phab ~ "none",
        TRUE ~ ""
      ),
      observed_direct = case_when(
        phab_ran_plus1 > total_phab ~ "neg",
        phab_ran_plus1 < total_phab ~ "pos",
        phab_ran_plus1 == total_phab ~ "none",
        TRUE ~ ""
      ),
      change = phab_ran_plus1 - phab_random,
      ben_yes_no = case_when(
        ((change < 0 & desired_direction == "neg") | (change > 0 & desired_direction == "pos")) ~ 1,
        ((change < 0 & desired_direction == "pos") | (change > 0 & desired_direction == "neg")) ~ 0,
        (change == 0 & desired_direction == "none") ~ 0,
        (change == 0 & desired_direction != "none") ~ 0,
        (desired_direction == "none" & change != 0) ~ 0,
        TRUE ~ -999999
      ),
      benefit = as.numeric(as.character(ben_yes_no)) * abs(change)
    ) %>%
    group_by(run, lc, phab_random, total_phab) %>%
    mutate(sum_hex = sum(phab_ran_plus1),
           n = n()) %>%
    ungroup()


  by_run <- full %>%
    group_by(run) %>%
    group_by({{HexID}}, add =T) %>%
    summarize(ben_by_run = sum(benefit, na.rm = T))


  mean_benefit <- by_run %>%
    group_by({{HexID}}) %>%
    summarise(benefit = mean(ben_by_run, na.rm = T)) %>%
    filter(!is.na(benefit))


  if (output == "all") {
    return(list(
      hexagon_benefits_by_run_andLC = full, hexagon_benefits_by_run = by_run,
      hexagon_benefits = mean_benefit
    ))
  }

  return(get(output))
}





#' Summarize land cover in attribute and add it to a longer table
#'
#' @param att attribute table
#'
#' @return
#' @export
#'
#' @examples
prepare_hab_long <- function(att) {
  land_cover_summary <- att %>%
    summarize_at(vars(matches("LC\\d")), sum) %>%
    pivot_longer(cols = everything(), names_to = "lc", values_to = "ha") %>%
    mutate(total_phab = ha / sum(ha, na.rm = T))


  att_cleaned_long <- pivot_longer(att,
    cols = matches("LC\\d"),
    names_to = "lc", values_to = "ha"
  ) %>%
    left_join(land_cover_summary %>%
      rename(ha_total = ha), by = "lc")

  att_cleaned_long
}



#' Subsample GRTS and calculate benefit
#'
#' @param nsamples Number of Samples
#' @param num_runs Number of iterations
#' @param grts_file grts file to run
#' @param att Att frame
#' @param q run it using CPP quick calc
#'
#' @return
#' @export
subsample_grts_and_calc_benefit <- function(nsamples, num_runs, grts_file, att, q = T){
  runs_to_pull <- sample(1:1000,num_runs )
  grts_ <- read_rds(grts_file)[nsamples]$grts_random_sample_long  %>%
    filter(run %in% runs_to_pull)

  grts_res <- list(grts_random_sample_long = grts_)
  rm(grts_)
  calculate_benefit(grts_res = grts_res, att_long = att, output = "all", quick = q)

}




#' Quick Benefits
#'
#' @param d
#' @param samples
#' @param land_cover_summary
#' @param col_
#' @param pd print details
#'
#' @return
#' @export
quick_ben <- function(d,samples, land_cover_summary, col_, pd ){
  # col <- rlang::enquo(col_)
  hexes <- d %>% dplyr::select_at(vars( matches("LC\\d")))

  hexNames <-  #as.character(d[[col_]])
    dplyr::select(as_tibble(d), {{col_}} ) %>% .[[1]]
  # print(names(d))
  # samples <- grts_random_sample_summary_widenest
  total <- land_cover_summary %>% dplyr::select(lc, ha) %>%
    pivot_wider(names_from = lc, values_from = ha)
  total <- total[names(hexes)]

  samp <- samples %>% dplyr::select_at(vars( matches("LC\\d")))
  samp <- samp[names(hexes)]

  if(all(names(hexes) != names(total))) {print(names(hexes))
    print(names(total))
    simpleError("Hexes and total are not organized correctly")}
  if(all(names(hexes) != names(samp))) {print(names(hexes))
    print(names(samp))
    simpleError("Hexes and samples are not organized correctly")}
  if(all(names(samp) != names(total))) {print(names(samp))
    print(names(total))
    simpleError("Samples and total are not organized correctly")}

  h <- as.matrix(hexes)
  s <- samp %>% as.matrix
  tot <- total[1,] %>% t %>% as.vector

  # print(h)
  # print(s)
  # print(tot)

  # print(hexes)
  # print(samp)
  # print(total)

  return(tibble({{col_}} := hexNames, benefit = allhexes(h,s,tot, printDets = pd)))



}


