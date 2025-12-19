# Draw random sample

Draw random sample

## Usage

``` r
draw_random_samples(
  land_hex,
  num_runs,
  n_samples,
  use_grts = TRUE,
  crs = 4326,
  coords = c("lon", "lat"),
  return_grts = FALSE,
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

- use_grts:

  Logical. Whether to use
  [`spsurvey::grts()`](https://usepa.github.io/spsurvey/reference/grts.html)
  or just sample randomly without spatial dispersion.

- crs:

  Numeric, character, or sf/sfc. Coordinate reference system. Must be
  valid input to
  [`sf::st_crs()`](https://r-spatial.github.io/sf/reference/st_crs.html).

- coords:

  Character vector. Names of the columns containing X and Y coordinates
  (default `c("lon", "lat")`).

- return_grts:

  Logical. Return the `spsurvey` object(s).

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

Spatial data frame of samples

## Examples

``` r
draw_random_samples(psu_hexagons, num_runs = 1, n_samples = 10)
#> ℹ Spatial object land_hex should be POINTs not POLYGONs
#> • Don't worry, I'll fix it!
#> • Assuming constant attributes and using centroids as points
#> ℹ Finished GRTS draw of 1 runs and 10 samples
#> Simple feature collection with 10 features and 21 fields
#> Geometry type: POINT
#> Dimension:     XY
#> Bounding box:  xmin: 50 ymin: 43.30127 xmax: 275 ymax: 259.8076
#> Projected CRS: NAD83 / Ontario MNR Lambert
#>       siteID siteuse replsite lon_WGS84 lat_WGS84 stratum wgt        ip caty
#> 1  sample-01    Base     None -88.90970 -31.97499    None 3.3 0.3030303 None
#> 2  sample-02    Base     None -88.90989 -31.97531    None 3.3 0.3030303 None
#> 3  sample-03    Base     None -88.91044 -31.97487    None 3.3 0.3030303 None
#> 4  sample-04    Base     None -88.91040 -31.97549    None 3.3 0.3030303 None
#> 5  sample-05    Base     None -88.90966 -31.97561    None 3.3 0.3030303 None
#> 6  sample-06    Base     None -88.91052 -31.97534    None 3.3 0.3030303 None
#> 7  sample-07    Base     None -88.91012 -31.97501    None 3.3 0.3030303 None
#> 8  sample-08    Base     None -88.91063 -31.97519    None 3.3 0.3030303 None
#> 9  sample-09    Base     None -88.91008 -31.97563    None 3.3 0.3030303 None
#> 10 sample-10    Base     None -88.91061 -31.97550    None 3.3 0.3030303 None
#>    hex_id province water             LC1            LC2            LC3
#> 1   SA_51       ON  TRUE 201350.91 [m^2] 389711.4 [m^2] 569411.7 [m^2]
#> 2   SA_42       ON FALSE 233826.86 [m^2] 326924.6 [m^2] 389711.4 [m^2]
#> 3   SA_24       ON FALSE 255477.49 [m^2] 268467.9 [m^2] 478479.0 [m^2]
#> 4   SA_22       ON FALSE 359400.54 [m^2] 171040.0 [m^2] 476314.0 [m^2]
#> 5   SA_49       ON  TRUE 173205.08 [m^2] 201350.9 [m^2] 446003.1 [m^2]
#> 6   SA_18       ON  TRUE 132068.87 [m^2] 467653.7 [m^2] 671169.7 [m^2]
#> 7   SA_35       ON FALSE 246817.24 [m^2] 235991.9 [m^2] 506624.9 [m^2]
#> 8   SA_15       ON  TRUE 177535.21 [m^2] 335584.8 [m^2] 686325.1 [m^2]
#> 9   SA_33       ON FALSE 212176.22 [m^2] 300943.8 [m^2] 673334.8 [m^2]
#> 10  SA_14       ON FALSE  19485.57 [m^2] 565081.6 [m^2] 710140.8 [m^2]
#>                LC4             LC5           LC6             geometry run
#> 1   887676.0 [m^2]  803238.6 [m^2] 2074131 [m^2] POINT (275 216.5064)   1
#> 2  1680089.3 [m^2]  664674.5 [m^2] 1688750 [m^2] POINT (225 129.9038)   1
#> 3   885511.0 [m^2] 1242746.5 [m^2] 1857624 [m^2] POINT (100 259.8076)   1
#> 4   904996.5 [m^2] 1115007.7 [m^2] 1961548 [m^2] POINT (100 86.60254)   1
#> 5   861695.3 [m^2] 1203775.3 [m^2] 2037325 [m^2] POINT (275 43.30127)   1
#> 6   926647.2 [m^2] 1054385.9 [m^2] 1732051 [m^2]  POINT (75 129.9038)   1
#> 7  1095522.1 [m^2] 1149648.7 [m^2] 1753701 [m^2] POINT (175 216.5064)   1
#> 8   911491.7 [m^2]  664674.5 [m^2] 2212695 [m^2]  POINT (50 173.2051)   1
#> 9   781587.9 [m^2]  959123.1 [m^2] 2061140 [m^2] POINT (175 43.30127)   1
#> 10  902831.5 [m^2]  772927.7 [m^2] 2017839 [m^2]  POINT (50 86.60254)   1
#>    num_runs n_samples
#> 1         1        10
#> 2         1        10
#> 3         1        10
#> 4         1        10
#> 5         1        10
#> 6         1        10
#> 7         1        10
#> 8         1        10
#> 9         1        10
#> 10        1        10
```
