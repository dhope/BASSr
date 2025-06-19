# run_grts_on_BASS()

    {
      "type": "list",
      "attributes": {
        "names": {
          "type": "character",
          "attributes": {},
          "value": ["siteID", "siteuse", "replsite", "lon_WGS84", "lat_WGS84", "stratum", "wgt", "ip", "caty", "aux", "hex_id", "RawCost", "benefit", "geometry", "LogCost", "ScLogCost", "scale_ben", "partIP", "weightedIP", "inclpr", "num_runs", "n_samples", "Province"]
        },
        "row.names": {
          "type": "integer",
          "attributes": {},
          "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
        },
        "class": {
          "type": "character",
          "attributes": {},
          "value": ["sf", "data.frame"]
        },
        "sf_column": {
          "type": "character",
          "attributes": {},
          "value": ["geometry"]
        },
        "agr": {
          "type": "integer",
          "attributes": {
            "names": {
              "type": "character",
              "attributes": {},
              "value": ["siteID", "siteuse", "replsite", "lon_WGS84", "lat_WGS84", "stratum", "wgt", "ip", "caty", "aux", "hex_id", "RawCost", "benefit", "LogCost", "ScLogCost", "scale_ben", "partIP", "weightedIP", "inclpr", "num_runs", "n_samples", "Province"]
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
          "value": ["NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA"]
        }
      },
      "value": [
        {
          "type": "character",
          "attributes": {},
          "value": ["Site-01", "Site-02", "Site-03", "Site-04", "Site-05", "Site-06", "Site-07", "Site-08", "Site-09", "Site-10", "Site-11", "Site-12"]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["Base", "Base", "Base", "Base", "Base", "Base", "Base", "Base", "Base", "Base", "Base", "Base"]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["None", "None", "None", "None", "None", "None", "None", "None", "None", "None", "None", "None"]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [-88.90986765, -88.9100963, -88.91032495, -88.91028742, -88.91000073, -88.91049731, -88.90967652, -88.91011506, -88.91043927, -88.91030618, -88.90988641, -88.91021062]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [-31.97562257, -31.97532193, -31.97502129, -31.97564103, -31.97516237, -31.97565027, -31.97530346, -31.97501205, -31.97487096, -31.97533116, -31.9753127, -31.97517161]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["None", "None", "None", "None", "None", "None", "None", "None", "None", "None", "None", "None"]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [3.7833482, 1.72680604, 2.50381068, 2.67007368, 3.05437092, 3.66083701, 3.75321213, 2.08834254, 2.35803486, 1.96497578, 1.52278104, 2.10256544]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0.26431614, 0.57910384, 0.39939122, 0.3745215, 0.32739966, 0.27316157, 0.26643844, 0.47884865, 0.42408194, 0.50891212, 0.65669323, 0.47560945]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["None", "None", "None", "None", "None", "None", "None", "None", "None", "None", "None", "None"]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0.40249561, 0.88184834, 0.60818537, 0.57031424, 0.49855799, 0.41596526, 0.40572741, 0.72918164, 0.64578394, 0.77496173, 1, 0.72424906]
        },
        {
          "type": "character",
          "attributes": {
            "class": {
              "type": "character",
              "attributes": {},
              "value": ["glue", "character"]
            }
          },
          "value": ["SA_41", "SA_34", "SA_27", "SA_25", "SA_39", "SA_17", "SA_50", "SA_35", "SA_24", "SA_26", "SA_42", "SA_31"]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [2021498787.6364634, 2382096174.3755426, 2306466307.8722124, 1735381030.95330811, 1578422880.3360765, 2176967921.933063, 928873972.05501461, 1795738616.94375181, 1342539923.94812179, 1675176739.99072576, 1776813125.62567019, 1998651235.31030917]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0.02073265, 0.05344517, 0.0349252, 0.03165296, 0.0265782, 0.02182787, 0.01898059, 0.04244337, 0.03608763, 0.04535179, 0.06066311, 0.04238222]
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
              "value": [75, 43.30127019, 275, 259.80762114]
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
                  "value": ["NAD83 / Ontario MNR Lambert"]
                },
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["PROJCRS[\"NAD83 / Ontario MNR Lambert\",\n    BASEGEOGCRS[\"NAD83\",\n        DATUM[\"North American Datum 1983\",\n            ELLIPSOID[\"GRS 1980\",6378137,298.257222101,\n                LENGTHUNIT[\"metre\",1]]],\n        PRIMEM[\"Greenwich\",0,\n            ANGLEUNIT[\"degree\",0.0174532925199433]],\n        ID[\"EPSG\",4269]],\n    CONVERSION[\"Ontario MNR Lambert\",\n        METHOD[\"Lambert Conic Conformal (2SP)\",\n            ID[\"EPSG\",9802]],\n        PARAMETER[\"Latitude of false origin\",0,\n            ANGLEUNIT[\"degree\",0.0174532925199433],\n            ID[\"EPSG\",8821]],\n        PARAMETER[\"Longitude of false origin\",-85,\n            ANGLEUNIT[\"degree\",0.0174532925199433],\n            ID[\"EPSG\",8822]],\n        PARAMETER[\"Latitude of 1st standard parallel\",44.5,\n            ANGLEUNIT[\"degree\",0.0174532925199433],\n            ID[\"EPSG\",8823]],\n        PARAMETER[\"Latitude of 2nd standard parallel\",53.5,\n            ANGLEUNIT[\"degree\",0.0174532925199433],\n            ID[\"EPSG\",8824]],\n        PARAMETER[\"Easting at false origin\",930000,\n            LENGTHUNIT[\"metre\",1],\n            ID[\"EPSG\",8826]],\n        PARAMETER[\"Northing at false origin\",6430000,\n            LENGTHUNIT[\"metre\",1],\n            ID[\"EPSG\",8827]]],\n    CS[Cartesian,2],\n        AXIS[\"(E)\",east,\n            ORDER[1],\n            LENGTHUNIT[\"metre\",1]],\n        AXIS[\"(N)\",north,\n            ORDER[2],\n            LENGTHUNIT[\"metre\",1]],\n    USAGE[\n        SCOPE[\"Province-wide spatial data management.\"],\n        AREA[\"Canada - Ontario.\"],\n        BBOX[41.67,-95.16,56.9,-74.35]],\n    ID[\"EPSG\",3161]]"]
                }
              ]
            },
            "n_empty": {
              "type": "integer",
              "attributes": {},
              "value": [0]
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
              "value": [150, 173.20508076]
            }
          ]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [9.30567349, 9.37695929, 9.36294711, 9.23939485, 9.19822337, 9.33785203, 8.96795679, 9.25424312, 9.12792721, 9.22406063, 9.24964175, 9.30073702]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0.89473387, 0.90158795, 0.90024069, 0.88836122, 0.88440261, 0.89782781, 0.86226265, 0.88978887, 0.87764369, 0.88688685, 0.88934646, 0.89425923]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0.34176704, 0.88101593, 0.57572393, 0.52178275, 0.43812782, 0.35982111, 0.31288523, 0.69965704, 0.59488591, 0.74760084, 1, 0.69864901]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0.03597649, 0.08670259, 0.05743382, 0.05825119, 0.05064643, 0.03676371, 0.04309598, 0.07710999, 0.07278805, 0.08456349, 0.11065354, 0.07387569]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0.22351659, 0.48971399, 0.33774162, 0.31671076, 0.2768626, 0.23099665, 0.22531129, 0.40493408, 0.35862111, 0.430357, 0.55532677, 0.40219489]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0.40249561, 0.88184834, 0.60818537, 0.57031424, 0.49855799, 0.41596526, 0.40572741, 0.72918164, 0.64578394, 0.77496173, 1, 0.72424906]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON"]
        }
      ]
    }

