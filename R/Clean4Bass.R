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
clean_forBass <- function(df, s, id_col = StudyAreaID, f_vec = NULL, appended = "") {

  match <- glue::glue("^{s}")

  # Subset
  if(!is.null(f_vec)) df <- dplyr::filter(df, {{ id_col }} %in% .env$f_vec)

  # Rename land cover columns
  df %>%
    dplyr::rename_with(
      .fn = ~ glue::glue('LC{stringr::str_pad(gsub(match, "", .), width = 2, pad = 0)}{appended}'),
      .cols = dplyr::matches(match)
    )
}
