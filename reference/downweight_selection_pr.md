# Adjust selection weighting

Adjust selection weighting

## Usage

``` r
downweight_selection_pr(
  sample_locs,
  scalingFactor,
  sigma_value,
  selection_column = NULL,
  fun = "cauchy",
  existing_sampling = NULL,
  dmat = NULL
)
```

## Arguments

- sample_locs:

  sf object with the selection weighting column (polygons or points)

- scalingFactor:

  scaling factor to downweight

- sigma_value:

  sigma value of distribution effect for existing sampling. Larger value
  means sampling has wider effect

- selection_column:

  Column with sampling weights to be adjusted. If null return only the
  weights.

- fun:

  Type of decay function. Current options are 'cauchy', 'normal' or
  'exp'

- existing_sampling:

  exisint sampling to down weight around (points)

- dmat:

  distance matrix from sample locations (rows) to existing sampling
  (columns)

## Value

data.frame sample_locs with downweights and adjusted selection
probabilities included. If selection column is null return a vector of
the downweights alone.

## Examples

``` r
# downweight_selection_pr(BASSr::all_study_areas[1:10,], BASSr::all_study_areas[20:30,], scalingFactor = 0.1, sigma_value = 1e5, fun = 'cauchy', selection_column = NULL)
```
