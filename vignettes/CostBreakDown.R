## ----setup, include=T, warning=F, message=F-----------------------------------
knitr::opts_chunk$set(
  eval=T,
  collapse = TRUE,
  message =F, warning =F,
  fig.width = 8,
  fig.height = 8,
  comment = "#>"
)
library(tidyverse)
library(sf)
library(spsurvey)
library(glue)
library(BASSr)
library(raster)
library(rlang)
library(patchwork)


bcv <- BASSr::cost_vars



