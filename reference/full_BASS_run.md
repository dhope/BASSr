# A full BASS run

A full BASS run

## Usage

``` r
full_BASS_run(
  land_hex,
  num_runs,
  n_samples,
  costs = NULL,
  hex_id = hex_id,
  stratum_id = NULL,
  omit_flag = NULL,
  non_random_set = NULL,
  benefit_weight = 0.5,
  land_cover_weights = NULL,
  return_grts = FALSE,
  crs = 4326,
  coords = c("lon", "lat"),
  seed = NULL,
  quiet = FALSE,
  ...
)
```

## Arguments

- land_hex:

  (Spatial) Data frame. Land Cover data by hexagon. If non-spatial, will
  be converted to spatial sf data frame using the `crs` and `coords`
  arguments. Requires columns identifying the Hex ID as well as the
  Stratum ID (see `hex_id` and `stratum_id` respectively).

- num_runs:

  Numeric. Number of times to draw random samples.

- n_samples:

  Numeric. Number of samples to draw in each run.

- costs:

  Data frame. Costs for each hexagon in a RawCost format.

- hex_id:

  Column. Identifies hexagon IDs (e.g., default `hex_id`).

- stratum_id:

  Column. Identifies larger area (e.g., `StudyAreaID` or `Province`).

- omit_flag:

  Column identifying hexes to omit (e.g., water hexes).

- non_random_set:

  Character vector. `hex_id`s of hexagons to include as a non randomly
  selected set.

- benefit_weight:

  Numeric. Weight assigned to benefit in the selection probabilities.
  0.5 is equal weighting of cost and benefits. 1.0 is zero weighting to
  cost. Default 0.5.

- land_cover_weights:

  Data frame. Proportional weights (`weights` column) for specific types
  of landcover (`lc` column). `lc` should correspond to the same
  landcover column names as the hex data.

- return_grts:

  Logical. Return the `spsurvey` object(s).

