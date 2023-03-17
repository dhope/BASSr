## Cost estimator


#' Variables for cost estimation
#'
#' Cost variables for estimate_cost_study_area
#'
#'
#' @format A list with 18 variables used to calculate the cost model for N Ontario:
#' \describe{
#'   \item{truck_cost_per_day}{Cost of truck use per day per crew, in dollars}
#'   \item{truck_n_crews}{Number of crews for truck surveys}
#'   \item{truck_arus_per_crew_per_day}{number of arus deployed per crew per day}
#'   \item{atv_cost_per_day}{Cost of ATV use per day per crew, in dollars}
#'   \item{atv_n_crews}{Number of crews for ATV surveys}
#'   \item{atv_arus_per_crew_per_day}{Number of arus deployed per crew per day}
#'   \item{helicopter_cost_per_hour}{Cost of helicopter rental per hour, in dollars}
#'   \item{helicopter_max_km_from_base}{Maximum range of helicopter from fuelling base, in kilometres}
#'   \item{helicopter_base_setup_cost_per_km}{Cost of setting up base for helicopter use with distance from airport, in km}
#'   \item{helicopter_l_per_hour}{Helicopter fuel usage per hour, in litres}
#'   \item{helicopter_crew_size}{Helicopter crew size}
#'   \item{helicopter_aru_per_person_per_day}{Number of arus deployed per day per person}
#'   \item{helicopter_relocation_speed}{Speed of movement of helicopter when relocating, in km per hour}
#'   \item{helicopter_airport_cost_per_l}{Cost of heli fuel from an airport, in dollars per litre}
#'   \item{helicopter_base_cost_per_l}{Cost of heli fuel from a basecamp, in dollars per litre}
#'   \item{helicopter_2nd_base_cost_per_l}{Cost of heli fuel from a a remote fuel cache, in dollars per litre}
#'   \item{helicopter_hours_flying_within_sa_per_day}{Number of hours a helicopter spends flying in the study area per day.}
#'   ...
#' }
#' @source Advice from Rich Russell
#' @export
cost_vars <- list(
  truck_cost_per_day = 600,
  truck_n_crews = 2,
  truck_arus_per_crew_per_day = 5,
  atv_cost_per_day = 1200,
  atv_n_crews = 2,
  atv_arus_per_crew_per_day = 3,
  helicopter_cost_per_hour = 1250,
  helicopter_max_km_from_base = 150,
  helicopter_base_setup_cost_per_km = 7.5 * 1.2,
  helicopter_l_per_hour = 160,
  helicopter_crew_size = 4,
  helicopter_aru_per_person_per_day = 5,
  # helicopter_base_cost_per_day = 100,
  helicopter_relocation_speed = 180, # km/hr
  helicopter_airport_cost_per_l = data.frame(AirportType = c("Highway","Secondary" , "Remote"),lCost=c( 1.3,1.5, 2.0)), #1.3,
  helicopter_base_cost_per_l = 5,
  helicopter_2nd_base_cost_per_l = 10,
  helicopter_hours_flying_within_sa_per_day = 5
)
# usethis::use_data(cost_vars, internal = F,overwrite=T)

