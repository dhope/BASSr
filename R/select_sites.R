#' Select sites for sampling
#'
#' Selection methods for processing site selection using GRTS, random sampling,
#' clustering, or shortest path methods.
#'
#' @param sites Spatial Data frame. Site points created in `create_sites()`.
#'   Requires columns identifying the Hex ID as well as the Site ID (see
#'   `hex_id` and `site_id` respectively).
#' @param site_id Column. Identifies site IDs (default `site_id`).
#' @param type String. Method to select sites. Must be one of
#' * "cluster" - Clustered sampling. Sample a single point, then `cluster_size`
#'    samples around that point.
#' * "path" - Shortest Path sampling. Sample a single point, then `cluster_size`
#'    samples in a path from that point.
#' * "Random" - Random sampling. Sample a random set of points.
#' @param n_samples Numeric. Number of samples to draw for each hex.
#' @param os Numeric. Over sample size (proportional). Only applies to Clusters
#'   and Random.
#' @param cluster_size Integer. For *Clusters*, number of points per cluster.
#'   For *Shortest Paths*, number of points per path. Only applies to Clusters
#'   and Paths.
#' @param ARUonly Logical. Return only ARU locations. If `FALSE` Clusters return
#'   point count locations as well. Only applies to Clusters and Random
#'   sampling.
#' @param min_dist Numeric. Minimum distance between points, or if Clusters,
#'   between cluster centres.
#' @param min_dist_cluster Numeric. Minimum distance between ARU samples within
#'   clusters. Only applies to Clusters.
#' @param useGRTS Logical. Should the program be run using GRTS? Only applies to
#'   Clusters or Random samples.
#' @param progress Logical. Show progress bars if applicable.
#'
#' @return
#'   * If Clustered, returns a data frame of clustered points selected from sites.
#'   * If Random, returns a data frame of sampled points selected from sites.
#'   * If Shortest Path, returns a list of the points on the path and the original points selected to create the path.
#' @export
#'
#' @examples
#'
select_sites <- function(sites, type, n_samples, min_dist,
                         cluster_size = NULL, min_dist_cluster = NULL, os = NULL,
                         hex_id = hex_id, site_id = site_id,
                         ARUonly = FALSE, useGRTS = TRUE,
                         progress = TRUE, seed = NULL) {

  # Checks
  if(!type %in% c("cluster", "random", "path")) {
    type_orig <- type
    type <- tolower(type)
    type <- dplyr::case_when(stringr::str_detect(type, "cluster") ~ "cluster",
                             stringr::str_detect(type, "random") ~ "random",
                             stringr::str_detect(type, "short|path") ~ "path")
    inform(c(paste0("`type = \"", type_orig, "\"` did not match \"cluster\", \"random\", or \"path\"."),
             paste0("Continuing with closest match: `", type, "`")))
  }

  if (!"scaled_benefit" %in% names(sites)) {
    if(!"benefit" %in% names(sites)) abort("Must have `benefit` or `scaled_benefit` to sample sites")
    warn("Scaled benefit not included. I'm trying to calculate using benefit/max(benefit).")
    sites <- dplyr::mutate(sites, scaled_benefit = benefit / max(benefit), .by = {{ hex_id }})
  }

  spacing <- site_spacing(sites)

  if(type == "cluster") {
    r <- select_by_cluster(sites, {{ hex_id }}, {{ site_id }}, n_samples, os, cluster_size,
                           ARUonly, min_dist, min_dist_cluster, useGRTS, spacing, seed)
  } else if (type == "random") {
    if(!is.null(cluster_size) | !is.null(min_dist_cluster)) {
      inform("`cluster_size` and `min_dist_cluster`, do not apply to Shortest Path sampling")
    }
    r <- select_by_random(sites, {{ hex_id }}, {{ site_id }}, n_samples, os,
                          ARUonly, min_dist, useGRTS, seed)
  } else if (type == "path") {
    if(!is.null(os) | !is.null(min_dist_cluster)) {
      inform("`os`, `min_dist_cluster`, `ARUonly` and `useGRTS` do not apply to Shortest Path sampling")
    }
    #if(cluster_size > 40) abort("Path lengths > 40 are not recommended")
    r <- select_by_path(sites, {{ hex_id }}, {{ site_id }}, n_samples, cluster_size,
                        min_dist, progress, spacing, seed)
  }
  r
}

