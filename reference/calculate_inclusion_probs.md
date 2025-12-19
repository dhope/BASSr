# BASS cost benefit calculation

Calculate the cost-benefits and inclusion probabilities.

## Usage

``` r
calculate_inclusion_probs(
  benefits,
  costs,
  hex_id = hex_id,
  stratum_id = NULL,
  omit_flag = NULL,
  benefit_weight = 0.5
)
```

## Arguments

- benefits:

  Spatial Data frame. Benefits associated with each hexagon (output of
  `calculate_benefits()`).

- costs:

  Data frame. Costs for each hexagon in a RawCost format.

- hex_id:

  Column. Identifies hexagon IDs (e.g., default `hex_id`).

- stratum_id:

  Column. Identifies larger area (e.g., `StudyAreaID` or `Province`).

- omit_flag:

  Column identifying hexes to omit (e.g., water hexes).

- benefit_weight:

  Numeric. Weight assigned to benefit in the selection probabilities.
  0.5 is equal weighting of cost and benefits. 1.0 is zero weighting to
  cost. Default 0.5.

## Value

A data frame with full inclusion probabilities for each hex.

## Examples

``` r
b <- calculate_benefit(land_hex = psu_hexagons,
                       samples = psu_samples)
#> ℹ Spatial object land_hex should be POINTs not POLYGONs
#> • Don't worry, I'll fix it!
#> • Assuming constant attributes and using centroids as points

inc <- calculate_inclusion_probs(
  benefits = b,
  costs = psu_costs)

# Omit water hexes (identified by column `water`)

inc <- calculate_inclusion_probs(
  benefits = b,
  costs = psu_costs,
  omit_flag = water)
```
