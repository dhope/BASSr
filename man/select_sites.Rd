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

\item{site_id}{Column. Identifies site IDs (default \code{site_id}).}

\item{ARUonly}{Logical. Return only ARU locations. If \code{FALSE} Clusters return
point count locations as well. Only applies to Clusters and Random
sampling.}

\item{useGRTS}{Logical. Should the program be run using GRTS? Only applies to
Clusters or Random samples.}

\item{progress}{Logical. Show progress bars if applicable.}
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