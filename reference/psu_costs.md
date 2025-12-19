# Dummy costs data

Dummy costs data

## Usage

``` r
psu_costs
```

## Format

A data frame with 33 rows and 27 columns

- hex_id:

  ID of the hex

- province:

  Province code for that hex

- water:

  Whether that hex is in water or not

- area:

  Area of the hex in m2

- pr - total_heli_cost:

  Specific costs for each hex (see ?`estimate_cost_study_area`)

- narus:

  Number of ARUs to be deployed

- RawCost:

  Total raw cost of sampling this hex

## Source

Data generated in data-raw/data_create_study_area.R
