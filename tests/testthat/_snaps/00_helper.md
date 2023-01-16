# estimate_cost_study_area()

    {
      "type": "list",
      "attributes": {
        "names": {
          "type": "character",
          "attributes": {},
          "value": ["hex_id", "HexArea", "province", "X", "Y", "pr", "sr", "wr", "basecamps", "airportdist_km", "cabin_dist_to_air", "AirportType", "INLAKE", "AT", "lCost", "x", "primary_cost", "atv_cost", "heli_cost_per_l", "cost_base", "cost_to_SA", "cost_within_SA", "total_truck_cost", "total_atv_cost", "total_winter_cost", "p_heli", "total_heli_cost", "narus", "RawCost"]
        },
        "row.names": {
          "type": "integer",
          "attributes": {},
          "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33]
        },
        "class": {
          "type": "character",
          "attributes": {},
          "value": ["sf", "data.frame"]
        },
        "sf_column": {
          "type": "character",
          "attributes": {},
          "value": ["x"]
        },
        "agr": {
          "type": "integer",
          "attributes": {
            "names": {
              "type": "character",
              "attributes": {},
              "value": ["hex_id", "HexArea", "province", "X", "Y", "pr", "sr", "wr", "basecamps", "airportdist_km", "cabin_dist_to_air", "AirportType", "INLAKE", "AT", "lCost", "primary_cost", "atv_cost", "heli_cost_per_l", "cost_base", "cost_to_SA", "cost_within_SA", "total_truck_cost", "total_atv_cost", "total_winter_cost", "p_heli", "total_heli_cost", "narus", "RawCost"]
            },
            "levels": {
              "type": "character",
              "attributes": {},
              "value": ["constant", "aggregate", "identity"]
            },
            "class": {
              "type": "character",
              "attributes": {},
              "value": ["factor"]
            }
          },
          "value": ["NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA"]
        }
      },
      "value": [
        {
          "type": "character",
          "attributes": {
            "class": {
              "type": "character",
              "attributes": {},
              "value": ["glue", "character"]
            }
          },
          "value": ["SA_0009", "SA_0010", "SA_0011", "SA_0014", "SA_0015", "SA_0016", "SA_0017", "SA_0018", "SA_0019", "SA_0022", "SA_0023", "SA_0024", "SA_0025", "SA_0026", "SA_0027", "SA_0030", "SA_0031", "SA_0032", "SA_0033", "SA_0034", "SA_0035", "SA_0038", "SA_0039", "SA_0040", "SA_0041", "SA_0042", "SA_0043", "SA_0046", "SA_0047", "SA_0048", "SA_0049", "SA_0050", "SA_0051"]
        },
        {
          "type": "double",
          "attributes": {
            "units": {
              "type": "list",
              "attributes": {
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": ["numerator", "denominator"]
                },
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["symbolic_units"]
                }
              },
              "value": [
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["m", "m"]
                },
                {
                  "type": "character",
                  "attributes": {},
                  "value": []
                }
              ]
            },
            "class": {
              "type": "character",
              "attributes": {},
              "value": ["units"]
            }
          },
          "value": [4923354.42051454, 4919024.29349561, 4925519.48402399, 4988306.32579837, 4988306.32579837, 4988306.32579837, 4988306.32579837, 4983976.19877944, 4988306.32579837, 4988306.32579837, 4988306.32579837, 4988306.32579837, 4988306.32579837, 4983976.19877944, 4988306.32579837, 4988306.32579836, 4988306.32579837, 4988306.32579837, 4988306.32579837, 4983976.19877944, 4988306.32579836, 4988306.32579837, 4988306.32579836, 4988306.32579837, 4988306.32579837, 4983976.19877945, 4988306.32579837, 4988306.32579837, 4988306.32579837, 4988306.32579837, 4923354.42051453, 4919024.29349561, 4925519.48402399]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON"]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [25, 25, 25, 50, 50, 50, 75, 75, 75, 100, 100, 100, 125, 125, 125, 150, 150, 150, 175, 175, 175, 200, 200, 200, 225, 225, 225, 250, 250, 250, 275, 275, 275]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [43.30127019, 129.90381057, 216.50635095, 86.60254038, 173.20508076, 259.80762114, 43.30127019, 129.90381057, 216.50635095, 86.60254038, 173.20508076, 259.80762114, 43.30127019, 129.90381057, 216.50635095, 86.60254038, 173.20508076, 259.80762114, 43.30127019, 129.90381057, 216.50635095, 86.60254038, 173.20508076, 259.80762114, 43.30127019, 129.90381057, 216.50635095, 86.60254038, 173.20508076, 259.80762114, 43.30127019, 129.90381057, 216.50635095]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [503821.97340988, 2754995.30110085, 2700895.11113286, 2798646.85105951, 3865058.68839642, 2874658.89855687, 42630.96734919, 1043123.56829079, 2990366.84222686, 2308717.99927048, 3113861.24548951, 2446651.27779495, 1269325.55118395, 4142133.45611219, 1312344.85956968, 3759018.37063008, 1284992.47934727, 1197885.40626271, 838287.4255406, 1041667.56972864, 1421423.92012836, 1358934.53038931, 714033.16410741, 179560.70191527, 982295.2210332, 3636003.50300247, 2360106.35824555, 4106335.60387198, 3732303.38060233, 205484.48455463, 2020950.01454102, 1174013.71309855, 1350601.98502373]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [1992294.02079391, 302815.78033479, 1315804.5593611, 340275.98645073, 161605.2517821, 1602141.15705648, 3590170.49644597, 1904825.99197688, 969033.09696725, 680013.25682145, 855383.47282505, 673662.56648045, 1616507.23382477, 232544.81306419, 1540880.61995616, 178179.59812484, 2452903.04014939, 242853.13660853, 1130724.08736992, 2470220.05346509, 1547972.98036668, 478969.53885403, 1902571.92303695, 2128929.58736947, 2634594.66173143, 148378.13741485, 1806540.7828076, 331352.51167004, 31693.16984825, 1358805.56496169, 33138.30161737, 777576.53977788, 2177674.66997404]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [596133.46503142, 696359.6651889, 21498.82797234, 762481.40962483, 56222.45838301, 11317.27041491, 12530.79303296, 1204149.73408245, 47686.32140579, 779171.47551603, 199907.43349095, 95913.20675612, 514199.15372037, 74136.34658637, 1515822.97742238, 260625.2269485, 107186.86442609, 1659335.42193079, 494451.18307236, 874939.69532363, 592070.36246256, 824296.13811783, 299712.97905873, 1954568.2571033, 145192.85170942, 631374.97015978, 43284.26959648, 6815.97719724, 76383.88707223, 1496476.94699085, 713552.33612563, 66138.51912134, 280135.20736386]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [37.10598286, 1.77283635, 28.2538056, 14.01288881, 10.20981582, 6.68694493, 16.28409622, 7.75309848, 6.49810698, 21.77655299, 1.93213263, 35.66507815, 5.03845206, 47.51524692, 6.09088814, 10.98283104, 45.65438834, 47.29265606, 13.95781115, 6.17355439, 39.85802297, 37.21386075, 45.79871119, 49.72991225, 47.11803575, 24.30677038, 14.17297714, 12.57728506, 25.16275854, 24.84830866, 15.92229048, 48.11114134, 31.70496841]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [25.48667961, 84.60939876, 182.86338192, 93.55846667, 181.63382909, 119.54865674, 126.34856319, 173.83166375, 100.54996451, 196.72702295, 64.87720548, 96.2749897, 71.3974155, 125.49553681, 148.3200381, 113.19336346, 196.15730131, 115.36254711, 87.80841036, 45.719939, 16.43161313, 170.05298436, 46.93225231, 197.63348936, 120.37950917, 199.74816162, 75.11987532, 111.02532619, 85.88879257, 115.17555616, 86.50147947, 44.9691528, 16.99694754]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [127.45965193, 86.20327408, 14.54321872, 160.48040385, 65.05566067, 151.457807, 116.85430347, 141.76788135, 85.39515329, 68.71454041, 151.82399703, 84.80604161, 112.17745077, 23.22715488, 60.60435954, 95.76053717, 68.96610935, 120.14282802, 15.21666464, 191.19852223, 4.44136462, 168.34212649, 126.48848975, 62.01883303, 148.51387325, 127.78226272, 198.50319745, 25.65395767, 176.64791555, 162.01667758, 164.37023566, 166.94053249, 146.54644411]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["Remote", "Remote", "Remote", "Remote", "Highway", "Remote", "Remote", "Remote", "Highway", "Highway", "Highway", "Remote", "Remote", "Highway", "Highway", "Remote", "Remote", "Remote", "Remote", "Remote", "Highway", "Remote", "Highway", "Highway", "Highway", "Highway", "Highway", "Highway", "Remote", "Highway", "Remote", "Highway", "Remote"]
        },
        {
          "type": "logical",
          "attributes": {},
          "value": [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["Remote", "Remote", "Remote", "Remote", "Highway", "Remote", "Remote", "Remote", "Highway", "Highway", "Highway", "Remote", "Remote", "Highway", "Highway", "Remote", "Remote", "Remote", "Remote", "Remote", "Highway", "Remote", "Highway", "Highway", "Highway", "Highway", "Highway", "Highway", "Remote", "Highway", "Remote", "Highway", "Remote"]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [2, 2, 2, 2, 1.3, 2, 2, 2, 1.3, 1.3, 1.3, 2, 2, 1.3, 1.3, 2, 2, 2, 2, 2, 1.3, 2, 1.3, 1.3, 1.3, 1.3, 1.3, 1.3, 2, 1.3, 2, 1.3, 2]
        },
        {
          "type": "list",
          "attributes": {
            "class": {
              "type": "character",
              "attributes": {},
              "value": ["sfc_POINT", "sfc"]
            },
            "precision": {
              "type": "double",
              "attributes": {},
              "value": [0]
            },
            "crs": {
              "type": "list",
              "attributes": {
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": ["input", "wkt"]
                },
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["crs"]
                }
              },
              "value": [
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["+proj=lcc +lat_0=0 +lon_0=-85 +lat_1=44.5 +lat_2=53.5 +x_0=930000 +y_0=6430000 +datum=NAD83 +units=m +no_defs"]
                },
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["PROJCRS[\"unknown\",\n    BASEGEOGCRS[\"unknown\",\n        DATUM[\"North American Datum 1983\",\n            ELLIPSOID[\"GRS 1980\",6378137,298.257222101,\n                LENGTHUNIT[\"metre\",1]],\n            ID[\"EPSG\",6269]],\n        PRIMEM[\"Greenwich\",0,\n            ANGLEUNIT[\"degree\",0.0174532925199433],\n            ID[\"EPSG\",8901]]],\n    CONVERSION[\"unknown\",\n        METHOD[\"Lambert Conic Conformal (2SP)\",\n            ID[\"EPSG\",9802]],\n        PARAMETER[\"Latitude of false origin\",0,\n            ANGLEUNIT[\"degree\",0.0174532925199433],\n            ID[\"EPSG\",8821]],\n        PARAMETER[\"Longitude of false origin\",-85,\n            ANGLEUNIT[\"degree\",0.0174532925199433],\n            ID[\"EPSG\",8822]],\n        PARAMETER[\"Latitude of 1st standard parallel\",44.5,\n            ANGLEUNIT[\"degree\",0.0174532925199433],\n            ID[\"EPSG\",8823]],\n        PARAMETER[\"Latitude of 2nd standard parallel\",53.5,\n            ANGLEUNIT[\"degree\",0.0174532925199433],\n            ID[\"EPSG\",8824]],\n        PARAMETER[\"Easting at false origin\",930000,\n            LENGTHUNIT[\"metre\",1],\n            ID[\"EPSG\",8826]],\n        PARAMETER[\"Northing at false origin\",6430000,\n            LENGTHUNIT[\"metre\",1],\n            ID[\"EPSG\",8827]]],\n    CS[Cartesian,2],\n        AXIS[\"(E)\",east,\n            ORDER[1],\n            LENGTHUNIT[\"metre\",1,\n                ID[\"EPSG\",9001]]],\n        AXIS[\"(N)\",north,\n            ORDER[2],\n            LENGTHUNIT[\"metre\",1,\n                ID[\"EPSG\",9001]]]]"]
                }
              ]
            },
            "n_empty": {
              "type": "integer",
              "attributes": {},
              "value": [0]
            },
            "bbox": {
              "type": "double",
              "attributes": {
                "names": {
                  "type": "character",
                  "attributes": {},
                  "value": ["xmin", "ymin", "xmax", "ymax"]
                },
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["bbox"]
                }
              },
              "value": [25, 43.30127019, 275, 259.80762114]
            }
          },
          "value": [
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 43.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 129.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 216.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 86.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 173.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 259.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [75, 43.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [75, 129.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [75, 216.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [100, 86.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [100, 173.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [100, 259.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [125, 43.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [125, 129.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [125, 216.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [150, 86.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [150, 173.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [150, 259.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [175, 43.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [175, 129.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [175, 216.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [200, 86.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [200, 173.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [200, 259.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [225, 43.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [225, 129.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [225, 216.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [250, 86.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [250, 173.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [250, 259.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [275, 43.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [275, 129.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [275, 216.50635095]
            }
          ]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [360, 360, 360, 360, 360, 360, 360, 360, 360, 360, 360, 360, 360, 360, 360, 360, 360, 360, 360, 360, 360, 360, 360, 360, 360, 360, 360, 360, 360, 360, 360, 360, 360]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [600, 600, 600, 600, 600, 600, 600, 600, 600, 600, 600, 600, 600, 600, 600, 600, 600, 600, 600, 600, 600, 600, 600, 600, 600, 600, 600, 600, 600, 600, 600, 600, 600]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [2, 2, 5, 2, 5, 2, 2, 5, 1.3, 5, 1.3, 2, 2, 1.3, 1.3, 2, 5, 2, 2, 2, 1.3, 5, 1.3, 5, 1.3, 5, 1.3, 1.3, 2, 1.3, 2, 1.3, 2]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0, 0, 260.16202385, 0, 1163.77348533, 0, 0, 2536.06987739, 0, 1229.22677836, 0, 0, 0, 0, 0, 0, 1233.7270673, 0, 0, 0, 0, 3011.45359604, 0, 1109.44801309, 0, 2285.88269981, 0, 0, 0, 0, 0, 0, 0]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [444.6009665, 1475.96395611, 643.55890539, 1632.07547409, 232.55691593, 2085.45990099, 2204.08049121, 176.59835419, 1628.90942512, 496.02148471, 1051.0107288, 1679.46370928, 1245.4882482, 2033.02769635, 2402.78461729, 1974.59534042, 1039.90551225, 2012.43554395, 1531.76893624, 797.55893597, 266.19213265, 847.64905053, 760.30248743, 1132.73689016, 1950.14804858, 553.65421419, 1216.94198026, 1798.61028423, 1498.28227046, 1865.84400977, 1508.97025306, 728.50027534, 296.50230702]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [1177.5, 1177.5, 1537.5, 1177.5, 1537.5, 1177.5, 1177.5, 1537.5, 1093.5, 1537.5, 1093.5, 1177.5, 1177.5, 1093.5, 1093.5, 1177.5, 1537.5, 1177.5, 1177.5, 1177.5, 1093.5, 1537.5, 1093.5, 1537.5, 1093.5, 1537.5, 1093.5, 1093.5, 1177.5, 1093.5, 1177.5, 1093.5, 1177.5]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [181375910.42755717, 991798308.39630568, 972322240.00783098, 1007512866.38142359, 1391421127.82271099, 1034877203.48047423, 15347148.24570916, 375524484.58468562, 1076532063.20166802, 831138479.73737252, 1120990048.37622547, 880794460.00618291, 456957198.42622054, 1491168044.20038986, 472444149.44508445, 1353246613.42682815, 462597292.56501734, 431238746.254574, 301783473.19461435, 375000325.1023106, 511712611.24620813, 489216430.94015002, 257051939.07866827, 64641852.68949676, 353626279.57195282, 1308961261.08089066, 849638288.96839857, 1478280817.39391398, 1343629217.01683807, 73974414.43966533, 727542005.23476589, 422644936.71547925, 486216714.60854119]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [1195376412.47634792, 181689468.20087355, 789482735.61665761, 204165591.87043729, 96963151.06926174, 961284694.23388982, 2154102297.86758, 1142895595.18612695, 581419858.18034887, 408007954.09286964, 513230083.69502819, 404197539.88826859, 969904340.29486454, 139526887.83851445, 924528371.97369671, 106907758.8749039, 1471741824.08963704, 145711881.96511918, 678434452.42195058, 1482132032.07905293, 928783788.22000635, 287381723.3124187, 1141543153.82216883, 1277357752.42167926, 1580756797.03885746, 89026882.44890958, 1083924469.68456221, 198811507.002022, 19015901.90894764, 815283338.97701454, 19882980.97042214, 466545923.86673009, 1306604801.98442459]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [357680079.01885241, 417815799.11333865, 12899296.78340354, 457488845.77489662, 33733475.02980587, 6790362.24894573, 7518475.81977332, 722489840.4494729, 28611792.84347552, 467502885.30961978, 119944460.0945697, 57547924.05367026, 308519492.23222315, 44481807.9518216, 909493786.45343089, 156375136.16909915, 64312118.65565459, 995601253.15847135, 296670709.84341496, 524963817.19417894, 355242217.47753745, 494577682.87069637, 179827787.43523937, 1172740954.26197958, 87115711.02565323, 378824982.09587038, 25970561.75788765, 4089586.31834417, 45830332.2433402, 897886168.19450963, 428131401.67537993, 39683111.47280526, 168081124.41831574]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [1734432401.92275763, 1591303575.71051788, 1774704272.40789223, 1669167304.02675748, 1522117753.92177868, 2002952259.96330976, 2176967921.93306, 2240909920.22029, 1686563714.22549248, 1706649319.13986206, 1754164592.16582346, 1342539923.94812179, 1735381030.95330811, 1675176739.99072576, 2306466307.87221, 1616529508.47083116, 1998651235.31030917, 1572551881.37816453, 1276888635.45998001, 2382096174.37554, 1795738616.94375181, 1271175837.12326503, 1578422880.3360765, 2514740559.37316, 2021498787.6364634, 1776813125.62567043, 1959533320.41084838, 1681181910.71428013, 1408475451.16912603, 1787143921.61118937, 1175556387.88056803, 928873972.05501461, 1960902641.01128149]
        }
      ]
    }

