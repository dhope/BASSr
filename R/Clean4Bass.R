#' Clean land cover habitat data
#'
#' This is a general function to clean land cover columns.
#'
#' @param pattern Character. Pattern to match and replace with 'LC'
#' @param append Character. Text to append to end of land cover code
#'
#' @inheritParams common_docs
#'
#' @return
#' @export
#'
#' @examples
#'
#' psu_hex_clean <- clean_land_cover(psu_hex_dirty, pattern = "CLC0013_")
#'
#'
clean_land_cover <- function(att_sf, pattern = "CLC15_", append = "",
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

  dplyr::rename_with(
    att_sf,
    .fn = lc_rename, pattern = pattern, append = append,
    .cols = dplyr::matches(pattern)
    )
}

lc_rename <- function(nms, pattern, append = "") {
  nms %>%
    stringr::str_remove(pattern) %>%
    stringr::str_pad(width = 2, pad = 0) %>%
    stringr::str_c("LC", ., append)
}




