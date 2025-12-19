# Calculate the benefit of a hexagon from grts results.

Calculate the benefit of a hexagon from grts results.

## Usage

``` r
calculate_benefit(
  land_hex,
  samples,
  hex_id = hex_id,
  stratum_id = NULL,
  non_random_set = NULL,
  land_cover_weights = NULL,
  crs = 4326,
  coords = c("lon", "lat"),
  quiet = FALSE
)
```

## Arguments

- land_hex:

  (Spatial) Data frame. Land Cover data by hexagon. If non-spatial, will
  be converted to spatial sf data frame using the `crs` and `coords`
  arguments. Requires columns identifying the Hex ID as well as the
  Stratum ID (see `hex_id` and `stratum_id` respectively).

- samples:

  (Spatial) Data frame. Results from
  [`draw_random_samples()`](https://davidhope.ca/BASSr/reference/draw_random_samples.md).

- hex_id:

  Column. Identifies hexagon IDs (e.g., default `hex_id`).

- stratum_id:

  Column. Identifies larger area (e.g., `StudyAreaID` or `Province`).

- non_random_set:

  Character vector. `hex_id`s of hexagons to include as a non randomly
  selected set.

- land_cover_weights:

  Data frame. Proportional weights (`weights` column) for specific types
  of landcover (`lc` column). `lc` should correspond to the same
  landcover column names as the hex data.

- crs:

  Numeric, character, or sf/sfc. Coordinate reference system. Must be
  valid input to
  [`sf::st_crs()`](https://r-spatial.github.io/sf/reference/st_crs.html).

- coords:

  Character vector. Names of the columns containing X and Y coordinates
  (default `c("lon", "lat")`).

- quiet:

  Logical. Whether to suppress progress messages.

## Value

Spatial data frame with benefits per hex

## Examples

``` r
# Using example data psu_hexagons and psu_samples

calculate_benefit(
  land_hex = psu_hexagons,
  samples = psu_samples,
  non_random_set = c("SA_09", "SA_22", "SA_47"))
#> ℹ Spatial object land_hex should be POINTs not POLYGONs
#> • Don't worry, I'll fix it!
#> • Assuming constant attributes and using centroids as points
#> Simple feature collection with 33 features and 2 fields
#> Geometry type: POINT
#> Dimension:     XY
#> Bounding box:  xmin: 25 ymin: 43.30127 xmax: 275 ymax: 259.8076
#> Projected CRS: NAD83 / Ontario MNR Lambert
#> First 10 features:
#>    hex_id     benefit             geometry
#> 1   SA_09 0.011928502  POINT (25 43.30127)
#> 2   SA_10 0.019759576  POINT (25 129.9038)
#> 3   SA_11 0.018844331  POINT (25 216.5064)
#> 4   SA_14 0.014763746  POINT (50 86.60254)
#> 5   SA_15 0.010130728  POINT (50 173.2051)
#> 6   SA_16 0.009821685  POINT (50 259.8076)
#> 7   SA_17 0.011240254  POINT (75 43.30127)
#> 8   SA_18 0.016422632  POINT (75 129.9038)
#> 9   SA_19 0.016226578  POINT (75 216.5064)
#> 10  SA_22 0.012322357 POINT (100 86.60254)

# Specify a non-random set

calculate_benefit(
 land_hex = psu_hexagons,
 samples = psu_samples,
 non_random_set = c("SA_09", "SA_22", "SA_47"))
#> ℹ Spatial object land_hex should be POINTs not POLYGONs
#> • Don't worry, I'll fix it!
#> • Assuming constant attributes and using centroids as points
#> Simple feature collection with 33 features and 2 fields
#> Geometry type: POINT
#> Dimension:     XY
#> Bounding box:  xmin: 25 ymin: 43.30127 xmax: 275 ymax: 259.8076
#> Projected CRS: NAD83 / Ontario MNR Lambert
#> First 10 features:
#>    hex_id     benefit             geometry
#> 1   SA_09 0.011928502  POINT (25 43.30127)
#> 2   SA_10 0.019759576  POINT (25 129.9038)
#> 3   SA_11 0.018844331  POINT (25 216.5064)
#> 4   SA_14 0.014763746  POINT (50 86.60254)
#> 5   SA_15 0.010130728  POINT (50 173.2051)
#> 6   SA_16 0.009821685  POINT (50 259.8076)
#> 7   SA_17 0.011240254  POINT (75 43.30127)
#> 8   SA_18 0.016422632  POINT (75 129.9038)
#> 9   SA_19 0.016226578  POINT (75 216.5064)
#> 10  SA_22 0.012322357 POINT (100 86.60254)

# Without GRTS

non_grts_samples <- draw_random_samples(
  land_hex = psu_hexagons,
  num_runs = 3,
  n_samples = 10,
  use_grts = FALSE)
#> ℹ Spatial object land_hex should be POINTs not POLYGONs
#> • Don't worry, I'll fix it!
#> • Assuming constant attributes and using centroids as points

calculate_benefit(
 land_hex = psu_hexagons,
 samples = non_grts_samples)
#> ℹ Spatial object land_hex should be POINTs not POLYGONs
#> • Don't worry, I'll fix it!
#> • Assuming constant attributes and using centroids as points
#> Simple feature collection with 33 features and 2 fields
#> Geometry type: POINT
#> Dimension:     XY
#> Bounding box:  xmin: 25 ymin: 43.30127 xmax: 275 ymax: 259.8076
#> Projected CRS: NAD83 / Ontario MNR Lambert
#> First 10 features:
#>    hex_id     benefit             geometry
#> 1   SA_09 0.008367774  POINT (25 43.30127)
#> 2   SA_10 0.010510586  POINT (25 129.9038)
#> 3   SA_11 0.007752895  POINT (25 216.5064)
#> 4   SA_14 0.006910977  POINT (50 86.60254)
#> 5   SA_15 0.001677754  POINT (50 173.2051)
#> 6   SA_16 0.004713814  POINT (50 259.8076)
#> 7   SA_17 0.005191574  POINT (75 43.30127)
#> 8   SA_18 0.012027388  POINT (75 129.9038)
#> 9   SA_19 0.006278050  POINT (75 216.5064)
#> 10  SA_22 0.010723963 POINT (100 86.60254)


```
