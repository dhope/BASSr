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
calculate_benefit <- function(grts_res, HexID,  att_long, output = "all", quick = F,non_random_set = NULL) {
  if (!output %in% c("all", "full", "by_run", "mean_benefit")) {
    simpleError("output must be one of 'all'(default), 'full','by_run', or 'mean_benefit'")
  }
  pd <- F#ifelse(output == 'all',  T, F)
  if(is_null(non_random_set)){
  grts_random_sample_summary_widenest <-
    grts_res$grts_random_sample %>%
    group_by(run) %>%
    summarize_at(vars(matches("LC\\d")), sum )
  }
  if(!is_null(non_random_set)){

    grts_random_sample_summary_widenest <-
      grts_res$grts_random_sample %>%
      group_by(run) %>%
      bind_rows(
        expand_grid(filter(att_long %>% mutate(SampleUnitID = as.character(SampleUnitID)) %>%
                             pivot_wider(id_cols = SampleUnitID, names_from = lc, values_from = ha)
                           , {{ HexID }} %in% non_random_set), run = 1:n_distinct(grts_res$grts_random_sample$run))
      ) %>%
      summarize_at(vars(matches("LC\\d")), sum )
    # browser()
  }

  hexes <- att_long %>%
    dplyr::select({{HexID}},lc, ha) %>%
    mutate({{HexID}} := as.character({{HexID}})) %>%
    pivot_wider(names_from = lc, values_from = ha)
  # print(hexes)
  total <- att_long %>%
    dplyr::select(lc, ha_total) %>% distinct %>% rename(ha = ha_total)
  if(isTRUE(quick)){

  return(quick_ben(d = hexes,
                   samples  = grts_random_sample_summary_widenest,
                   land_cover_summary = total,
                   col_ =  {{HexID}}, pd ))


  }

  benefit_by_run <- map_df(1:n_distinct(grts_random_sample_summary_widenest$run),
                           ~quick_ben(d = hexes,
                                      samples = grts_random_sample_summary_widenest %>%
                                        filter(run == .x),
                                      land_cover_summary = total,
                                      col_ = {{HexID}}, pd=pd) %>% mutate(run = .x) )


  if (output == "all") {
    return(list(
       hexagon_benefits_by_run = benefit_by_run,
       grts_random_sample_summary_widenest=grts_random_sample_summary_widenest,
       hexes = hexes, total = total))
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
prepare_hab_long <- function(att, lg_area = StudyAreaID) {
  # sa_a <- sum(att$area)
  land_cover_summary <- att %>%
    group_by({{ lg_area }}) %>%
    summarize_at(vars(matches("^LC\\d+$")), sum) %>%
    pivot_longer(cols =matches("^LC\\d+$"), names_to = "lc", values_to = "ha") %>%
    mutate(total_phab = ha / sum(ha, na.rm = T)) %>% ungroup


  att_cleaned_long <- pivot_longer(att,
    cols = matches("^LC\\d+$"),
    names_to = "lc", values_to = "ha"
  ) %>%
    left_join(land_cover_summary %>%
      rename(ha_total = ha), by = c("lc", as_label(enquo(lg_area))))

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
#' @param d Hexagon data.frame
#' @param samples
#' @param land_cover_summary
#' @param col_
#' @param pd print details
#'
#' @return
#' @export
quick_ben <- function(d,samples, land_cover_summary, col_, pd ){

  # col <- rlang::enquo(col_)
  hexes <- d %>%
    as_tibble() %>%
    dplyr::select_at(vars( matches("LC\\d")))

  if(all(round(rowSums(hexes),0)==100)| all(round(rowSums(hexes),0)==1)){
    stop("I think you have inputed percentages into your hexagons.
                This will not calculate accurate benefit values.")
  }
  hexNames <-  #as.character(d[[col_]])
    dplyr::select(as_tibble(d), {{col_}} ) %>% .[[1]]
  # print(names(d))
  # samples <- grts_random_sample_summary_widenest
  total <- land_cover_summary %>% dplyr::select(lc, ha) %>%
    pivot_wider(names_from = lc, values_from = ha)
  total <- total[names(hexes)]
  if(all(round(rowSums(total),0)==100)| all(round(rowSums(total),0)==1)){
    stop("I think you have inputed percentages into your total values.
                This will not calculate accurate benefit values.")
  }
  samp <- samples %>% dplyr::select_at(vars( matches("LC\\d")))
  samp <- samp[names(hexes)]

  if(all(round(rowSums(samp),0)==100)| all(round(rowSums(samp),0)==1)){
    stop("I think you have inputed percentages into your sample values.
                This will not calculate accurate benefit values.")
  }

  if(all(names(hexes) != names(total))) {print(names(hexes))
    print(names(total))
    stop("Hexes and total are not organized correctly")}
  if(all(names(hexes) != names(samp))) {print(names(hexes))
    print(names(samp))
    stop("Hexes and samples are not organized correctly")}
  if(all(names(samp) != names(total))) {print(names(samp))
    print(names(total))
    stop("Samples and total are not organized correctly")}

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