#' Cost model estimate
#'
#' @param narus The number of ARUs to deploy in the study area
#' @param StudyAreas Tibble with study area information and distances
#' @param pr Column with primary road buffer proportion of study area
#' @param sr Column with secondary Road proportion of study area ( should not include primary road area)
#' @param wr Column with Winter Road proportion of study area ( should not include primary or secondary road areas)
#' @param dist_base_sa Column with distance between basecamp and study area
#' @param dist_airport_sa Column with distance between airport and study area
#' @param dist2airport_base Column with distance between airport and base camp
#' @param AirportType Column with nearest airport type
#' @param vars
#'
#' @return
#' @export
estimate_cost_study_area <- function(narus, StudyAreas, pr, sr, wr = 0,
                                     dist_base_sa, dist_airport_sa,
                                     dist2airport_base, AirportType, vars) {

  list2env(vars, envir = environment())

  StudyAreas %>%
    dplyr::mutate(AT = {{AirportType}}) %>%
    {if("lCost" %in% names(.)){.} else{
      dplyr::left_join(x = ., helicopter_airport_cost_per_l,
              by = c("AT" = "AirportType") ) }} %>%
    dplyr::mutate(

    # Cost of survey the study area by truck
    primary_cost = truck_cost_per_day * narus / (truck_arus_per_crew_per_day), #* truck_n_crews),
    # Cost of surveying the study area by atv
    atv_cost = atv_cost_per_day * narus / (atv_arus_per_crew_per_day * atv_n_crews),
    # # Distance between airport and basecamp
    # if(!isTRUE(manualdist)){
    # dist2airport_base <- as.numeric(st_distance(base, airport)  )/1000
    # # Distance between Study Area centroid and basecamp
    # dist_base_sa <- as.numeric(st_distance(centroid, base) ) / 1000
    # # Distance between Study Area centroid and airport
    # dist_airport_sa <- as.numeric(st_distance(centroid, airport)) / 1000
    # }

    # Fuel cost
    # Based on distance to base from airport and distance from base to sa
    heli_cost_per_l = dplyr::if_else({{ dist_airport_sa }} < helicopter_max_km_from_base,
                                     lCost,
      # helicopter_airport_cost_per_l,
      dplyr::if_else({{ dist_base_sa }} < helicopter_max_km_from_base,
        helicopter_base_cost_per_l, helicopter_2nd_base_cost_per_l
      )
    ),

    # Estimated helicopter cost
    cost_base = ifelse({{ dist_airport_sa }} < helicopter_max_km_from_base, 0,
      {{ dist2airport_base }} * helicopter_base_setup_cost_per_km + # Cost to move fuel to basecamp
        2 * {{ dist2airport_base }} / helicopter_relocation_speed * helicopter_l_per_hour * heli_cost_per_l
    ),

    cost_to_SA = ifelse({{ dist_airport_sa }} < helicopter_max_km_from_base,
      # If no camp
      2 * {{ dist_airport_sa }} / helicopter_relocation_speed * (helicopter_l_per_hour * heli_cost_per_l + helicopter_cost_per_hour),
      # with Camp
      2 * {{ dist_base_sa }} / helicopter_relocation_speed * (helicopter_l_per_hour * heli_cost_per_l + helicopter_cost_per_hour)
    ),
    cost_within_SA = narus / (helicopter_crew_size * helicopter_aru_per_person_per_day) *
      helicopter_hours_flying_within_sa_per_day * (helicopter_cost_per_hour + helicopter_l_per_hour * heli_cost_per_l),

    total_truck_cost = primary_cost * {{ pr }},
    total_atv_cost = atv_cost * {{ sr }},
    total_winter_cost = atv_cost * {{ wr }}, # CURRENTLY USING ATV COSTING FOR WINTER ROAD
    p_heli = pmax(0,(1 - {{ pr }} - {{ sr }} - {{ wr }})),
    total_heli_cost = p_heli * (cost_base + cost_to_SA + cost_within_SA),
    narus = narus,
    RawCost = total_truck_cost + total_atv_cost + total_heli_cost + total_winter_cost
  )


  #  if(isTRUE(returnall)){
  #    return(tibble(primary_cost,
  #                  atv_cost,
  #                  dist2airport_base,
  #                  dist_base_sa,
  #                  dist_airport_sa,
  #                  heli_cost_per_l,
  #                  cost_base,
  #                  cost_to_SA,
  #                  cost_within_SA,
  #                  total_cost,total_truck_cost,
  #                  total_atv_cost,
  #                  total_heli_cost))
  #  }
  #
  # total_cost
}

