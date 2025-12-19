# Create Hexagonal grid

Function that takes a landscape as an sf object and returns a hexagonal
grid of a given size. Allowed inputs are hectres ('ha'), metres squared
('m2'), metres or kilometres ('m', or 'km') as the diameter of each
hexagon

## Usage

``` r
create_hexes(
  land,
  hex_size,
  units = NULL,
  hex_prefix = "SA_",
  linear_type = "short_diagonal"
)
```

## Arguments

- land:

  sf Spatial. Area over which to create hexagonal grid. Must be have a
  valid CRS. If lat/lon (i.e. CRS 4326) will be projected to 3347 to
  ensure proper units.

- hex_size:

  Numeric or Units. Size of hexagon in area or diagonal diameter. Can be
  a bear number (see `units`) or a `units` object with units embedded.
  See details for specifics.

- units:

  Character. Units of `hex_size` in `"m"`, `"m2"`, `"km"`, `"km2"`, or
  `"ha"`. Ignored if `hex_size` is a `units` object.

- hex_prefix:

  Character. Text to prefix to hexagon IDs. Default "SA\_" results in
  hexagon ids of "SA_01", etc.

- linear_type:

  Character. Type of diameter to use when specifying linear hexagonal
  grid sizes. One of `"short_diagonal"` (default; for the short diameter
  from side to side, or centroid to centroid), or `"long_diagonal"` (for
  the long diameter from vertex to vertex passing through the centre of
  the hex).

## Value

Returns a sf polygon layer of hexagons with unique IDs

## Details

If `hex_size` is provided as a units object (i.e.,
`units::set_units(100, km^2)`) then the units can be any area or length
unit recognized by the `units` package and convertible to `m` or `m2`.
Otherwise, if using a bare number in `hex_size` and providing the units
as a character in `units`, they must be one of `"m"`, `"m2"`, `"km"`,
`"km2"`, or `"ha"`.

For example, `hex_size = units::set_units(100, ft)` will work, but
`hex_size = 100, units = "ft"` will not.

## Examples

``` r
library(sf)
#> Linking to GEOS 3.12.1, GDAL 3.8.4, PROJ 9.4.0; sf_use_s2() is TRUE
library(ggplot2)
plot <- st_polygon(list(cbind(c(-90,-90,-85,-85,-90),
                              c(50,55,55,50,50)))) |>
  st_sfc(crs = 4326) |>
  st_transform(3347)

ggplot() +
  geom_sf(data = plot, fill = "white")


# Create grid by area - 1000km2
grid <- create_hexes(plot, hex_size = 1000, units = "km2")

# Check the area
st_area(grid[1,]) |>
  units::set_units("km2")
#> 1000 [km^2]

# Check the visual
ggplot() +
  geom_sf(data = plot, fill = "white") +
  geom_sf(data = grid, fill = NA)


# Create grid by diameter - 33.98088 km from side to side
grid2 <- create_hexes(plot, hex_size = 33.98088, units = "km")

# Check the area - Hah! A hexagon with the diameter of 33.98088 km has an area of ~1,000km
st_area(grid2[1,]) |>
  units::set_units("km2")
#> 999.9997 [km^2]

# Check the visual - Identical
ggplot() +
  geom_sf(data = plot, fill = "white") +
  geom_sf(data = grid2, fill = NA)


# Diameter of a 1000 km2 hexagon is
area_km2 <- 1000
(sqrt(2 * area_km2 / (3 * sqrt(3)))) * sqrt(3)
#> [1] 33.98088

# Create grid by hectare
grid <- create_hexes(plot, hex_size = 40000, units = "ha")
ggplot() +
  geom_sf(data = plot, fill = "white") +
  geom_sf(data = grid, fill = NA)


# Create grid with pre-set units
area <- units::set_units(1000, "km2", mode = "character")
grid <- create_hexes(plot, hex_size = area)
ggplot() +
  geom_sf(data = plot, fill = "white") +
  geom_sf(data = grid, fill = NA)
```
