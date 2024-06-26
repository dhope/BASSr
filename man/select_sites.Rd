% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/select_sites.R
\name{select_sites}
\alias{select_sites}
\title{Select sites for sampling}
\usage{
select_sites(
  sites,
  type,
  n_samples,
  min_dist,
  cluster_size = NULL,
  min_dist_cluster = NULL,
  os = NULL,
  hex_id = hex_id,
  site_id = site_id,
  ARUonly = FALSE,
  useGRTS = TRUE,
  progress = TRUE,
  seed = NULL
)
}
\arguments{
\item{sites}{Spatial Data frame. Site points created in \code{create_sites()}.
Requires columns identifying the Hex ID as well as the Site ID (see
\code{hex_id} and \code{site_id} respectively).}

\item{type}{String. Method to select sites. Must be one of
\itemize{
\item "cluster" - Clustered sampling. Sample a single point, then \code{cluster_size}
samples around that point.
\item "path" - Shortest Path sampling. Sample a single point, then \code{cluster_size}
samples in a path from that point.
\item "Random" - Random sampling. Sample a random set of points.
}}

\item{n_samples}{Numeric. Number of samples to draw for each hex.}

\item{min_dist}{Numeric. Minimum distance between points, or if Clusters,
between cluster centres.}

\item{cluster_size}{Integer. For \emph{Clusters}, number of points per cluster.
For \emph{Shortest Paths}, number of points per path. Only applies to Clusters
and Paths.}

\item{min_dist_cluster}{Numeric. Minimum distance between ARU samples within
clusters. Only applies to Clusters.}

\item{os}{Numeric. Over sample size (proportional). Only applies to Clusters
and Random.}

\item{hex_id}{Column. Identifies hexagon IDs (e.g., default \code{hex_id}).}

\item{site_id}{Column. Identifies site IDs (default \code{site_id}).}

\item{ARUonly}{Logical. Return only ARU locations. If \code{FALSE} Clusters return
point count locations as well. Only applies to Clusters and Random
sampling.}

\item{useGRTS}{Logical. Should the program be run using GRTS? Only applies to
Clusters or Random samples.}

\item{progress}{Logical. Show progress bars if applicable.}

\item{seed}{Numeric. Random seed to use for random sampling. Seed only
applies to specific sampling events (does not change seed in the
environment). \code{NULL} does not set a seed.}
}
\value{
\itemize{
\item If Clustered, returns a data frame of clustered points selected from sites.
\item If Random, returns a data frame of sampled points selected from sites.
\item If Shortest Path, returns a list of the points on the path and the original points selected to create the path.
}
}
\description{
Selection methods for processing site selection using GRTS, random sampling,
clustering, or shortest path methods.
}
\examples{
library(dplyr)
library(ggplot2)

sites <- psu_hexagons |>
    slice_sample(n = 7) |>
    create_sites(spacing = 5) |>
    mutate(scaled_benefit = 1, benefit = 0.95)

# Basic clusters
s <- select_sites(sites = sites, hex_id = hex_id, site_id = site_id,
                  type = "cluster", os = 0.75, n_samples = 7, cluster_size = 5,
                  ARUonly = FALSE, seed = 1234, useGRTS = TRUE,
                  min_dist = 25, min_dist_cluster = 9)
ggplot() +
  geom_sf(data = psu_hexagons) +                   # Hex grid
  geom_sf(data = sites, alpha = 0.4) +      # Sites on selected Hex grids
  geom_sf(data = s, aes(colour = aru)) + # Selected sites
  scale_colour_viridis_d()

# Random samples

s <- select_sites(sites = sites, hex_id = hex_id, site_id = site_id,
                  type = "random", os = 1.0, n_samples = 2,
                  ARUonly = FALSE, seed = 1234, min_dist = 10)

ggplot() +
  geom_sf(data = psu_hexagons) +                   # Hex grid
  geom_sf(data = sites, alpha = 0.4) +      # Sites on selected Hex grids
  geom_sf(data = s, aes(colour = siteuse)) + # Selected sites
  scale_colour_viridis_d()

# Shortest Path

s <- select_sites(sites = sites, hex_id = hex_id, site_id = site_id,
                  type = "path", n_samples = 8, cluster_size = 4,
                  ARUonly = FALSE, seed = 1234, useGRTS = TRUE,
                  min_dist = 10, progress = FALSE)

ggplot() +
  geom_sf(data = sites, alpha = 0.4) + # Sites on selected Hex grid
  geom_sf(data = s$routes, aes(colour = factor(route))) + # Selected sites
  scale_colour_viridis_d()
}