#' Calculate road density in a hexagon
#'
#' This function uses pregenerated buffers to calculate the proportion of a hexagon covered by 3 road types and total.
#'
#' @param hexes Hexagon layer
#' @param sa hexagon id to extract road info from
#' @param pr Primary roads (truck roads) buffer. Should be a polygon layer
#' @param sr Secondary (atv roads) buffer. Should be a polygon layer
#' @param wr Winter roads buffer. Should be a polygon layer
#' @param r Total roads buffer. Should be polygon
#' @param idcol Column with hexagon ids
#' @param ... You can include multisession with the furrr package. Needs to include Multicor=T
#'
#' @return Returns a tibble with area covered by each road types and their proportion of the study area
#'
#' @noRd
#'
getroaddensity <- function(hexes, sa, pr, sr, wr, r, idcol, ...) {
  # message(sa)
  # if (exists("pb")) {
  #   pb$tick()#$print()
  # }
  args_ <- list(...)
  if(isTRUE(args_$Multcor)){
    hex <- dplyr::filter(hexes, .data[[idcol]] == sa)
    sr_h <- dplyr::filter(hex, .data[[idcol]] == "CLIMATE ACTION NOW")
    pr_h <- dplyr::filter(hex, .data[[ idcol ]] == "CATBURGLER")
  }else{
    hex <- dplyr::filter(hexes, {{ idcol }} == sa)
    sr_h <- dplyr::filter(hex, {{ idcol }} == "CLIMATE ACTION NOW")
    pr_h <- dplyr::filter(hex, {{ idcol }} == "CATBURGLER")
  }

  saa <- as.numeric(st_area(hex))
  if ("r_lg" %in% colnames(hex)) { # Shortcut to avoid calculating road densitys where there are no roads in SA
    if (!isTRUE(any(hex$r_lg))) {
      return(
        tibble(
          saa = saa,
          pr = 0,
          sr = 0,
          r = 0,
          wr = 0,
          {{ idcol }} := as.character(sa),
          p_pr = 0, # Covert to proportion of area
          p_sr = 0,
          p_wr = 0
        )
      )
    }
  }


  # browser()
  #if (any((st_intersects(hex, pr, sparse = F)))) {
    pr_h <- sf::st_intersection(pr, hex)
  #} # else{print("No Prime")}#,
  # %>% st_area() %>% sum#ifelse(isTRUE(st_contains(hex, pr), sparse =F),, 0)
 # if (any((st_intersects(hex, sr, sparse = F)))) {
    sr_h <- sf::st_intersection(sr, hex)
  #} # else{print("No Sec")}
  ## %>% st_area() %>% sum#ifelse(isTRUE(st_contains(hex, sr, sparse =F)), ,0)
    sr_h_noP <- dplyr::if_else((nrow(pr_h) == 0) | (nrow(sr_h) == 0), sr_h, sf::st_difference(sr_h, pr_h))

  pr_a <- sf::st_area(pr_h) %>%
    as.numeric() %>%
    sum()
  sr_a <- sf::st_area(sr_h_noP) %>%
    as.numeric() %>%
    sum()
  r_h <- sf::st_intersection(r, hex) %>%
    sf::st_area() %>%
    as.numeric() %>%
    sum() # ifelse(isTRUE(st_contains(hex, r, sparse =F)), ,0)
  wr_h <- sf::st_intersection(wr, hex) %>%
    sf::st_area() %>%
    as.numeric() %>%
    sum() # ifelse(isTRUE(st_contains(hex, r, sparse =F)), ,0)

  if(sr_a>saa){simpleError(glue::glue("Secondary Road {sr_a} is less than study area {saa}"))}
  dplyr::tibble(
    saa = saa,
    pr = ifelse(length(pr_a) == 0, 0, pr_a),
    sr = ifelse(length(sr_a) == 0, 0, sr_a),
    r = ifelse(length(r_h) == 0, 0, r_h),
    wr = ifelse(length(wr_h) == 0, 0, wr_h),
    {{ idcol }} := as.character(sa)
  ) %>%
    dplyr::mutate(
      p_pr = pr / saa, # Covert to proportion of area
      p_sr = sr / saa,
      p_wr = wr / saa
    )
}


