# Extract Habitat and Cost

Extract Habitat and Cost

## Arguments

- number_iterations:

  Number of iterations to draw samples from full GRTS

- n_samples_per_iter:

  Number of samples to pull per iteration

- sample_hexes:

  Sample hexagon file

- study_area_hexes:

  Study area hexagon files

- id:

  Id of the study area of interest

- id_col:

  Column identifying study area

- hab_rast_location:

  Location of raster for habitat

- shape_file_list:

  named list of shapefiles used in cost calculation. The current
  iteration must include the following names:

  primary_roads

  :   sf polygon with primary roads buffer

  secondary_roads

  :   sf polygon with atv roads buffer

  winter_roads

  :   sf polygon with winter roads buffer

  total_roads

  :   sf polygon with all roads buffer

  airport_locations

  :   sf points with airport locations

  camp_locations

  :   sf points with camp locations

- return_all\_:

  Logical to return a full results or just the inclusion probabilities

- nARUs:

  number of ARUs to deploy

- hexid_col:

  hexagon identification column

- calc_cost:

  Logical - calculate cost

- calc_hab:

  Logical - calculate habitat

- write_hexes:

  Logical - write hexagons

- load_hexes:

  Logical load hexagons

- rds.loc:

  RDS location

- sa.rast.loc:

  Study area location

- quick:

  Run using cpp
