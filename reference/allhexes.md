# Run speed bass on all hexagons and all samples

Run speed bass on all hexagons and all samples

## Usage

``` r
allhexes(hexes, samples, total, w, printDets = FALSE)
```

## Arguments

- hexes:

  Matrix of hexagon land covers. Rows are hexagons, columns are land
  cover types

- samples:

  Matrix of hexagon land covers from random sample. Rows are hexagons,
  columns are land cover types

- total:

  Vector of total land cover. values are individual land cover types

- w:

  A vector of weights for each land cover value

- printDets:

  print details of function calculation. For debugging.
