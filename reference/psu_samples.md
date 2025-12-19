# Dummy sampled hexes

Dummy sampled hexes

## Usage

``` r
psu_samples
```

## Format

A spatial data frame with 30 features and 21 fields

- siteID-caty:

  Sampling output (see
  [`spsurvey::grts()`](https://usepa.github.io/spsurvey/reference/grts.html))

- hex_id:

  ID of the hex

- province:

  Province code for that hex

- water:

  Whether that hex is in water or not

- LC...:

  Land cover columns

- x:

  Geometry

- run:

  Run number

- num_runs:

  Total number of runs performed

- n_samples:

  Total number of samples drawn in a run

## Source

Data generated in data-raw/data_create_study_area.R
