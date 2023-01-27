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
#'
#' psu_hex_clean <- clean_forBass(psu_hex_dirty, pattern = "CLC0013_")
#'
#'
clean_forBass <- function(att_sf, pattern = "CLC15_", append = "",
                          quiet = FALSE) {

  pattern <- glue::glue("^{pattern}")
  cols <- stringr::str_subset(names(att_sf), pattern)

  check_lc_names(cols, pattern)

  # Rename land cover columns
  if(!quiet) {
    rlang::inform(
      c("i" = "Renaming land cover columns",
        "*" = paste0("From: ", stringr::str_c(cols, collapse = ", ")),
        "*" = paste0("To: ", stringr::str_c(lc_rename(cols, pattern, append),
                                            collapse = ", "))
      ))
  }

  att_sf <- dplyr::rename_with(
    att_sf,
    .fn = lc_rename, pattern = pattern, append = append,
    .cols = dplyr::matches(pattern)
    )

  # Check POINT vs. POLYGON
  if(!quiet) {
    rlang::inform(c(
      "i" = "Spatial Feature object should be POINTs not POLYGONs",
      "*" = "Don't worry, I'll fix it!",
      "*" = "Assuming constant attributes and using centroids as points"))
    att_sf <- att_sf %>%
      sf::st_set_agr("constant") %>%
      sf::st_centroid(att_sf)
  }

  att_sf
}

lc_rename <- function(nms, pattern, append = "") {
  nms %>%
    stringr::str_remove(pattern) %>%
    stringr::str_pad(width = 2, pad = 0) %>%
    stringr::str_c("LC", ., append)
}




