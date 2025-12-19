# Run grts sampling on BASSr results

Sample sites based on the cost/benefit probabilities calculated in
previous steps. Sites can be sampled with or without stratification.

## Usage

``` r
run_grts_on_BASS(
  probs,
  nARUs,
  os = NULL,
  num_runs = 1,
  hex_id = NULL,
  stratum_id = NULL,
  remove_hexes = NULL,
  selection_weighting = inclpr,
  seed = NULL,
  ...
)
```

## Arguments

- probs:

  Data frame. Output of
  [`calculate_inclusion_probs()`](https://davidhope.ca/BASSr/reference/calculate_inclusion_probs.md)
  or
  [`full_BASS_run()`](https://davidhope.ca/BASSr/reference/full_BASS_run.md).

- nARUs:

  Numeric, Data frame, Vector, or List. Number of base samples to
  choose. For stratification, a named vector/list of samples per
  stratum, or a data frame with columns `n` for samples, `n_os` for
  oversamples and the column matching `stratum_id`.

- os:

  Numeric, Vector, or List. Over sample size (proportional) or named
  vector/list of number of samples per stratum. Ignored if `nARUs` is a
  data frame.

- num_runs:

  Numeric. Number of times to draw random samples.

- hex_id:

  Column. Identifies hexagon IDs (e.g., default `hex_id`).

- stratum_id:

  Column. Identifies larger area (e.g., `StudyAreaID` or `Province`).

- remove_hexes:

  Character Vector. Ids of hexagons to remove prior to sampling.

- selection_weighting:

  Column. Identifies selection weightings used by the `aux_var` argument
  in
  [`spsurvey::grts()`](https://usepa.github.io/spsurvey/reference/grts.html).
  Default is `inclpr`.

- seed:

  Numeric. Random seed to use for random sampling. Seed only applies to
  specific sampling events (does not change seed in the environment).
  `NULL` does not set a seed.

- ...:

  Extra named arguments passed on to
  [`spsurvey::grts()`](https://usepa.github.io/spsurvey/reference/grts.html).

## Value

If `num_runs` is 1, a single `spsurvey` object, otherwise a list of
`spsurvey` objects.

## Extra arguments

Extra named arguments for
[`spsurvey::grts()`](https://usepa.github.io/spsurvey/reference/grts.html)
can also be passed on via `...`. In particular, note that the default
values for `mindis` (minimum distance between sites) is `NULL`, and
`maxtry` (maximum attempts to try to obtain the minimum distance between
sites) is 10.

## Examples

``` r
d <- full_BASS_run(
  land_hex = psu_hexagons,
  num_runs = 10,
  n_samples = 3,
  costs = psu_costs)
#> ℹ Spatial object land_hex should be POINTs not POLYGONs
#> • Don't worry, I'll fix it!
#> • Assuming constant attributes and using centroids as points
#> ℹ Finished GRTS draw of 10 runs and 3 samples

# Simple selection
sel <- run_grts_on_BASS(
  probs = d,
  nARUs = 5,
  os = 0.2)

# Stratify
d <- dplyr::mutate(d, Province = c(rep("ON", 16), rep("MB", 17))) # Add Strata

# With lists...
sel <- run_grts_on_BASS(
  probs = d,
  nARUs = list("ON" = 5, "MB" = 2),
  stratum_id = Province,
  os = 0.2)

# With data frame...
sel <- run_grts_on_BASS(
  probs = d,
  nARUs = data.frame(Province = c("ON", "MB"),
                     n = c(5, 2),
                     n_os = c(1, 1)),
  stratum_id = Province)
```
