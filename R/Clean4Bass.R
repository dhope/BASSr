#' Clean land cover habitat data
#'
#' This is a general function to clean land cover columns.
#'
#' @param land_raw (Spatial) data frame. Land Cover data to be cleaned.
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
clean_land_cover <- function(land_raw, pattern = "CLC15_", append = "",
                             quiet = FALSE) {

  # Checks
  if(!inherits(land_raw, "data.frame")) {
    rlang::abort(
      "`land_raw` must be a (spatial) data frame containing land cover data to be cleaned",
      call = NULL)
  }

  pattern <- glue::glue("^{pattern}")
  cols <- stringr::str_subset(names(land_raw), pattern)

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
    land_raw,
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




