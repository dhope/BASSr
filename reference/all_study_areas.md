# All of Ontario's Study Areas

A simple features (package SF) object with all of Ontario's Study Areas
and the associated Land Cover

## Usage

``` r
all_study_areas
```

## Format

A data frame with 746 rows and 19 variables:

- StudyAreaID:

  Unique Identifier for each study area

- TOT_HA:

  Total hectares in study area

- D_CLC15:

  Dominant land cover in study area

- LC..:

  Hectares covered by landcover type (00-18)

- geometry:

  SF geometry

## Source

Hexagons generated in R, landcover extracted from National Land Cover
2015
(<https://open.canada.ca/data/en/dataset/4e615eae-b90c-420b-adee-2ca35896caf6>).
