nr <-  NLMR::nlm_randomcluster(
  ncol = 30,
  nrow = 30,
  p = 0.4,
  ai = c(0.05,0.1,0.15, 0.25, 0.25, 0.5),
  rescale = FALSE
)
raster::crs(nr) <- 3161

nr_classified <- landscapetools::util_classify(nr, weighting = rep(1/6, 6))
landscapetools::show_landscape(nr_classified)

sa1 <-
BASSr::create_study_area(nr, study_area_size = 5,
                         study_unit_size = .5, units = "m", output = 'large')

ssupoints <- generate_Points_around_centroid(sa1 |>
                                                      dplyr::rename(
                                                        geometry=x)
                                                    )
ssu_points <-
  purrr::map_df(1:nrow(sa1), ~ genSSU(sa1[.x,], spacing = .5, HexID_column = StudyAreaID) )