- crs:

  Numeric, character, or sf/sfc. Coordinate reference system. Must be
  valid input to
  [`sf::st_crs()`](https://r-spatial.github.io/sf/reference/st_crs.html).

- coords:

  Character vector. Names of the columns containing X and Y coordinates
  (default `c("lon", "lat")`).

- seed:

  Numeric. Random seed to use for random sampling. Seed only applies to
  specific sampling events (does not change seed in the environment).
  `NULL` does not set a seed.

- quiet:

  Logical. Whether to suppress progress messages.

- ...:

  Extra named arguments passed on to
  [`spsurvey::grts()`](https://usepa.github.io/spsurvey/reference/grts.html).

## Value

Data frame of inclusion probabilities. Or, if `return_grts = TRUE` a
list including the data frame of inclusion probabilities as well as the
`spsurvey` grts sampling object.

## Extra arguments

Extra named arguments for
[`spsurvey::grts()`](https://usepa.github.io/spsurvey/reference/grts.html)
can also be passed on via `...`. In particular, note that the default
values for `mindis` (minimum distance between sites) is `NULL`, and
`maxtry` (maximum attempts to try to obtain the minimum distance between
sites) is 10.

## Examples

``` r
# With example data psu_hexagons and psu_costs...

d <- full_BASS_run(
  land_hex = psu_hexagons,
  num_runs = 10,
  n_samples = 3,
  costs = psu_costs)
#> ℹ Spatial object land_hex should be POINTs not POLYGONs
#> • Don't worry, I'll fix it!
#> • Assuming constant attributes and using centroids as points
#> ℹ Finished GRTS draw of 10 runs and 3 samples

# Omit water hexes

d <- full_BASS_run(
  land_hex = psu_hexagons,
  num_runs = 10,
  n_samples = 3,
  costs = psu_costs,
  omit_flag = water)
#> ℹ Spatial object land_hex should be POINTs not POLYGONs
#> • Don't worry, I'll fix it!
#> • Assuming constant attributes and using centroids as points
#> ℹ Finished GRTS draw of 10 runs and 3 samples

# Keep grts objects

d <- full_BASS_run(
  land_hex = psu_hexagons,
  num_runs = 10,
  n_samples = 3,
  costs = psu_costs,
  return_grts = TRUE)
#> ℹ Spatial object land_hex should be POINTs not POLYGONs
#> • Don't worry, I'll fix it!
#> • Assuming constant attributes and using centroids as points
#> ℹ Finished GRTS draw of 10 runs and 3 samples

names(d)
#> [1] "inclusion_probs" "grts_output"    
d[["inclusion_probs"]]
#> Simple feature collection with 33 features and 11 fields
#> Geometry type: POINT
#> Dimension:     XY
#> Bounding box:  xmin: 25 ymin: 43.30127 xmax: 275 ymax: 259.8076
#> Projected CRS: NAD83 / Ontario MNR Lambert
#> # A tibble: 33 × 12
#>    hex_id  RawCost benefit       geometry LogCost ScLogCost scale_ben
#>  * <glue>    <dbl>   <dbl>    <POINT [m]>   <dbl>     <dbl>     <dbl>
#>  1 SA_09    1.73e9  0.0307  (25 43.30127)    9.24     0.888     0.513
#>  2 SA_10    1.59e9  0.0356  (25 129.9038)    9.20     0.885     0.594
#>  3 SA_11    1.77e9  0.0323  (25 216.5064)    9.25     0.889     0.538
#>  4 SA_14    1.67e9  0.0297  (50 86.60254)    9.22     0.887     0.495
#>  5 SA_15    1.52e9  0.0221  (50 173.2051)    9.18     0.883     0.369
#>  6 SA_16    2.00e9  0.0274  (50 259.8076)    9.30     0.894     0.458
#>  7 SA_17    2.18e9  0.0259  (75 43.30127)    9.34     0.898     0.431
#>  8 SA_18    2.24e9  0.0367  (75 129.9038)    9.35     0.899     0.613
#>  9 SA_19    1.69e9  0.0289  (75 216.5064)    9.23     0.887     0.482
#> 10 SA_22    1.71e9  0.0374 (100 86.60254)    9.23     0.888     0.623
#> # ℹ 23 more rows
#> # ℹ 5 more variables: partIP <dbl>, weightedIP <dbl>, inclpr <dbl>,
#> #   num_runs <dbl>, n_samples <dbl>
d[["grts_output"]][[1]]
#> Summary of Site Counts: 
#> 
#>    total   siteuse 
#>  total:3   Base:3  

# Change spsurvey::grts() arguments

d <- full_BASS_run(
  land_hex = psu_hexagons,
  num_runs = 10,
  n_samples = 3,
  costs = psu_costs,
  mindis = 10, maxtry = 10)
#> ℹ Spatial object land_hex should be POINTs not POLYGONs
#> • Don't worry, I'll fix it!
#> • Assuming constant attributes and using centroids as points
#> ℹ Finished GRTS draw of 10 runs and 3 samples

d
#> Simple feature collection with 33 features and 11 fields
#> Geometry type: POINT
#> Dimension:     XY
#> Bounding box:  xmin: 25 ymin: 43.30127 xmax: 275 ymax: 259.8076
#> Projected CRS: NAD83 / Ontario MNR Lambert
#> # A tibble: 33 × 12
#>    hex_id  RawCost benefit       geometry LogCost ScLogCost scale_ben
#>  * <glue>    <dbl>   <dbl>    <POINT [m]>   <dbl>     <dbl>     <dbl>
#>  1 SA_09    1.73e9  0.0298  (25 43.30127)    9.24     0.888     0.535
#>  2 SA_10    1.59e9  0.0321  (25 129.9038)    9.20     0.885     0.575
#>  3 SA_11    1.77e9  0.0304  (25 216.5064)    9.25     0.889     0.544
#>  4 SA_14    1.67e9  0.0307  (50 86.60254)    9.22     0.887     0.550
#>  5 SA_15    1.52e9  0.0266  (50 173.2051)    9.18     0.883     0.477
#>  6 SA_16    2.00e9  0.0351  (50 259.8076)    9.30     0.894     0.630
#>  7 SA_17    2.18e9  0.0303  (75 43.30127)    9.34     0.898     0.543
#>  8 SA_18    2.24e9  0.0368  (75 129.9038)    9.35     0.899     0.659
#>  9 SA_19    1.69e9  0.0275  (75 216.5064)    9.23     0.887     0.493
#> 10 SA_22    1.71e9  0.0373 (100 86.60254)    9.23     0.888     0.669
#> # ℹ 23 more rows
#> # ℹ 5 more variables: partIP <dbl>, weightedIP <dbl>, inclpr <dbl>,
#> #   num_runs <dbl>, n_samples <dbl>
```
