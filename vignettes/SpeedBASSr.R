## ----setup--------------------------------------------------------------------

library(BASSr)

?speedbass

## -----------------------------------------------------------------------------

n_land_covers <- 15
study_area_size <- 1E6
samplesize <- 10

hex_equal <- rep(study_area_size/1000/n_land_covers,n_land_covers)

samples_equal <-  rep(study_area_size/1000*samplesize/n_land_covers, n_land_covers) 

total_equal <- rep(study_area_size/n_land_covers, n_land_covers)
cat("sample plus hex \t total \t sample\t difference\t desired direction\tincluded\n")
ex1 <- speedbass(hex = hex_equal, sample = samples_equal, total = total_equal, printDets = T)



## -----------------------------------------------------------------------------
sprintf(" The land cover percent for the sample will be %s", 
        study_area_size/1000*samplesize/n_land_covers / sum(samples_equal) )

sprintf(" The land cover percent for all land cover types in the hexagon will be %s", 
        study_area_size/1000/n_land_covers / sum(hex_equal) )

sprintf(" The land cover percent for the total study area for each land cover type will be %s", 
        study_area_size/n_land_covers / sum(total_equal) )



## -----------------------------------------------------------------------------

samples_unequal <- c(0,rep(study_area_size/1000*(samplesize-1)/n_land_covers, n_land_covers-1) )
cat("sample plus hex \t total \t sample\t difference\t desired direction\tincluded\n")
ex2 <- speedbass(hex = hex_equal, sample = samples_unequal, total = total_equal, printDets = T)


## -----------------------------------------------------------------------------
samples_random <- sample(1:3000, n_land_covers, replace = T)
ss <- samples_random  / sum(samples_random) * sum(samples_equal) 

cat("sample plus hex \t total \t sample\t difference\t desired direction\tincluded\n")
ex3 <- speedbass(hex = hex_equal, sample = ss, total = total_equal, printDets = T)



## -----------------------------------------------------------------------------
n_land_covers <- 1

hex_equal <- rep(study_area_size/1000/n_land_covers,n_land_covers)

samples_equal <-  rep(study_area_size/1000*samplesize/n_land_covers, n_land_covers) 

total_equal <- rep(study_area_size/n_land_covers, n_land_covers)
cat("sample plus hex \t total \t sample\t difference\t desired direction\tincluded\n")
ex4 <- speedbass(hex = hex_equal, sample = samples_equal, total = total_equal, printDets = T)

ex4