select_with_grts <- function(sites, hex_id, site_id, n, os, min_dist, seed) {

  if(!("X" %in% names(sites) & "Y" %in% names(sites))) {
    sites <- dplyr::bind_cols(sites, dplyr::as_tibble(sf::st_coordinates(sites)))
  }

  hexes <- dplyr::pull(sites, {{ hex_id }}) |>
    unique()
  n <- rep(n, length(hexes)) |>
    set_names(hexes)

  sites <- sites |>
    dplyr::mutate(inclpr = scaled_benefit) |>
    dplyr::select({{ hex_id }}, {{ site_id }}, X, Y, inclpr)

  selected <- run_grts_on_BASS(
    probs = sites,
    nARUs = n,
    os = os,
    mindis = min_dist,
    hex_id = site_id,
    stratum_id = hex_id,
    seed = seed
  )

  dplyr::bind_rows(selected$sites_base, selected$sites_over) |>
    sf::st_drop_geometry() |>
    dplyr::left_join(
      x = sites,
      by = dplyr::join_by({{ hex_id }}, {{site_id }},
                          "X", "Y", "inclpr")) |>
    dplyr::filter(!is.na(siteID))

}

select_by_cluster <- function(sites, hex_id, site_id, n_samples, os, cluster_size,
                              ARUonly, min_dist, min_dist_cluster, useGRTS, spacing, seed) {

  n_clusters <- floor(n_samples / cluster_size)
  n_os_clusters <- floor(n_clusters * (os))

  # Check spacing
  dist <- cluster_dist(cluster_size, spacing)
  if((dist + spacing) >= min_dist) {
    warn(paste0("Based on your site spacing (", spacing, "), ",
                "the minimum distance between clusters (`min_dist = ", min_dist, "`),\n",
                "and your desired cluster size (`cluster_size = ", cluster_size, "`) ",
                "there is a good chance that your clusters will overlap/abut"))
  }

  if(useGRTS) selected <- select_with_grts(sites, hex_id, site_id, n_clusters, os, min_dist, seed)

  if(!useGRTS) {
    hexes <- dplyr::pull(sites, {{ hex_id }}) |> dplyr::n_distinct()
    z <- 0
    set_seed(seed, {
      while (z < sqrt(spacing**2 + (spacing/2)**2)*2) { # Or min dist?
        selected <- dplyr::slice_sample(
          sites,
          n = n_os_clusters + n_clusters,
          weight_by = scaled_benefit,
          replace = FALSE,
          by = {{ hex_id }}
        ) |>
          dplyr::arrange(dplyr::desc(scaled_benefit))
        a <- sf::st_distance(selected)
        diag(a) <- NA
        z <- min(a, na.rm = TRUE) |>
          units::drop_units()
      }
    })
  }

  clusters <- dplyr::mutate(sites, selected = {{ site_id }} %in% dplyr::pull(selected, {{ site_id }})) |>
    dplyr::select({{ hex_id }}, {{ site_id }}, "selected") |>
    tidyr::nest(set = -c({{ hex_id }})) |>
    dplyr::mutate(clusters = purrr::map(set, \(x) {

      # Get clusters
      s <- dplyr::filter(x, selected)
      ns <- dplyr::filter(x, !selected)
      nn <- nngeo::st_nn(s, ns,
                         k = cluster_size - 1,
                         returnDist = TRUE,
                         progress = FALSE)[["nn"]]

      cl <- purrr::map(seq_along(nn), \(x) {

        cl1 <- dplyr::bind_rows(s[x, ], ns[nn[[x]], ]) |>
          dplyr::mutate(cluster = .env[["x"]])

        # Get ARUs
        dist <- sf::st_distance(cl1, by_element = FALSE) |>
          units::drop_units()
        rownames(dist) <- colnames(dist) <- dplyr::pull(cl1, {{ site_id }})

        arus <- dplyr::as_tibble(dist, rownames = "pc1") |>
          tidyr::pivot_longer(
            cols = dplyr::matches("^\\d+"),
            names_to = "pc2",
          values_to = "m"
        ) |>
        dplyr::filter(m >= .env[["min_dist_cluster"]]) |>
        dplyr::slice_sample(n = 1) |>
        dplyr::select("pc1", "pc2")

        dplyr::mutate(
          cl1,
          aru = dplyr::if_else({{ site_id }} %in% c(arus$pc1, arus$pc2), "ARU", "PC"))
      }) |>
        purrr::list_rbind()
    })) |>
    dplyr::select({{ hex_id }}, "clusters") |>
    tidyr::unnest("clusters") |>
    sf::st_as_sf() |>
    dplyr::left_join(sf::st_drop_geometry(sites),
                     by = dplyr::join_by({{ hex_id }}, {{ site_id }})) |>
    dplyr::group_by({{ hex_id }}, cluster) |>
    dplyr::arrange(dplyr::desc(scaled_benefit)) |>
    dplyr::mutate(pc_n_cluster = dplyr::row_number(),
                  os = dplyr::if_else(.data[["cluster"]] <= .env[["n_clusters"]],
                                      "Primary", "Oversample"),
                  centroid = dplyr::if_else(.data[["selected"]], "Centroid", "Adjacent")) |>
    dplyr::ungroup() |>
    dplyr::select(-"selected")

  if(ARUonly) clusters <- dplyr::filter(clusters, .data[["aru"]] == "ARU")

  clusters
}