---

    {
      "type": "list",
      "attributes": {
        "names": {
          "type": "character",
          "attributes": {},
          "value": ["siteID", "siteuse", "replsite", "lon_WGS84", "lat_WGS84", "stratum", "wgt", "ip", "caty", "aux", "hex_id", "RawCost", "benefit", "geometry", "LogCost", "ScLogCost", "scale_ben", "partIP", "weightedIP", "inclpr", "num_runs", "n_samples", "Province"]
        },
        "row.names": {
          "type": "integer",
          "attributes": {},
          "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        },
        "class": {
          "type": "character",
          "attributes": {},
          "value": ["sf", "data.frame"]
        },
        "sf_column": {
          "type": "character",
          "attributes": {},
          "value": ["geometry"]
        },
        "agr": {
          "type": "integer",
          "attributes": {
            "names": {
              "type": "character",
              "attributes": {},
              "value": ["siteID", "siteuse", "replsite", "lon_WGS84", "lat_WGS84", "stratum", "wgt", "ip", "caty", "aux", "hex_id", "RawCost", "benefit", "LogCost", "ScLogCost", "scale_ben", "partIP", "weightedIP", "inclpr", "num_runs", "n_samples", "Province"]
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
          "value": ["NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA"]
        }
      },
      "value": [
        {
          "type": "character",
          "attributes": {},
          "value": ["Site-01", "Site-02", "Site-03", "Site-04", "Site-05", "Site-06", "Site-07", "Site-08", "Site-09", "Site-10"]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["Base", "Base", "Base", "Base", "Base", "Base", "Base", "Base", "Base", "Base"]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["None", "None", "None", "None", "None", "None", "None", "None", "None", "None"]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [-88.91019186, -88.91032495, -88.91053483, -88.91061163, -88.91040175, -88.91043927, -88.90998197, -88.91021062, -88.90967652, -88.90977209]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [-31.97548148, -31.97502129, -31.97503052, -31.97549995, -31.97549071, -31.97487096, -31.97547225, -31.97517161, -31.97530346, -31.97546302]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["ON", "ON", "ON", "ON", "ON", "ON", "MB", "MB", "MB", "MB"]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [2.83216105, 2.40723879, 2.78050609, 3.0316486, 2.57346272, 2.26708554, 5.46370108, 3.27549196, 5.84696007, 5.28411367]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0.35308727, 0.41541371, 0.35964676, 0.32985353, 0.3885815, 0.44109496, 0.18302612, 0.30529765, 0.17102905, 0.1892465]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["None", "None", "None", "None", "None", "None", "None", "None", "None", "None"]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0.5169365, 0.60818537, 0.52653991, 0.48292122, 0.56890174, 0.64578394, 0.43418773, 0.72424906, 0.40572741, 0.44894416]
        },
        {
          "type": "character",
          "attributes": {
            "class": {
              "type": "character",
              "attributes": {},
              "value": ["glue", "character"]
            }
          },
          "value": ["SA_30", "SA_27", "SA_19", "SA_14", "SA_22", "SA_24", "SA_38", "SA_31", "SA_50", "SA_46"]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [1616529508.47083116, 2306466307.8722124, 1686563714.22549248, 1669167304.02675724, 1706649319.13986158, 1342539923.94812179, 1271175837.12326503, 1998651235.31030917, 928873972.05501461, 1681181910.71428037]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0.02787689, 0.0349252, 0.02863136, 0.02566625, 0.03151551, 0.03608763, 0.02169283, 0.04238222, 0.01898059, 0.02339519]
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
              "value": [50, 86.60254038, 275, 259.80762114]
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
                  "value": ["NAD83 / Ontario MNR Lambert"]
                },
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["PROJCRS[\"NAD83 / Ontario MNR Lambert\",\n    BASEGEOGCRS[\"NAD83\",\n        DATUM[\"North American Datum 1983\",\n            ELLIPSOID[\"GRS 1980\",6378137,298.257222101,\n                LENGTHUNIT[\"metre\",1]]],\n        PRIMEM[\"Greenwich\",0,\n            ANGLEUNIT[\"degree\",0.0174532925199433]],\n        ID[\"EPSG\",4269]],\n    CONVERSION[\"Ontario MNR Lambert\",\n        METHOD[\"Lambert Conic Conformal (2SP)\",\n            ID[\"EPSG\",9802]],\n        PARAMETER[\"Latitude of false origin\",0,\n            ANGLEUNIT[\"degree\",0.0174532925199433],\n            ID[\"EPSG\",8821]],\n        PARAMETER[\"Longitude of false origin\",-85,\n            ANGLEUNIT[\"degree\",0.0174532925199433],\n            ID[\"EPSG\",8822]],\n        PARAMETER[\"Latitude of 1st standard parallel\",44.5,\n            ANGLEUNIT[\"degree\",0.0174532925199433],\n            ID[\"EPSG\",8823]],\n        PARAMETER[\"Latitude of 2nd standard parallel\",53.5,\n            ANGLEUNIT[\"degree\",0.0174532925199433],\n            ID[\"EPSG\",8824]],\n        PARAMETER[\"Easting at false origin\",930000,\n            LENGTHUNIT[\"metre\",1],\n            ID[\"EPSG\",8826]],\n        PARAMETER[\"Northing at false origin\",6430000,\n            LENGTHUNIT[\"metre\",1],\n            ID[\"EPSG\",8827]]],\n    CS[Cartesian,2],\n        AXIS[\"(E)\",east,\n            ORDER[1],\n            LENGTHUNIT[\"metre\",1]],\n        AXIS[\"(N)\",north,\n            ORDER[2],\n            LENGTHUNIT[\"metre\",1]],\n    USAGE[\n        SCOPE[\"Province-wide spatial data management.\"],\n        AREA[\"Canada - Ontario.\"],\n        BBOX[41.67,-95.16,56.9,-74.35]],\n    ID[\"EPSG\",3161]]"]
                }
              ]
            },
            "n_empty": {
              "type": "integer",
              "attributes": {},
              "value": [0]
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
              "value": [250, 86.60254038]
            }
          ]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [9.20858364, 9.36294711, 9.22700275, 9.22249987, 9.23214429, 9.12792721, 9.10420563, 9.30073702, 8.96795679, 9.22561471]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0.88539875, 0.90024069, 0.88716973, 0.88673678, 0.88766409, 0.87764369, 0.87536288, 0.89425923, 0.86226265, 0.88703627]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0.45953611, 0.57572393, 0.47197315, 0.42309494, 0.51951682, 0.59488591, 0.35759502, 0.69864901, 0.31288523, 0.38565769]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0.05266341, 0.05743382, 0.05325286, 0.04792109, 0.0583604, 0.07278805, 0.04456961, 0.07387569, 0.04309598, 0.04356533]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0.28706868, 0.33774162, 0.29240171, 0.26817908, 0.31592637, 0.35862111, 0.24111607, 0.40219489, 0.22531129, 0.24931071]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0.5169365, 0.60818537, 0.52653991, 0.48292122, 0.56890174, 0.64578394, 0.43418773, 0.72424906, 0.40572741, 0.44894416]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [10, 10, 10, 10, 10, 10, 10, 10, 10, 10]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [3, 3, 3, 3, 3, 3, 3, 3, 3, 3]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["ON", "ON", "ON", "ON", "ON", "ON", "MB", "MB", "MB", "MB"]
        }
      ]
    }

