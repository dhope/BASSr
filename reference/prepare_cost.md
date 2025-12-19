# Propare hexagons for cost calculations

Propare hexagons for cost calculations

## Usage

``` r
prepare_cost(
  truck_roads,
  atv_roads,
  winter_roads,
  all_roads,
  airports,
  basecamps,
  hexagons,
  idcol_,
  calc_roads = T,
  airport_cols = c("NAME", "AIRPORT_TY", "OGF_ID"),
  basecamp_cols = c("OFFICIAL_N", "OGF_ID", "CLASS_SUBT"),
  ...
)
```

## Arguments

- truck_roads:

  Primary roads (truck roads) buffer. Should be a polygon layer. Only
  used if calculating road estimates.

- atv_roads:

  Secondary (atv roads) buffer. Should be a polygon layer. Only used if
  calculating road estimates.

- winter_roads:

  Winter roads buffer. Should be a polygon layer. Not currently in use.

- all_roads:

  Total roads buffer. Should be polygon. Not currently in use.

- airports:

  Airport locations. Should be a polygon layer.

- basecamps:

  Basecamp locations. Should be a polygon layer.

- hexagons:

  Hexagon layer

- idcol\_:

  Column with hexagon ids

- calc_roads:

  Logical. Should you calculate roads or are they already included in
  hexagon layer

- airport_cols:

  Columns to use extract airport info. See examples. Should be length of
  3.

- basecamp_cols:

  Columns to use extract basecamp info. See examples. Should be length
  of 3.

- ...:

  You can include multisession with the furrr package. Needs to include
  Multicor=T & Cores = int

## Value

data frame

## Examples

``` r
if (FALSE) { # \dontrun{
prepare_cost(
  truck_roads = NA, atv_roads = NA, winter_roads = NA, all_roads = NA, airports = airports_official, basecamps = tourism, hexagons = study_area_hexagons_in_brandt %>%
    sf::left_join(road_info, by = c("StudyAreaID" = "StudyArea")), idcol_ = StudyAreaID, calc_roads = F, airport_cols = c("NAME", "AIRPORT_TY", "OGF_ID"),
  basecamp_cols = c("OFFICIAL_N", "OGF_ID", "CLASS_SUBT")
)
} # }
```
