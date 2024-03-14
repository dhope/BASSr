#' Select SSU
#'
#' Selection methods for processing SSU selection using GRTS, random sampling,
#'    clustering, or shortest path methods.
#'
#' @param SSUs  sf dataframe of points showing SSU locations
#' @param PSU_id Lazy named column showing PSU id
#' @param SSU_id String showing id column for SSU id
#' @param type String. Method to select SSUs. Currently one of
#' * "Cluster"
#' * "GTRS" - Depreciated. Use Random with useGRTS = TRUE
#' * "ShortestPath"
#' * "Random"
#' @param nsamples Integer total number of points to select
#' @param os Double. Proportion of oversample
#' @param cluster_size Integer. Number of points per cluster. Not used for GRTS or Random
#' @param ARUonly Logical. Used to flag if only ARUs are going to be used.
#' @param seed_ Random seed
#' @param min_dist Numeric. Minimum distance between points
#' @param useGRTS Logical. Should the program be run using GRTS? Works for Cluster or Random
#'
#' @return Returns a data frame of points selected from the SSUs object. Except for Shortest path, which
#'           returns a list of the points on the path and the original points selected to create the path.
#' @export
#'
select_sites <- function(SSUs,PSU_id,  SSU_id, type, nsamples, os, cluster_size, ARUonly, seed_, min_dist, useGRTS) {
  set.seed(seed_)
  if (!"scaled_benefit" %in% names(SSUs)) {
    rlang::warn("Scaled benefit not included. I'm trying to calculate using benefit/max(benefit).")
    SSUs$scaled_benefit <- SSUs$benefit / max(SSUs$benefit)
  }

  if (type == "Cluster") {
    nclusters <- floor(nsamples / cluster_size)
    nosclusters <- floor(nclusters * (os))
    if(isFALSE(useGRTS)){

    z <- 0
    while (z < 675) {
      ExampleSSUcentroids <- slice_sample(SSUs,
                                          n = (nosclusters + nclusters),
                                          weight_by = scaled_benefit,
                                          replace = F
      ) %>%
        arrange(desc(benefit))
      a <- st_distance(ExampleSSUcentroids)
      diag(a) <- NA
      z <- min(a, na.rm = T) %>% units::drop_units()
    }
    }
    if(isTRUE(useGRTS)){
      if(min_dist<900) rlang::warn("Minimum cluster centroid less than meters apart.
                            Chance of cluster overlap.
                            Suggest setting min_dist to 900")
      if("X" %in% names(SSUs) & "Y" %in% names(SSUs)){
        ssutab <- SSUs
      } else{
        ssutab <- SSUs %>%
          bind_cols(as_tibble(st_coordinates(.)))
      }
      SSU_selected <- run_grts_on_BASS(
        n_grts_tests = 1,
        study_area_results = ssutab %>%
          mutate(inclpr = scaled_benefit) %>%
          dplyr::select({{PSU_id}}, {{SSU_id}}, X, Y, inclpr) %>%
          st_drop_geometry(),
        nARUs = nclusters,
        os = os,mindis = min_dist,
        idcol = as_label(enquo(PSU_id)),
        hexid = SSU_id,
        Stratum = None
      )[[1]]
      # browser()
      ExampleSSUcentroids <- bind_rows(SSU_selected$sites_base, SSU_selected$sites_over) |>
        st_drop_geometry() |> left_join(x=ssutab) |>
        filter(!is.na(siteID)) #|> st_as_sf()

    }

    exssuex <- SSUs[!SSUs[[SSU_id]] %in% ExampleSSUcentroids[[SSU_id]], ]
    NNcentroids <- nngeo::st_nn(ExampleSSUcentroids,
                                exssuex,
                                k = (cluster_size - 1), returnDist = T, progress = F
    )


    clusters <- purrr::map_df(1:nrow(ExampleSSUcentroids), ~ {
      ExampleSSUcentroids[.x, ] %>%
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
      rownames(cl) <- clusters[[SSU_id]][clusters$cluster == .x]
      colnames(cl) <- clusters[[SSU_id]][clusters$cluster == .x]
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

    clusters$aru <- ifelse(clusters[[SSU_id]] %in% aruN$pc1 | clusters[[SSU_id]] %in% aruN$pc2, "ARU", "PC")
    clusters$centroid <- ifelse(clusters[[SSU_id]] %in% ExampleSSUcentroids[[SSU_id]],  "Centroid", "Adjacent")

    if (isTRUE(ARUonly)) {
      return(filter(clusters, aru == "ARU"))
    }

    return(clusters)


  }
  if (type == "Random" | type == "GRTS") {
    if(type == "GRTS") warn("type = 'GRTS' is depreciated. Use type = 'Random` with useGRTS=TRUE")
    if(isTRUE(useGRTS) | type == "GRTS"){
      if("X" %in% names(SSUs) & "Y" %in% names(SSUs)){
        ssutab <- SSUs
      } else{
        ssutab <- SSUs %>%
          bind_cols(as_tibble(st_coordinates(.)))
      }
      # browser()
      SSU_selected <- run_grts_on_BASS(
        n_grts_tests = 1,
        study_area_results = ssutab %>%
          mutate(inclpr = scaled_benefit) %>%
          dplyr::select({{PSU_id}}, {{SSU_id}}, X, Y, inclpr) %>%
          st_drop_geometry(),
        nARUs = nsamples,
        os = os,mindis = min_dist,
        idcol = as_label(enquo(PSU_id)),
        hexid = SSU_id,
        Stratum = None
      )[[1]]
      # browser()
      output_ssu <- SSU_selected@data %>%
        # dplyr::select(siteID:ssuid) %>%
        left_join(SSUs, by = {{SSU_id}}) %>%
        st_as_sf() %>%
        mutate(
          os = ifelse(panel == "PanelOne", "Primary", "Oversample"),
          aru = ifelse(isTRUE(ARUonly), "ARU", "PC")
        )
      return(output_ssu)
    }
    if(isFALSE(useGRTS)){
    nos <- floor(nsamples * os)
    if (isTRUE(ARUonly)) {
      output <- SSUs %>%
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
  if (type == "ShortestPath") {
    if (cluster_size < 5 | nsamples < 16) {
      rlang::abort("Currently the function can only allocate routes of 5 or more points. Updates are forthcoming")
    }
    if(nsamples%% cluster_size!=0) abort("Cluster size must be a equal proportion of total samples.")
    set.seed(2341)
    # browser()
    rwithben18 <-  SSUs %>%
      slice_sample(n = nsamples, weight_by = scaled_benefit) %>%
      arrange(desc(benefit)) %>%
      mutate(
        aru = "ARU",
        os = # c(
          rep("Primary", {{nsamples}} )
      ) # ,rep("Oversample",times= 18)))

    selp <- rwithben18[[SSU_id]][rwithben18$os == "Primary"]
    # browser()
    d <- SSUs %>%
      st_buffer(dist = 20 + sqrt(2 * (300**2))) %>%
      dplyr::select(focal_ssuid = {{SSU_id}}) %>%
      # slice_sample(n=1) %>%
      rowwise() %>%
      mutate(
        nn = list(st_filter(x = SSUs, y = geometry)),
        neigh_id = list(nn[[SSU_id]]),
        num_Neigh = nrow(nn),
        dist = list(round(units::drop_units(st_distance(st_centroid(geometry), nn)), 2)),
        insample = list(ifelse(nn[[SSU_id]] %in% selp, 1, 0)),
        dvalue = list(case_when(dist < 150 ~ 0, dist < ({{min_dist}} +5) ~ 1, TRUE ~ 0.7)),
        value = list(dvalue * (insample + 1)) # ,
        # maxvalue = max(value),
        # bestNeigbours = list(nn[[SSU_id]][value == maxvalue])
      )

    theAlgorithm <- function(z,cluster_size) {
      i <- SSUs[SSUs[[SSU_id]] == selp[[z]], ]
      tibble(
        p0 = i [[SSU_id]],
        p1 = (d$neigh_id[d$focal_ssuid == i[[SSU_id]]]),
        value = d$value[d$focal_ssuid == i[[SSU_id]]]
      ) %>%
        ungroup() %>%
        unnest(c(p1, value)) %>%
        rowwise() %>%
        mutate(
          p2 = (d$neigh_id[d$focal_ssuid == p1]),
          value2 = (d$value[d$focal_ssuid == p1])
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
          p3 = (d$neigh_id[d$focal_ssuid == p2]),
          value3 = (d$value[d$focal_ssuid == p2])
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
              p4 = (d$neigh_id[d$focal_ssuid == p3]),
              value4 = (d$value[d$focal_ssuid == p3])
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
              p5 = (d$neigh_id[d$focal_ssuid == p4]),
              value5 = (d$value[d$focal_ssuid == p4])
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
              p6 = (d$neigh_id[d$focal_ssuid == p5]),
              value6 = (d$value[d$focal_ssuid == p5])
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
              p7 = (d$neigh_id[d$focal_ssuid == p6]),
              value7 = (d$value[d$focal_ssuid == p6])
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
              p8 = (d$neigh_id[d$focal_ssuid == p7]),
              value8 = (d$value[d$focal_ssuid == p7])
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
      pivot_longer(cols = matches("^p\\d"), values_to = {{ SSU_id }}, names_to = "linepoint")

    nroutes <- nsamples/cluster_size

    routes <- fullHexAlg %>%
      # group_by(p0) %>%
      slice_max(mean_value, n = 1, with_ties = F) %>%
      mutate(origin = p0, lineid = row_number()) %>%
      dplyr::select(-matches("^value")) %>%
      pivot_longer(cols = matches("^p\\d"), values_to = {{ SSU_id }}, names_to = "linepoint") %>%
      left_join(SSUs) %>%
      st_as_sf() %>%
      group_by(origin, lineid) %>%
      arrange({{ SSU_id }}) %>%
      mutate(route = 1)
    for(i in 2:nroutes){
      routetmp <- filter(fullHexAlg, if_all((matches("^p\\d")), .fns = ~ !.x %in% routes[[SSU_id]])) %>%
        slice_max(mean_value, n = 1, with_ties = F) %>%
        mutate(origin = p0, lineid = row_number()) %>%
        dplyr::select(-matches("^value")) %>%
        pivot_longer(cols = matches("^p\\d"), values_to = {{ SSU_id }}, names_to = "linepoint") %>%
        left_join(SSUs) %>%
        st_as_sf() %>%
        group_by(origin, lineid) %>%
        arrange({{ SSU_id }}) %>%
        mutate(route = i)

      routes <- bind_rows(routes, routetmp)
    }


    return(list(sampled = rwithben18, routes = routes))
  }
}
