#' Select sites for sampling
#'
#' Selection methods for processing site selection using GRTS, random sampling,
#' clustering, or shortest path methods.
#'
#' @param sites Spatial Data frame. Site points created in `create_sites()`.
#'   Requires columns identifying the Hex ID as well as the Site ID (see
#'   `hex_id` and `site_id` respectively).
#' @param site_id Column. Identifies site IDs (default `site_id`).
#' @param type String. Method to select sites. Currently one of
#' * "Cluster"
#' * "GTRS" - Depreciated. Use Random with useGRTS = TRUE
#' * "ShortestPath"
#' * "Random"
#' @param nsamples Integer total number of points to select
#' @param os Double. Proportion of oversample
#' @param cluster_size Integer. Number of points per cluster. Not used for GRTS or Random
#' @param ARUonly Logical. Used to flag if only ARUs are going to be used.
#' @param min_dist Numeric. Minimum distance between points
#' @param useGRTS Logical. Should the program be run using GRTS? Works for Cluster or Random
#'
#' @return Returns a data frame of points selected from the sites object. Except for Shortest path, which
#'           returns a list of the points on the path and the original points selected to create the path.
#' @export
#'
select_sites <- function(sites, hexes, site_id = site_id,
                         type, nsamples, os, cluster_size, ARUonly, min_dist, useGRTS,
                         seed = NULL) {
  set.seed(seed_)
  if (!"scaled_benefit" %in% names(sites)) {
    rlang::warn("Scaled benefit not included. I'm trying to calculate using benefit/max(benefit).")
    sites$scaled_benefit <- sites$benefit / max(sites$benefit)
  }

  if (type == "Cluster") r <- select_by_cluster()
  if (type == "Random" | type == "GRTS") r <- select_by_random()
  if (type == "ShortestPath") r <- select_by_shortest()
}


