

test_that("select_sites() - Clusters", {
  sites <- psu_hexagons |>
    dplyr::slice_sample(n = 7) |>
    create_sites(spacing = 5) |>
    dplyr::mutate(scaled_benefit = 1, benefit = 0.95)

  # Basic clusters
  expect_message({
    s <- select_sites(sites = sites, hex_id = hex_id, site_id = site_id,
                      type = "cluster", os = 0.75, n_samples = 7, cluster_size = 5,
                      ARUonly = FALSE, seed = 1234, useGRTS = TRUE,
                      min_dist = 25, min_dist_cluster = 9)
  }, "projected points") |>
    suppressMessages()

  expect_s3_class(s, "sf")

  # Samples per cluster - 7 samples * 1.75 (75% oversample) with 5 per cluster
  expect_equal(dplyr::n_distinct(s$cluster), round((7 * 1.75) / 5))
  # Total samples - 7 hexes * 5 clusters * samples per cluster
  expect_equal(nrow(s), 7 * 5 * round((7 * 1.75) / 5))

  expect_equal(sum(s$aru == "ARU"), 7 * 2 * 2) # 7 hexes * 2 clusters/hex, 2 ARUs/cluster
  expect_equal(dplyr::select(s, hex_id, site_id, geometry, scaled_benefit, benefit) |>
                 dplyr::arrange(site_id),
               dplyr::select(sites, hex_id, site_id, geometry, scaled_benefit, benefit) |>
                 dplyr::filter(site_id %in% s$site_id))

  # # Visual check
  # library(ggplot2)
  # ggplot() +
  #   geom_sf(data = psu_hexagons) +                   # Hex grid
  #   geom_sf(data = sites, alpha = 0.4) +      # Sites on selected Hex grids
  #   geom_sf(data = s, aes(colour = aru)) + # Selected sites
  #   scale_colour_viridis_d() +
  #   labs(title = "Clusters",
  #        subtitle = "os = 1.0; n_samples = 5; cluster_size = 5, ARUonly = FALSE, min_dist = 30; min_dist_cluster = 9;\nsite spacing = 5")

  # Non-GRTS clusters
  # sites <- select_sites(sites = s, hex_id = hex_id, site_id = site_id,
  #                       type = "Cluster", os = 1.0, n_samples = 5, cluster_size = 5,
  #                       ARUonly = FALSE, seed = 1234, useGRTS = FALSE,
  #                       min_dist = 15, min_dist_cluster = 9)
})

test_that("select_sites() - Random", {
  sites <- psu_hexagons |>
    dplyr::slice_sample(n = 7) |>
    create_sites(spacing = 5) |>
    dplyr::mutate(scaled_benefit = 1, benefit = 0.95)

  expect_silent({
    s <- select_sites(sites = sites, hex_id = hex_id, site_id = site_id,
                      type = "random", os = 1.0, n_samples = 2,
                      ARUonly = FALSE, seed = 1234, min_dist = 10)
  })

  expect_s3_class(s, "sf")
  expect_equal(nrow(s), 7 * 2 * 2) # 7 hexes * 2/hex * 2 (100% oversample)
  expect_equal(sum(s$aru == "ARU"), 0) # ARUonly = FALSE
  expect_equal(dplyr::select(s, hex_id, site_id, geometry) |>
                 dplyr::arrange(site_id),
               dplyr::select(sites, hex_id, site_id, geometry) |>
                 dplyr::filter(site_id %in% s$site_id))

  # # Visual inspection
  # library(ggplot2)
  # ggplot() +
  #   geom_sf(data = psu_hexagons) +                   # Hex grid
  #   geom_sf(data = sites, alpha = 0.4) +      # Sites on selected Hex grids
  #   geom_sf(data = s, aes(colour = siteuse)) + # Selected sites
  #   scale_colour_viridis_d() +
  #   labs(title = "Random",
  #        subtitle = "os = 1.0; n_samples = 2; ARUonly = FALSE, min_dist = 10;\nsite spacing = 5")

})