site_spacing <- function(sites) {
 sf::st_distance(sites[1,], sites[-1,]) |>
    as.numeric() |>
    round() |>
    min()
}

cluster_dist <- function(cells, spacing) {
  rows <- ceiling(1 + ((cells - 1)/6))
  max_dist <- (rows * 2) - 1
  max_dist * spacing
}

select_by_random <- function(sites, hex_id, site_id, n_samples, os,
                             ARUonly, min_dist, useGRTS, seed) {

  if(useGRTS) {
    selected <- select_with_grts(sites, hex_id, site_id, n = n_samples, os, min_dist, seed)
    if(ARUonly) selected$aru <- "ARU" else selected$aru <- "PC"

  } else {
    n_os <- floor(n_samples * os)
    if(ARUonly) {
      output <- sites |>
        dplyr::slice_sample(
          n = n_samples + n_os,
          weight_by = scaled_benefit
        ) |>
        dplyr::arrange(dplyr::desc(scaled_benefit)) |>
        dplyr::mutate(
          aru = "ARU",
          os = c(rep("Primary", .env[["n_samples"]]),
                 rep("Oversample", times = .env[["nos"]]))
        )
    }
  }
  selected
}

select_by_path <- function(sites, hex_id, site_id, n_samples, cluster_size,
                           min_dist, progress, spacing, seed, call = caller_env()) {

  if(n_samples %% cluster_size != 0) {
    abort("Cluster size (samples per path) must be a equal proportion of total samples.", call = call)
  }
  #set.seed(2341)

  sites <- tidyr::nest(sites, sites = -{{ hex_id }})

  # Get initial sample
  sampled <- dplyr::mutate(sites, sampled = purrr::map(sites, \(x) {
    set.seed(2341)
    x |>
      dplyr::slice_sample(n = n_samples, weight_by = scaled_benefit) |>
      dplyr::arrange(dplyr::desc(scaled_benefit)) |>
      dplyr::mutate(aru = "ARU", os = rep("Primary", .env[["n_samples"]]))
  }, .progress = progress))


  routes <- sampled |>
    dplyr::mutate(routes = purrr::map2(
      sites, sampled, \(sites, sampled) {
        select_by_path_hex(sites, sampled, {{ site_id }}, cluster_size, n_samples, min_dist, spacing)
      }, .progress = progress)) |>
    dplyr::select({{ hex_id }}, "routes") |>
    tidyr::unnest("routes") |>
    sf::st_as_sf()

  sampled <- sampled |>
    dplyr::select({{ hex_id }}, "sampled") |>
    tidyr::unnest(sampled) |>
    sf::st_as_sf()

  list(sampled = sampled, routes = routes)
}


