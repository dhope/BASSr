# Full BASSr run with sample selection

Running this function will run BASS on both study areas and sample units
within those study areas. It will return a selection of sample units
with associated costs and habitats.

## Arguments

- study_areas_hab_cost:

  A list of study area hexagons, costs, and habitat characteristics. See
  naming above.

- Number_of_Study_areas:

  Number of Study Areas to select

- Number_of_sample_units:

  Number of Sample Units to select

- Size_of_HSS:

  Size of they Hypothetical Sample Set

- Number_of_HSS:

  Number of iterations in the hypothetical sample set

- Weight_of_benfit:

  Weight of benefit in selection probabilties.

- LandCoverType:

  String with identifer for both the land cover hexagons and their code
  within that tibble

- RemovedLayers\_:

  Layers to remove from benefit calculation must be in format of
  c(-var1, -var2, -var3)

- Area_of_interest:

  Area of interest in tibble with StudyAreaID

- RandomSeed:

  Random seet to use in GRTS

- calculate_benefits:

  Should you calculate benefits or are they included in benefit_df

- only_calculate_benefits:

  Do you only want to calculate benefits or complete the full run

- benefit_dfs:

  If calculate_benefits is TRUE need some data.frames with benefits.

- returnALL:

  do you return the GRTS object, as well as the selection probs. (Can be
  used later to calculate spatial balance)

- oversample:

  Proportion of sites to oversample, used for both study areas and
  sample units

- weighted_benefits_df:

  list of data frames with weight and land covers for benefit
  calculation

- Non:

  random set of study areas and sample units in form of named list.

## Value

List of sample units and a summary comparing land cover to the local
area
