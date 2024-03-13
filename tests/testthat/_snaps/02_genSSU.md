# create_sites()

    Code
      s1
    Output
      Simple feature collection with 91 features and 2 fields
      Geometry type: POINT
      Dimension:     XY
      Bounding box:  xmin: 3.349365 ymin: 18.30127 xmax: 46.65064 ymax: 68.30127
      Projected CRS: +proj=lcc +lat_0=0 +lon_0=-85 +lat_1=44.5 +lat_2=53.5 +x_0=930000 +y_0=6430000 +datum=NAD83 +units=m +no_defs
      # A tibble: 91 x 3
                    geometry hex_id ssuID
       *         <POINT [m]> <glue> <int>
       1       (25 18.30127) SA_09      1
       2 (29.33013 20.80127) SA_09      2
       3 (33.66025 23.30127) SA_09      3
       4 (37.99038 25.80127) SA_09      4
       5 (42.32051 28.30127) SA_09      5
       6 (46.65064 30.80127) SA_09      6
       7 (20.66987 20.80127) SA_09      7
       8       (25 23.30127) SA_09      8
       9 (29.33013 25.80127) SA_09      9
      10 (33.66025 28.30127) SA_09     10
      # i 81 more rows

---

    Code
      s2
    Output
      Simple feature collection with 3003 features and 3 fields
      Geometry type: POINT
      Dimension:     XY
      Bounding box:  xmin: 3.349365 ymin: 18.30127 xmax: 296.6506 ymax: 284.8076
      Projected CRS: +proj=lcc +lat_0=0 +lon_0=-85 +lat_1=44.5 +lat_2=53.5 +x_0=930000 +y_0=6430000 +datum=NAD83 +units=m +no_defs
      # A tibble: 3,003 x 4
                    geometry hex_id ssuID province
       *         <POINT [m]> <glue> <int> <chr>   
       1       (25 18.30127) SA_09      1 ON      
       2 (29.33013 20.80127) SA_09      2 ON      
       3 (33.66025 23.30127) SA_09      3 ON      
       4 (37.99038 25.80127) SA_09      4 ON      
       5 (42.32051 28.30127) SA_09      5 ON      
       6 (46.65064 30.80127) SA_09      6 ON      
       7 (20.66987 20.80127) SA_09      7 ON      
       8       (25 23.30127) SA_09      8 ON      
       9 (29.33013 25.80127) SA_09      9 ON      
      10 (33.66025 28.30127) SA_09     10 ON      
      # i 2,993 more rows