#' Select paths within a hex
#'
#' This is the workhorse function for selecting sites and their paths within
#' a hex.
#'
#' @noRd
select_by_path_hex <- function(sites, sampled, site_id, cluster_size, n_samples,
                               min_dist, spacing) {

  sampled_ids <- dplyr::pull(sampled, {{ site_id }})

  # Calculate distance among all sites
  dist <- sf::st_distance(sites) |>
    units::drop_units() |>
    round(digits = 2)
  dimnames(dist) <- list(dplyr::pull(sites, {{ site_id }}),
                         dplyr::pull(sites, {{ site_id }}))

  # Calculate neighbours for all sites
  d <- sites |>
    sf::st_buffer(dist = 20 + sqrt(2 * spacing**2)) |>
    dplyr::select(focal_siteid = {{ site_id }}) |>
    dplyr::rowwise() |>
    dplyr::mutate(
      nn = list(sf::st_filter(x = sites, y = geometry)),
      neigh_id = list(dplyr::pull(nn, {{ site_id }})),
      num_Neigh = nrow(nn),
      dist = list(dist[focal_siteid, neigh_id]),
      insample = list(neigh_id %in% sampled_ids),
      dvalue = list(dplyr::case_when(dist < .env[["spacing"]]/2 ~ 0,
                                     dist < .env[["min_dist"]] + 5 ~ 1,
                                     TRUE ~ 0.7)),
      value = list(dvalue * (insample + 1))
    )

  # Calculate paths among neighbours for sampled sites
  full_paths <- path(sites, sampled_ids, d, cluster_size) |>
    dplyr::arrange(match(p0, sampled_ids)) # To match the order of sampling


  # Creates routes
  n_routes <- n_samples/cluster_size
  routes <- sites[0,]
  for(r in seq_len(n_routes)) {
    rts <- full_paths |>
      dplyr::filter(dplyr::if_all(
        dplyr::matches("^p\\d"),
        \(x) !x %in% dplyr::pull(routes, {{ site_id }}))) |>
      dplyr::slice_max(.data[["mean_value"]], n = 1, with_ties = FALSE) |>
      dplyr::mutate(origin = .data[["p0"]], lineid = dplyr::row_number()) |>
      dplyr::select(-matches("^value")) |>
      tidyr::pivot_longer(cols = matches("^p\\d"),
                          values_to = as_name(enquo(site_id)),
                          names_to = "linepoint") |>
      dplyr::left_join(sites, by = dplyr::join_by({{ site_id }})) |>
      sf::st_as_sf() |>
      dplyr::group_by(dplyr::pick("origin", "lineid")) |>
      dplyr::arrange({{ site_id }}) |>
      dplyr::mutate(route = .env[["r"]])
    routes <- dplyr::bind_rows(routes, rts)
  }

  routes
}


path <- function(sites, sampled_ids, d, cluster_size) {

  d0 <- sf::st_drop_geometry(d) |>
    dplyr::select(focal = focal_siteid, p = neigh_id, value) |>
    tidyr::unnest(c(p, value))

  paths <- dplyr::rename(d0, "p0" = "focal", "p1" = "p", "value1" = "value") |>
    dplyr::filter(p0 %in% sampled_ids)

  n <- c(0, 0)
  while(n[2] < (cluster_size - 1)) {
    n <- next_paths(paths)
    paths <- add_path(d0, paths, n)
  }

  paths <- paths |>
    dplyr::mutate(
      total_value = rowSums(dplyr::select(paths, dplyr::starts_with("value"))),
      mean_value = rowMeans(dplyr::select(paths, dplyr::starts_with("value")))
    )
#
#   test <- dplyr::filter(paths, p0 == "41152_160") |>
#     dplyr::arrange(dplyr::pick(dplyr::starts_with("p")))
#
#   waldo::compare(test, dplyr::ungroup(t), ignore_attr = TRUE)
  paths
}

next_paths <- function(paths) {
  current <- stringr::str_extract(names(paths), "(?<=p)\\d{1,2}") |>
    as.numeric() |>
    max(na.rm = TRUE)

  c(current, current + 1)
}

add_path <- function(d0, paths, n) {
  p <- paste0("p", n)
  p_old <- stringr::str_subset(names(paths), "^p\\d{1,2}")

  paths <- paths |>
    dplyr::left_join(
      dplyr::rename_with(d0, \(x) paste0(x, n[2]), .cols = c("p", "value")),
      by = set_names("focal", p[1]),
      relationship = "many-to-many") |>
    dplyr::filter(!dplyr::if_any(dplyr::all_of(p_old), \(x) x == .data[[p[2]]]))

  paths <- paths |>
    dplyr::mutate(
      running_value = rowSums(dplyr::select(paths, dplyr::starts_with("value")))) |>
    dplyr::slice_max(running_value, with_ties = TRUE, by = "p0")
}