test_that("select_sites() - Shortest Path", {
  sites <- psu_hexagons |>
    dplyr::filter(hex_id %in% c("SA_43", "SA_48", "SA_51")) |>
    create_sites(spacing = 5) |>
    dplyr::mutate(scaled_benefit = 1)

  expect_silent({
    s <- select_sites(sites = sites, hex_id = hex_id, site_id = site_id,
                      type = "path", n_samples = 8, cluster_size = 4,
                      ARUonly = FALSE, seed = 1234, useGRTS = TRUE,
                      min_dist = 10, progress = FALSE)
  })

  expect_equal(nrow(s$routes), 8 * 3) # 8 samples, 3 hexes
  expect_equal(dplyr::n_distinct(s$routes$route), 8/4)
  expect_equal(dplyr::arrange(s$routes, hex_id, site_id) |> dplyr::select(hex_id, site_id, geometry, scaled_benefit),
               dplyr::filter(sites, site_id %in% s$routes$site_id),
               list_as_map = TRUE, ignore_attr = TRUE)

  # # Visual inspection
  # library(ggplot2)
  # ggplot() +
  #   geom_sf(data = sites, alpha = 0.4) + # Sites on selected Hex grid
  #   geom_sf(data = s$routes, aes(colour = factor(route)), size = 4) + # Selected sites
  #   scale_colour_viridis_d() +
  #   labs(title = "Shortest Paths",
  #        subtitle = "n_samples = 4; min_dist = 10; site spacing = 5; cluster_size = 2")
})


test_that("select_sites() - Shortest Path", {
  skip_on_ci()


  p1 <- test_path("../../../BASSr - Extra/2022_Peawanuck_SSU_w_ben.rds")
  p2 <- test_path("../../misc/shortest_path_eg_raw.rds")
  skip_if_not(file.exists(p1))
  skip_if_not(file.exists(p2))

  sites <- readRds(p1) |> sf::st_set_geometry("geometry")
  orig <- readRds(p2) |> purrr::list_transpose()

  expect_warning(
    s1 <- select_sites(dplyr::filter(sites, SW_ID == 41152), type = "path",
                       hex_id = SW_ID, site_id = COMP_ID, min_dist = 300,
                       n_samples = 18, cluster_size = 6, seed = 6554)
  )

  expect_snapshot_value(s1$sampled, style = "json2")
  expect_snapshot_value(s1$routes, style = "json2")

  # skip("No longer comparable because of moving the seed location")
  # expect_equal(s1$sampled, orig$sampled[[1]], ignore_attr = TRUE, list_as_map = TRUE)
  # expect_equal(dplyr::arrange(s1$routes, COMP_ID), dplyr::arrange(orig$routes[[1]], COMP_ID),
  #              list_as_map = TRUE, ignore_attr = TRUE)

  # # Visual inspection
  # library(ggplot2)
  # ggplot() +
  #   geom_sf(data = dplyr::filter(sites, SW_ID == 41152), alpha = 0.4) + # Sites on selected Hex grid
  #   geom_sf(data = s1$routes, aes(colour = factor(route)), size = 5) + # Selected sites
  #   scale_colour_viridis_d() +
  #   labs(title = "Shortest Paths",
  #        subtitle = "n_samples = 18; min_dist = 300; site spacing = 300; cluster_size = 6")
  #

  h <- 1:2
  for(h in list(c(1:2), c(1:5))) {
    hexes <- unique(sites$SW_ID)[h]
    expect_warning(
      s2 <- select_sites(dplyr::filter(sites, SW_ID %in% hexes), type = "path",
                         hex_id = SW_ID, site_id = COMP_ID,
                         n_samples = 18, cluster_size = 6, min_dist = 300,
                         seed = 6554, progress = FALSE)
    )

    expect_snapshot_value(s2$sampled, style = "json2")
    expect_snapshot_value(s2$routes, style = "json2")
    # skip("No longer comparable because of moving the seed location")
    # expect_equal(s2$sampled, purrr::list_rbind(orig$sampled[h]), ignore_attr = TRUE, list_as_map = TRUE)
    # expect_equal(dplyr::arrange(s2$routes, COMP_ID),
    #              purrr::list_rbind(orig$routes[h]) |> dplyr::arrange(COMP_ID),
    #              list_as_map = TRUE, ignore_attr = TRUE)
  }


})


