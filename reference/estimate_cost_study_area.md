# Cost model estimate

Cost model estimate

## Usage

``` r
estimate_cost_study_area(
  narus,
  StudyAreas,
  pr,
  sr,
  wr = 0,
  dist_base_sa,
  dist_airport_sa,
  dist2airport_base,
  AirportType,
  vars
)
```

## Arguments

- narus:

  The number of ARUs to deploy in the study area

- StudyAreas:

  Tibble with study area information and distances

- pr:

  Column with primary road buffer proportion of study area

- sr:

  Column with secondary Road proportion of study area ( should not
  include primary road area)

- wr:

  Column with Winter Road proportion of study area ( should not include
  primary or secondary road areas)

- dist_base_sa:

  Column with distance between basecamp and study area

- dist_airport_sa:

  Column with distance between airport and study area

- dist2airport_base:

  Column with distance between airport and base camp

- AirportType:

  Column with nearest airport type

- vars:

  List containing parameters for cost estimation

## Value

data frame