#' Propare hexagons for cost calculations
#'
#' @param truck_roads Primary roads (truck roads) buffer. Should be a polygon layer. Only used if calculating road estimates.
#' @param atv_roads Secondary (atv roads) buffer. Should be a polygon layer. Only used if calculating road estimates.
#' @param winter_roads Winter roads buffer. Should be a polygon layer. Not currently in use.
#' @param all_roads Total roads buffer. Should be polygon.  Not currently in use.
#' @param airports Airport locations. Should be a polygon layer.
#' @param basecamps Basecamp locations. Should be a polygon layer.
#' @param hexagons Hexagon layer
#' @param idcol_ Column with hexagon ids
#' @param calc_roads Logical. Should you calculate roads or are they already included in hexagon layer
#' @param airport_cols Columns to use extract airport info. See examples. Should be length of 3.
#' @param basecamp_cols Columns to use extract basecamp info. See examples. Should be length of 3.
#' @param ... You can include multisession with the furrr package. Needs to include Multicor=T & Cores = int
#'
#'
#' @return
#' @export
#'
#' @examples
#' \dontrun{
#' prepare_cost(
#'   truck_roads = NA, atv_roads = NA, winter_roads = NA, all_roads = NA, airports = airports_official, basecamps = tourism, hexagons = study_area_hexagons_in_brandt %>%
#'     left_join(road_info, by = c("StudyAreaID" = "StudyArea")), idcol_ = StudyAreaID, calc_roads = F, airport_cols = c("NAME", "AIRPORT_TY", "OGF_ID"),
#'   basecamp_cols = c("OFFICIAL_N", "OGF_ID", "CLASS_SUBT")
#' )
#' }
prepare_cost <- function(truck_roads, atv_roads, winter_roads, all_roads, airports, basecamps, hexagons, idcol_,
                         calc_roads = T,
                         airport_cols = c("NAME", "AIRPORT_TY", "OGF_ID"),
                         basecamp_cols = c("OFFICIAL_N", "OGF_ID", "CLASS_SUBT"), ...) {
  args_ <- list(...)
  ids <- dplyr::select(hexagons, {{ idcol_ }})[[1]]
  # unique(hexagons[[as_string(quote(idcol_))]]) # Hexagon IDs
  if (isTRUE(calc_roads)) {
    # 1 Calculate the proportion of each hexagon covered by roads
    # message("Getting road density")
    pb <- progress::progress_bar$new(total=length(ids),
                                     format =
                                       "Getting road density [:bar] :percent eta: :eta")
    if(isTRUE(args_$Multicor)){
      library(furrr)
      plan(multisession, workers= max(as.numeric(args_$Cores), 2, na.rm=T))
      # browser()
      dfk <- as_label(enquo( idcol_ ))
      hexagons_w_roads <- future_map(ids,
                                     ~{pb$tick();getroaddensity(sa = .x,
                                                                hexes = hexagons, wr = winter_roads,
                                                                pr = truck_roads, sr = atv_roads,
                                                                r = all_roads, idcol = dfk, ... )},
                                     .options = furrr_options(seed = TRUE)
      ) %>% do.call("rbind", .) %>%
        left_join(x = hexagons, y = .) %>%
        st_as_sf()
    }else{
    hexagons_w_roads <- purrr::map_df(ids, ~{pb$tick();getroaddensity(sa = .x,
      hexes = hexagons, wr = winter_roads,
      pr = truck_roads, sr = atv_roads, r = all_roads, idcol = {{ idcol_ }}, ... )}
    ) %>%
      left_join(x = hexagons, y = .) %>%
      st_as_sf()
    }
  } else {
    hexagons_w_roads <- hexagons
  }
  if("Status" %in% names(airports)){
    # browser()
    ha <- airports %>% filter(Status == "Highway")
    Hwy_airports <-  bind_cols(
      dplyr::select(basecamps, basecamp_cols[[2]]),ha[
      st_nearest_feature(basecamps, ha),] %>%
        st_drop_geometry() %>%
        transmute(HWY_AIRPORT = NAME )) %>% st_drop_geometry()
  } else{Hwy_airports <- dplyr::select(basecamps, basecamp_cols) %>% st_drop_geometry()}
  # Hexagon centroids
  hexagon_centroids <- st_centroid(hexagons_w_roads)

  min_dist <- function(x, y) {
    (st_distance(x, y, by_element = F) %>%
      apply(., 1, FUN = min, na.rm = T) %>% as.numeric()
    ) / 1000
  }

  centroids_with_road_air <- hexagon_centroids %>%
    mutate(
      airportdist_km = min_dist(., airports),
      basecamps = min_dist(., basecamps)
    )

  tst <-
    basecamps %>%
    st_nearest_feature(y = airports)
  # browser()
  if(length(airport_cols) == 3){
  basecamps[c("nearest_airport", "airporttype", "airportID")] <- airports[tst, airport_cols] %>%
    as_tibble() %>%
    dplyr::select(-geometry)
  } else  if(length(airport_cols) == 4){
    basecamps[c("nearest_airport", "airporttype", "airportID", "AirportStatus")] <- airports[tst, airport_cols] %>%
      as_tibble() %>%
      dplyr::select(-geometry)
  } else stop("Airport columns needs to be a vector 3 or 4 strings")

  # browser()
  basecamps$dist_to_air <- min_dist(basecamps, airports)
  if("Status" %in% names(airports)){basecamps$dist_to_Hwy_air <- min_dist(basecamps, filter(airports,
                                                                                            Status == "Highway"))
  } else{
    basecamps$dist_to_Hwy_air <- NA

                                                                                            }


  basecamp_order <-
    centroids_with_road_air %>%
    st_nearest_feature(y = basecamps)


  centroids_with_road_air[c(
    "NearestCabin",
    "CabinID",
    "CabinTYPE",
    "cabin_nearest_airport",
    "cabin_airporttype",
    "cabin_airportID",
    "cabin_dist_to_air",
    "cabin_dist_to_hwyair"
  )] <- as_tibble(basecamps)[(basecamp_order), c(
    basecamp_cols, "nearest_airport",
    "airporttype",
    "airportID",
    "dist_to_air",
    "dist_to_Hwy_air"
  )]


  nearest_airport <- centroids_with_road_air %>%
    st_nearest_feature(y = airports)

  if(length(airport_cols) == 3){
  centroids_with_road_air[c("nearest_airport", "airporttype", "airportID")] <- as_tibble(airports)[
    nearest_airport,
    airport_cols
  ]
  } else  if(length(airport_cols) == 4){
    centroids_with_road_air[c("nearest_airport", "airporttype", "airportID","AirportStatus")] <- as_tibble(airports)[
      nearest_airport,
      airport_cols
    ]
  } else stop("Airport columns needs to be a vector 3 or 4 strings")


  left_join(
    hexagons,
    st_drop_geometry(centroids_with_road_air)
    # dplyr::select(as_tibble(centroids_with_road_air), -geometry)
  ) %>% left_join(Hwy_airports, by = c("CabinID" = basecamp_cols[[2]]))
}

