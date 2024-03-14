test_that("check_units()", {

  expect_silent(u <- check_units(100, "m"))
  expect_equal(u, units::set_units(100, m))

  expect_silent(u <- check_units(units::set_units(100, m)))
  expect_equal(u, units::set_units(100, m))

  x <- \(x, y) check_units(x, y)
  expect_error(x(100, NULL), "No units specified")
  expect_error(x(100, "test"), "Incorrect units specified")
  expect_error(x(100, "kg"), "Incorrect units specified")

  expect_silent(check_units(units::set_units(100, ft)))
  expect_error(check_units(100, "ft"), "Incorrect units specified")

})

test_that("create_hexes()", {

  # Hexagon - Geometry

  # area = (3 * sqrt(3))/2 * side^2
  # short diagonal = sqrt(3) * side
  # long diagonal = 2 * side
  # side = sqrt((2 * area) / (3 * sqrt(3)))
  #
  # area = 100
  # side = 6.204032
  # short diag = 10.7456993182354
  # long diag = 12.408064788028

  l <- sf::st_sfc(sf::st_polygon(list(cbind(c(0,10000,10000,0,0),c(0,0,10000,10000,0)))),
                  crs = 3347)

  # Area - m2
  expect_silent(g <- create_hexes(l, hex_size = 100000, units = "m2"))
  expect_s3_class(g, "sf")
  expect_equal(sf::st_area(g[1,]), units::set_units(100000, m^2))
  expect_named(g, c("hex_id", "geometry"))
  expect_equal(g$hex_id[c(1, 10, 100, 1000)], c("SA_0001", "SA_0010", "SA_0100", "SA_1000"))

  expect_silent(g1 <- create_hexes(l, hex_size = units::set_units(100000, m^2)))
  expect_equal(g, g1)

  # Area - km2
  expect_silent(g <- create_hexes(l, hex_size = 100, units = "km2"))
  expect_s3_class(g, "sf")
  expect_equal(units::set_units(sf::st_area(g[1,]), km^2), units::set_units(100, km^2))

  expect_silent(g1 <- create_hexes(l, hex_size = units::set_units(100, km^2)))
  expect_equal(g, g1)

  # Area - ha
  expect_silent(g <- create_hexes(l, hex_size = 10000, units = "ha"))
  expect_s3_class(g, "sf")
  expect_equal(units::set_units(sf::st_area(g[1,]), km^2), units::set_units(100, km^2))

  expect_silent(g1 <- create_hexes(l, hex_size = units::set_units(10000, ha)))
  expect_equal(g, g1)

  # Linear - short diagonal
  expect_silent(g <- create_hexes(l, hex_size = 1074.56993182354, units = "m"))
  expect_s3_class(g, "sf")
  expect_equal(sf::st_area(g[1,]), units::set_units(1000000, m^2))

  expect_silent(g1 <- create_hexes(l, hex_size = units::set_units(1074.56993182354, m)))
  expect_equal(g, g1)

  expect_silent(g <- create_hexes(l, hex_size = 10.7456993182354, units = "km"))
  expect_s3_class(g, "sf")
  expect_equal(units::set_units(sf::st_area(g[1,]), km^2), units::set_units(100, km^2))

  expect_silent(g1 <- create_hexes(l, hex_size = units::set_units(10.7456993182354, km)))
  expect_equal(g, g1)

  # Linear - long diagonal
  expect_silent(g <- create_hexes(l, hex_size = 1240.8064788028, units = "m",
                                       linear_type = "long_diagonal"))
  expect_s3_class(g, "sf")
  expect_equal(sf::st_area(g[1,]), units::set_units(1000000, m^2))

  expect_silent(g <- create_hexes(l, hex_size = 12.408064788028, units = "km",
                                       linear_type = "long_diagonal"))
  expect_s3_class(g, "sf")
  expect_equal(units::set_units(sf::st_area(g[1,]), km^2), units::set_units(100, km^2))

  # Other valid units
  expect_silent(g <- create_hexes(l, units::set_units(1076391041.6710, ft^2)))
  expect_equal(units::set_units(sf::st_area(g[1,]), km^2), units::set_units(100, km^2))

  # Params
  expect_silent(g <- create_hexes(l, 100, units = "km2", hex_prefix = "testing"))
  expect_equal(g$hex_id, c("testing1", "testing2", "testing3", "testing4"))

  # Errors
  l <- sf::st_sfc(sf::st_polygon(list(cbind(c(0,100,100,0,0),c(0,0,100,100,0)))))
  expect_error(create_hexes(l, hex_size = 1000, units = "km2"),
               "Landscape must be an sf/sfc object with a valid CRS")

  l <- sf::st_sfc(sf::st_polygon(list(cbind(c(-150,-150,-180,-180,-150),c(45,65,65,45,45)))),
                  crs = 4326)
  expect_warning(create_hexes(l, hex_size = 1000, units = "km2"),
               "Projecting `land` using CRS 3347")
})
