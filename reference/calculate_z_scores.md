# Calculate z-scores for each hexagon by sum of individual z scores

Calculate z-scores for each hexagon by sum of individual z scores

## Usage

``` r
calculate_z_scores(land_hex, hex_id, stratum_id = NULL, quiet = FALSE)
```

## Arguments

- land_hex:

  (Spatial) Data frame. Land Cover data by hexagon. If non-spatial, will
  be converted to spatial sf data frame using the `crs` and `coords`
  arguments. Requires columns identifying the Hex ID as well as the
  Stratum ID (see `hex_id` and `stratum_id` respectively).

- hex_id:

  Column. Identifies hexagon IDs (e.g., default `hex_id`).

- stratum_id:

  Column. Identifies larger area (e.g., `StudyAreaID` or `Province`).

- quiet:

  Logical. Whether to suppress progress messages.

## Value

data frame

## Examples

``` r
calculate_z_scores(psu_hexagons, hex_id)
#> ℹ Spatial object land_hex should be POINTs not POLYGONs
#> • Don't worry, I'll fix it!
#> • Assuming constant attributes and using centroids as points
#> # A tibble: 33 × 3
#>    hex_id avg_abs_diff avg_z_score
#>    <glue>        <dbl>       <dbl>
#>  1 SA_09       115886.    -0.0907 
#>  2 SA_10       103092.    -0.187  
#>  3 SA_11       151740.    -0.138  
#>  4 SA_14       131041.    -0.00750
#>  5 SA_15       113327.     0.0536 
#>  6 SA_16       149411.     0.117  
#>  7 SA_17       157743.     0.0766 
#>  8 SA_18       113021.     0.0437 
#>  9 SA_19       104470.    -0.0762 
#> 10 SA_22       109150.     0.110  
#> # ℹ 23 more rows
```
