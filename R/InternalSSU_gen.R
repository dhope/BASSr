#' genSSU. Generate ssu layer aligned with hexagon PSU
#'
#' @param h Hexagon - sf polygon
#' @param spacing distance between points
#' @param HexID_column Name of column to identify individual PSU
#'
#' @return SSU points as an sf object
#' @export
#'
genSSU <- function(h, spacing, HexID_column){
  if(attr(h, "sf_column")=="x") sf::st_geometry(h) = "geometry"

  ch <- tibble::as_tibble(sf::st_coordinates(h))
  top_point <- ch[which.max(ch$Y),]
  bottom_point <- ch[which.min(ch$Y),]
  gridsize <- 2*floor(abs(top_point$Y-bottom_point$Y)/spacing)+3
  rowAngle <- tanh((top_point$X-bottom_point$X)/(top_point$Y-bottom_point$Y))

  suppressWarnings({cent <- sf::st_centroid(h) %>%
    dplyr::bind_cols(tibble::as_tibble(sf::st_coordinates(.))) %>%
    sf::st_drop_geometry() %>%
    dplyr::select({{HexID_column}}, X, Y)})


  genRow <- function(cX, cY, sp,...){
    tibble::tibble(rowid = seq(-gridsize,gridsize)) %>%
      dplyr::mutate(X = sin(60*pi/180+rowAngle) *sp*rowid + {{cX}},
             Y = cos(60*pi/180+rowAngle) *sp*rowid  + {{cY}})
  }

  centroids <- tibble::tibble(crowid=seq(-gridsize,gridsize)) %>%
    dplyr::mutate(cY = cos(rowAngle) *spacing*crowid + cent$Y,
           #spacing/2*crowid + cent$Y,
           cX =  sin(rowAngle) *spacing*crowid + cent$X) %>%
    #cent$X + crowid* sqrt(spacing**2-(spacing/2)**2)) %>%
    dplyr::rowwise() %>%
    dplyr::mutate(row = list(genRow(cX = cX,cY = cY,sp = spacing))) %>%
    tidyr::unnest(row) %>%
    dplyr::select(X,Y) %>%
    sf::st_as_sf(coords = c("X", "Y"), crs = sf::st_crs(h)) %>%
    sf::st_filter(h) %>%
    dplyr::mutate({{HexID_column}} := dplyr::pull(h,{{HexID_column}}),
           ssuID = dplyr::row_number())
  return(centroids)
}
