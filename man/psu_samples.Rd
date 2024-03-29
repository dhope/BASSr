% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{psu_samples}
\alias{psu_samples}
\title{Dummy sampled hexes}
\format{
A spatial data frame with 30 features and 21 fields
\describe{
\item{siteID-caty}{Sampling output (see \code{spsurvey::grts()})}
\item{hex_id}{ID of the hex}
\item{province}{Province code for that hex}
\item{water}{Whether that hex is in water or not}
\item{LC...}{Land cover columns}
\item{x}{Geometry}
\item{run}{Run number}
\item{num_runs}{Total number of runs performed}
\item{n_samples}{Total number of samples drawn in a run}
}
}
\source{
Data generated in data-raw/data_create_study_area.R
}
\usage{
psu_samples
}
\description{
Dummy sampled hexes
}
\keyword{datasets}
