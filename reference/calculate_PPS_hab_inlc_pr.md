# Calculate Propbability Proportional to Size (PPS) inclusion probabilities

See for more information:
https://www150.statcan.gc.ca/n1/en/pub/12-001-x/2011001/article/11450-eng.pdf?st=0oyBln55
or
https://en.wikipedia.org/wiki/Probability-proportional-to-size_sampling

## Usage

``` r
calculate_PPS_hab_inlc_pr(
  land_hex,
  hex_id = hex_id,
  stratum_id = NULL,
  quiet = FALSE
)
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

tibble with selection weights from PPS

## Examples

``` r
 calculate_PPS_hab_inlc_pr(land_hex = psu_hexagons)
#> ℹ Spatial object land_hex should be POINTs not POLYGONs
#> • Don't worry, I'll fix it!
#> • Assuming constant attributes and using centroids as points
#> Simple feature collection with 33 features and 10 fields
#> Geometry type: POINT
#> Dimension:     XY
#> Bounding box:  xmin: 25 ymin: 43.30127 xmax: 275 ymax: 259.8076
#> Projected CRS: NAD83 / Ontario MNR Lambert
#> First 10 features:
#>    hex_id province water             LC1            LC2            LC3
#> 1   SA_09       ON FALSE  15155.44 [m^2] 549926.1 [m^2] 634363.6 [m^2]
#> 2   SA_10       ON FALSE  73612.16 [m^2] 400536.7 [m^2] 452498.3 [m^2]
#> 3   SA_11       ON FALSE 171040.02 [m^2] 309604.1 [m^2] 277128.1 [m^2]
#> 4   SA_14       ON FALSE  19485.57 [m^2] 565081.6 [m^2] 710140.8 [m^2]
#> 5   SA_15       ON  TRUE 177535.21 [m^2] 335584.8 [m^2] 686325.1 [m^2]
#> 6   SA_16       ON FALSE 173205.08 [m^2] 339915.0 [m^2] 911491.7 [m^2]
#> 7   SA_17       ON  TRUE 121243.56 [m^2] 443838.0 [m^2] 770762.6 [m^2]
#> 8   SA_18       ON  TRUE 132068.87 [m^2] 467653.7 [m^2] 671169.7 [m^2]
#> 9   SA_19       ON  TRUE 173205.08 [m^2] 290118.5 [m^2] 387546.4 [m^2]
#> 10  SA_22       ON FALSE 359400.54 [m^2] 171040.0 [m^2] 476314.0 [m^2]
#>                LC4             LC5           LC6 p_sel_PPS_hab
#> 1   751277.0 [m^2]  941802.6 [m^2] 2030830 [m^2]     0.1710617
#> 2  1162639.1 [m^2]  952627.9 [m^2] 1877110 [m^2]     0.1688158
#> 3  1091192.0 [m^2]  792413.2 [m^2] 2284142 [m^2]     0.1662089
#> 4   902831.5 [m^2]  772927.7 [m^2] 2017839 [m^2]     0.1766716
#> 5   911491.7 [m^2]  664674.5 [m^2] 2212695 [m^2]     0.1813016
#> 6   632198.5 [m^2]  835714.5 [m^2] 2095781 [m^2]     0.1880288
#> 7   731791.5 [m^2]  762102.4 [m^2] 2158568 [m^2]     0.1826062
#> 8   926647.2 [m^2] 1054385.9 [m^2] 1732051 [m^2]     0.1900891
#> 9  1145318.6 [m^2]  872520.6 [m^2] 2119597 [m^2]     0.1727177
#> 10  904996.5 [m^2] 1115007.7 [m^2] 1961548 [m^2]     0.1958207
#>                geometry
#> 1   POINT (25 43.30127)
#> 2   POINT (25 129.9038)
#> 3   POINT (25 216.5064)
#> 4   POINT (50 86.60254)
#> 5   POINT (50 173.2051)
#> 6   POINT (50 259.8076)
#> 7   POINT (75 43.30127)
#> 8   POINT (75 129.9038)
#> 9   POINT (75 216.5064)
#> 10 POINT (100 86.60254)
```