# Test
# brantStudyAreas <- read_rds(here::here("output/NONT_HexesWithinBrant.rds"))
#
# den_map <- read_rds(here::here("output/road_density_byHex_full.rds")) %>%
#   mutate(prim = pr / saa, sec = sr / saa, allroads = r/saa,
#          wint = wr /saa,
#          saa_m_prim = allroads - prim)
#
# samp <- brantStudyAreas %>% sample_n(3, weight = .$pr)
#
# sa <- samp[1,] %>% left_join(den_map, by = c("StudyAreaID" = "StudyArea"))
# base <- samp[2,]
# air <- samp[3,]
#
# d <-
# estimate_cost_study_area(narus = 30, pr = sa$prim, sr = sa$saa_m_prim,
#                          centroid = sa, base = base, airport = air, vars = cost_vars, returnall = T)
#
# pivot_longer(d,names_to = 'A', values_to = 'B', cols = everything()
#               )
# estimate_cost_study_area(narus = 30, pr = sa$prim, sr = sa$saa_m_prim,
#                          centroid = sa, base = base, airport = air, vars = cost_vars, returnall = F)
#
#
#
# x <- seq(0,1, length.out = 100)
# plot(x, estimate_cost_study_area(30, x, min(1-x,0.3), sa, base, air, cost_vars, returnall = F, manualdist = T), type = 'l')
# lines(x, estimate_cost_study_area(30, x, pmin(1-x,0.6), sa, base, air, cost_vars, returnall = F, manualdist = T), type = 'l', col='red')
# plot(x, estimate_cost_study_area(30, x, min(1-x,1), sa, base, air, cost_vars, returnall = F, manualdist = T), type = 'l')


