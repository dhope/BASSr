library(BASSr)
nr <-  NLMR::nlm_randomcluster(
  ncol = 300,
  nrow = 300,
  p = 0.4,
  ai = c(0.05,0.1,0.15, 0.25, 0.25, 0.5),
  rescale = FALSE
)
raster::crs(nr) <- 3161
stars_nr <- stars::st_as_stars(nr)

# nr_classified <- landscapetools::util_classify(nr, weighting = rep(1/6, 6))
# landscapetools::show_landscape(nr_classified)
landscapetools::show_landscape(nr)

bbx <- st_bbox(nr) |> st_as_sfc()

sa1 <-
BASSr::create_study_area(nr, study_area_size = 50,
                         study_unit_size = .5, units = "m", output = 'large') |>
  st_filter(bbx,.predicate = st_covered_by)

# ssupoints <- generate_Points_around_centroid(sa1 |>
#                                                       dplyr::rename(
#                                                         geometry=x)
#                                                     )
ssu_points <-
  purrr::map_df(1:nrow(sa1), ~ genSSU(sa1[.x,], spacing = 5, HexID_column = StudyAreaID) )



library(ggplot2)
ggplot(ssu_points |> filter(StudyAreaID=="SA_0043")) +
  stars::geom_stars(data=st_crop(stars_nr,
                                 sa1[sa1$StudyAreaID=="SA_0043",])) +
  geom_sf(data = sa1[sa1$StudyAreaID=="SA_0043",], fill = NA)+
  geom_sf() + theme_void()

stars_df <- st_as_sf(stars_nr)

land_cover_PSU <- st_join( sa1, stars_df) %>%
  mutate(Area = st_area(.)) |>
  st_drop_geometry() |> group_by(StudyAreaID, clumps) |>
  summarise(Area = sum(Area), .groups = 'drop_last') |>
  mutate(HexArea = sum(Area)) |> ungroup() |>
  pivot_wider(names_from = clumps, values_from = Area, names_prefix = "LC")

PSU_for_bass <-
clean_forBass(land_cover_PSU, s = "LC", id_col = StudyAreaID, f_vec = land_cover_PSU$StudyAreaID)

weights_fnlc <- names(PSU_for_bass)[grepl("LC\\d+",names(PSU_for_bass))] %>%
  tibble(lc = ., weights = ifelse(.%in% c("LC01","LC02"), 0.25, 1))


Benefits_unstratified_fnlc  <-
  full_BASS_run(num_runs = 50,
                nsamples = 6,
                att.sp =  sa1 |> left_join(PSU_for_bass),
                att = PSU_for_bass,
                HexID_ = StudyAreaID,
                stratumID = Province,
                q = T,seed_ = 5648,
                non_ran_set = NULL,
                return_all = F,
                weighted_benefits = weights_fnlc,
                cost = NA_real_,
                noCost = T)


sel_pr <- calculate_inclusion_probs(hexagon_benefits = Benefits_unstratified_fnlc |>
                                      mutate(Province = "ON"), HexID = StudyAreaID,
                                    StratumID = Province, cost = sa1 %>%
                                      bind_cols(as_tibble(st_coordinates(st_centroid(.)))) |>
                                      mutate(cost =1, NEAR_DIST = 1000, INLAKE =F))

ggplot(left_join(sa1, Benefits_unstratified_fnlc)) +
  geom_sf(aes(fill = benefit))



GRTS_res <- run_grts_on_BASS(1, sel_pr, 6, 0.5,idcol = "Province", hexid = StudyAreaID,
                             Stratum = Province
                             )












