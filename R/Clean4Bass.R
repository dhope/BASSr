#' Clean habitat data for BASS
#'
#' This is a general function to clean land cover data for BASS functions
#'
#' @param df Habitat data frame
#' @param s String to search and replace with 'LC'
#' @param id_col Column name to use for filtering from f_vec
#' @param f_vec Vector of id to include
#' @param appended String to append to end of LandCover Code
#'
#' @return
#' @export
#'
#' @examples
clean_forBass <- function(df, s, id_col = StudyAreaID, f_vec = brandtStudyAreas_list, appended = ""){
  df %>%
    rename_at(.vars= vars(contains(glue::glue("{s}_"))),
              .funs = ~glue::glue('LC{stringr::str_pad(gsub(glue::glue("{s}_"), "", .), width = 2, pad = 0)}{appended}'
              ))  %>% filter({{ id_col }} %in%f_vec) %>% mutate(Province = "ON")
}
