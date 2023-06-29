# 0.4.0

## Features
- Non-spatial data frames are converted with crs and coords
- Add option to set seeds within
- Fix/add arguments to run_grts_on_BASS
  - mindis and mastry are arguments
  - return list only if num_runs > 1
  - os can be a proportion, or vector or list of numbers
  - nARUs can be number, vector, list or data frame
- Fix use of omit_flag in `full_BASS_run()` and clarify docs
- Deprecated
  - `noGRTS_BASS_run()`
  - `subsample_grts_and_calc_benefit()`
  - `getresults_BASS()`
- Add NEW.md