select_by_cluster <- function() {
  nclusters <- floor(nsamples / cluster_size)
  nosclusters <- floor(nclusters * (os))
  if(isFALSE(useGRTS)){

    z <- 0
    while (z < 675) {
      ExampleSiteCentroids <- slice_sample(sites,
                                           n = (nosclusters + nclusters),
                                           weight_by = scaled_benefit,
                                           replace = F
      ) %>%
        arrange(desc(benefit))
      a <- st_distance(ExampleSiteCentroids)
      diag(a) <- NA
      z <- min(a, na.rm = T) %>% units::drop_units()
    }
  }
  if(isTRUE(useGRTS)){
    if(min_dist<900) rlang::warn("Minimum cluster centroid less than meters apart.
                            Chance of cluster overlap.
                            Suggest setting min_dist to 900")
    if("X" %in% names(sites) & "Y" %in% names(sites)){
      ssutab <- sites
    } else{
      ssutab <- sites %>%
        bind_cols(as_tibble(st_coordinates(.)))
    }
    sites_selected <- run_grts_on_BASS(
      n_grts_tests = 1,
      study_area_results = ssutab %>%
        mutate(inclpr = scaled_benefit) %>%
        dplyr::select({{ hex_id }}, {{ site_id }}, X, Y, inclpr) %>%
        st_drop_geometry(),
      nARUs = nclusters,
      os = os,mindis = min_dist,
      idcol = as_label(enquo( hex_id )),
      hex_id = hex_id,
      Stratum = None
    )[[1]]
    # browser()
    ExampleSiteCentroids <- bind_rows(sites_selected$sites_base, sites_selected$sites_over) |>
      st_drop_geometry() |> left_join(x=ssutab) |>
      filter(!is.na(siteID)) #|> st_as_sf()

  }

  exssuex <- sites[!sites[[site_id]] %in% ExampleSiteCentroids[[site_id]], ]
  NNcentroids <- nngeo::st_nn(ExampleSiteCentroids,
                              exssuex,
                              k = (cluster_size - 1), returnDist = T, progress = F
  )


  clusters <- purrr::map_df(1:nrow(ExampleSiteCentroids), ~ {
    ExampleSiteCentroids[.x, ] %>%
      bind_rows(exssuex[NNcentroids$nn[[.x]], ]) %>%
      mutate(
        cluster = .x, # paste0(ET_Index, "_0", .x))}) %>%
        os = ifelse(cluster <= nclusters, "Primary", "Oversample")
      )
  }) %>%
    group_by(cluster) %>%
    arrange(desc(benefit)) %>%
    mutate(pc_n_cluster = row_number()) # ,
  # ARU_PC = ifelse(pc_n_cluster<=2, "ARU", "PC"))

  aruN <- purrr::map_df(1:(nosclusters + nclusters), ~ {
    cl <- clusters[clusters$cluster == .x, ] %>% st_distance(by_element = F)
    rownames(cl) <- clusters[[site_id]][clusters$cluster == .x]
    colnames(cl) <- clusters[[site_id]][clusters$cluster == .x]
    cl <- units::drop_units(cl)
    arus1 <- as_tibble(cl, rownames = "pc1") %>%
      pivot_longer(
        cols = matches("^\\d+"),
        names_to = "pc2",
        values_to = "m"
      ) %>%
      filter(m > 600) %>%
      slice_sample(n = 1) %>%
      dplyr::select(pc1, pc2)
    # browser()
    # c(.[["pc1"]], .[["pc2"]]) #[1,c("pc1", "pc2")] %>% unlist
  })

  clusters$aru <- ifelse(clusters[[site_id]] %in% aruN$pc1 | clusters[[site_id]] %in% aruN$pc2, "ARU", "PC")
  clusters$centroid <- ifelse(clusters[[site_id]] %in% ExampleSSUcentroids[[site_id]],  "Centroid", "Adjacent")

  if (isTRUE(ARUonly)) {
    return(filter(clusters, aru == "ARU"))
  }

  return(clusters)

}

select_by_random <- function() {
  if(type == "GRTS") warn("type = 'GRTS' is depreciated. Use type = 'Random` with useGRTS=TRUE")
  if(isTRUE(useGRTS) | type == "GRTS"){
    if("X" %in% names(sites) & "Y" %in% names(sites)){
      sitetab <- sites
    } else{
      sitetab <- sites %>%
        bind_cols(as_tibble(st_coordinates(.)))
    }
    # browser()
    site_selected <- run_grts_on_BASS(
      n_grts_tests = 1,
      study_area_results = sitetab %>%
        mutate(inclpr = scaled_benefit) %>%
        dplyr::select({{hex_id}}, {{site_id}}, X, Y, inclpr) %>%
        st_drop_geometry(),
      nARUs = nsamples,
      os = os,mindis = min_dist,
      idcol = as_label(enquo(PSU_id)),
      hexid = site_id,
      Stratum = None
    )[[1]]
    # browser()
    output_site <- site_selected@data %>%
      # dplyr::select(siteID:siteid) %>%
      left_join(sites, by = {{site_id}}) %>%
      st_as_sf() %>%
      mutate(
        os = ifelse(panel == "PanelOne", "Primary", "Oversample"),
        aru = ifelse(isTRUE(ARUonly), "ARU", "PC")
      )
    return(output_site)
  }
  if(isFALSE(useGRTS)){
    nos <- floor(nsamples * os)
    if (isTRUE(ARUonly)) {
      output <- sites %>%
        slice_sample(
          n = nsamples + nos,
          weight_by = scaled_benefit
        ) %>%
        arrange(desc(benefit)) %>%
        mutate(
          aru = "ARU",
          os = c(rep("Primary", {{ nsamples }}), rep("Oversample", times = {{ nos }}))
        )
      return(output)
    }
  }
}

select_by_shortest <- function() {
  if (cluster_size < 5 | nsamples < 16) {
    rlang::abort("Currently the function can only allocate routes of 5 or more points. Updates are forthcoming")
  }
  if(nsamples%% cluster_size!=0) abort("Cluster size must be a equal proportion of total samples.")
  set.seed(2341)
  # browser()
  rwithben18 <-  sites %>%
    slice_sample(n = nsamples, weight_by = scaled_benefit) %>%
    arrange(desc(benefit)) %>%
    mutate(
      aru = "ARU",
      os = # c(
        rep("Primary", {{nsamples}} )
    ) # ,rep("Oversample",times= 18)))

  selp <- rwithben18[[site_id]][rwithben18$os == "Primary"]
  # browser()
  d <- sites %>%
    st_buffer(dist = 20 + sqrt(2 * (300**2))) %>%
    dplyr::select(focal_siteid = {{site_id}}) %>%
    # slice_sample(n=1) %>%
    rowwise() %>%
    mutate(
      nn = list(st_filter(x = sites, y = geometry)),
      neigh_id = list(nn[[site_id]]),
      num_Neigh = nrow(nn),
      dist = list(round(units::drop_units(st_distance(st_centroid(geometry), nn)), 2)),
      insample = list(ifelse(nn[[site_id]] %in% selp, 1, 0)),
      dvalue = list(case_when(dist < 150 ~ 0, dist < ({{min_dist}} +5) ~ 1, TRUE ~ 0.7)),
      value = list(dvalue * (insample + 1)) # ,
      # maxvalue = max(value),
      # bestNeigbours = list(nn[[site_id]][value == maxvalue])
    )

  theAlgorithm <- function(z,cluster_size) {
    i <- sites[sites[[site_id]] == selp[[z]], ]
    tibble(
      p0 = i [[site_id]],
      p1 = (d$neigh_id[d$focal_siteid == i[[site_id]]]),
      value = d$value[d$focal_siteid == i[[site_id]]]
    ) %>%
      ungroup() %>%
      unnest(c(p1, value)) %>%
      rowwise() %>%
      mutate(
        p2 = (d$neigh_id[d$focal_siteid == p1]),
        value2 = (d$value[d$focal_siteid == p1])
      ) %>%
      ungroup() %>%
      unnest(cols = c(p2, value2)) %>%
      rowwise() %>%
      filter(!p2 %in% c(p0, p1)) %>%
      mutate(running_value = sum(c_across(matches("^value")))) %>%
      group_by(p0) %>%
      slice_max(order_by = running_value, with_ties = T) %>%
      rowwise() %>%
      mutate(
        p3 = (d$neigh_id[d$focal_siteid == p2]),
        value3 = (d$value[d$focal_siteid == p2])
      ) %>%
      ungroup() %>%
      unnest(cols = c(p3, value3)) %>%
      rowwise() %>%
      filter(!p3 %in% c(p0, p1, p2)) %>%
      mutate(running_value = sum(c_across(matches("^value")))) %>%
      group_by(p0) %>%
      slice_max(order_by = running_value, with_ties = T) %>%
      {if({{cluster_size}}>5){
        rowwise(.) %>%
          mutate(
            p4 = (d$neigh_id[d$focal_siteid == p3]),
            value4 = (d$value[d$focal_siteid == p3])
          ) %>%
          ungroup() %>%
          unnest(cols = c(p4, value4)) %>%
          rowwise() %>%
          filter(!p4 %in% c(p0, p1, p2, p3)) %>%
          mutate(running_value = sum(c_across(matches("^value")))) %>%
          group_by(p0) %>%
          slice_max(order_by = running_value, with_ties = T)} else{.}
      } %>%
      {if({{cluster_size}}>5){
        rowwise(.) %>%
          mutate(
            p5 = (d$neigh_id[d$focal_siteid == p4]),
            value5 = (d$value[d$focal_siteid == p4])
          ) %>%
          ungroup() %>%
          unnest(cols = c(p5, value5)) %>%
          rowwise() %>%
          filter(!p5 %in% c(p0, p1, p2, p3, p4)) %>%
          mutate(running_value = sum(c_across(matches("^value")))) %>%
          group_by(p0) %>%
          slice_max(order_by = running_value, with_ties = T) } else{.}
      } %>%
      {if({{cluster_size}}>6){
        rowwise(.) %>%
          mutate(
            p6 = (d$neigh_id[d$focal_siteid == p5]),
            value6 = (d$value[d$focal_siteid == p5])
          ) %>%
          ungroup() %>%
          unnest(cols = c(p6, value6)) %>%
          rowwise() %>%
          filter(!p6 %in% c(p0, p1, p2, p3, p4, p5)) %>%
          mutate(running_value = sum(c_across(matches("^value")))) %>%
          group_by(p0) %>%
          slice_max(order_by = running_value, with_ties = T) } else{.}
      } %>%
      {if({{cluster_size}}>7){
        rowwise(.) %>%
          mutate(
            p7 = (d$neigh_id[d$focal_siteid == p6]),
            value7 = (d$value[d$focal_siteid == p6])
          ) %>%
          ungroup() %>%
          unnest(cols = c(p7, value7)) %>%
          rowwise() %>%
          filter(!p7 %in% c(p0, p1, p2, p3, p4, p5, p6)) %>%
          mutate(running_value = sum(c_across(matches("^value")))) %>%
          group_by(p0) %>%
          slice_max(order_by = running_value, with_ties = T) } else{.}
      } %>%
      {if({{cluster_size}}>8){
        rowwise(.) %>%
          mutate(
            p8 = (d$neigh_id[d$focal_siteid == p7]),
            value8 = (d$value[d$focal_siteid == p7])
          ) %>%
          ungroup() %>%
          unnest(cols = c(p8, value8)) %>%
          rowwise() %>%
          filter(!p8 %in% c(p0, p1, p2, p3, p4, p5, p6, p7)) %>%
          mutate(running_value = sum(c_across(matches("^value")))) %>%
          group_by(p0) %>%
          slice_max(order_by = running_value, with_ties = T)} else{.}
      } %>%
      rowwise() %>%
      mutate(
        total_value = sum(c_across(matches("^value"))),
        mean_value = mean(c_across(matches("^value")))
      ) %>%
      ungroup()
  }
  fullHexAlg <- purrr::map_df(1:length(selp), theAlgorithm, cluster_size = cluster_size)
  fh <- fullHexAlg %>%
    mutate(origin = p0, lineid = row_number()) %>%
    dplyr::select(-matches("^value")) %>%
    dplyr::select(-matches("^value")) %>%
    pivot_longer(cols = matches("^p\\d"), values_to = {{ site_id }}, names_to = "linepoint")

  nroutes <- nsamples/cluster_size

  routes <- fullHexAlg %>%
    # group_by(p0) %>%
    slice_max(mean_value, n = 1, with_ties = F) %>%
    mutate(origin = p0, lineid = row_number()) %>%
    dplyr::select(-matches("^value")) %>%
    pivot_longer(cols = matches("^p\\d"), values_to = {{ site_id }}, names_to = "linepoint") %>%
    left_join(sites) %>%
    st_as_sf() %>%
    group_by(origin, lineid) %>%
    arrange({{ site_id }}) %>%
    mutate(route = 1)
  for(i in 2:nroutes){
    routetmp <- filter(fullHexAlg, if_all((matches("^p\\d")), .fns = ~ !.x %in% routes[[site_id]])) %>%
      slice_max(mean_value, n = 1, with_ties = F) %>%
      mutate(origin = p0, lineid = row_number()) %>%
      dplyr::select(-matches("^value")) %>%
      pivot_longer(cols = matches("^p\\d"), values_to = {{ site_id }}, names_to = "linepoint") %>%
      left_join(sites) %>%
      st_as_sf() %>%
      group_by(origin, lineid) %>%
      arrange({{ site_id }}) %>%
      mutate(route = i)

    routes <- bind_rows(routes, routetmp)
  }


  return(list(sampled = rwithben18, routes = routes))
}

