#' genSSU. Generate ssu layer aligned with hexagon PSU
#'
#' @param h Hexagon - sf polygon
#' @param spacing distance between points
#'
#' @return SSU points as an sf object
#' @export
#'
genSSU <- function(h, spacing){
  ch <- as_tibble(st_coordinates(h))
  top_point <- ch[which.max(ch$Y),]
  bottom_point <- ch[which.min(ch$Y),]
  gridsize <- 2*floor(abs(top_point$Y-bottom_point$Y)/spacing)+3
  rowAngle <- tanh((top_point$X-bottom_point$X)/(top_point$Y-bottom_point$Y))


  cent <- st_centroid(h) %>%
    bind_cols(as_tibble(st_coordinates(.))) %>%
    st_drop_geometry %>%
    dplyr::select(ET_Index, X, Y)


  genRow <- function(cX, cY, sp,...){
    tibble(rowid = seq(-gridsize,gridsize)) %>%
      mutate(X = sin(60*pi/180+rowAngle) *sp*rowid + {{cX}},
             Y = cos(60*pi/180+rowAngle) *sp*rowid  + {{cY}})
  }

  centroids <- tibble(crowid=seq(-gridsize,gridsize)) %>%
    mutate(cY = cos(rowAngle) *spacing*crowid + cent$Y,
           #spacing/2*crowid + cent$Y,
           cX =  sin(rowAngle) *spacing*crowid + cent$X) %>%
    #cent$X + crowid* sqrt(spacing**2-(spacing/2)**2)) %>%
    rowwise() %>%
    mutate(row = list(genRow(cX = cX,cY = cY,sp = spacing))) %>%
    unnest(row) %>%
    dplyr::select(X,Y) %>%
    st_as_sf(coords = c("X", "Y"), crs = st_crs(h)) %>%
    st_filter(h) %>%
    mutate(ET_Index = h$ET_Index,
           ssuID = row_number())
  return(centroids)
}
