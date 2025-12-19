# Clean land cover habitat data

This is a general function to clean land cover columns.

## Usage

``` r
clean_land_cover(land_raw, pattern = "CLC15_", append = "", quiet = FALSE)
```

## Arguments

- land_raw:

  (Spatial) data frame. Land Cover data to be cleaned.

- pattern:

  Character. Pattern to match and replace with 'LC'

- append:

  Character. Text to append to end of land cover code

- quiet:

  Logical. Whether to suppress progress messages.

## Value

(Spatial) Data frame with cleaned land cover column names.

## Examples

``` r
psu_hex_clean <- clean_land_cover(psu_hex_dirty, pattern = "CLC0013_")
#> ℹ Renaming land cover columns
#> • From: CLC0013_1, CLC0013_2, CLC0013_3, CLC0013_4, CLC0013_5, CLC0013_6
#> • To: LC01, LC02, LC03, LC04, LC05, LC06
```
