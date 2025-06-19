# allhexes()

    {
      "type": "double",
      "attributes": {},
      "value": [0.09924483, 0.09251076, 0.07520465, 0.10132236, 0.07745517, 0.09422703, 0.09138373, 0.10878442, 0.07187654, 0.08897333, 0.09346988, 0.09526693, 0.10532032, 0.11204343, 0.08780175, 0.07847223, 0.1049498, 0.10283882, 0.07916758, 0.11643018, 0.10223143, 0.07126851, 0.07814559, 0.08124537, 0.08424233, 0.1185756, 0.1114917, 0.07734533, 0.07922946, 0.07562641, 0.0852686, 0.07841796, 0.07317352]
    }

# quick_ben()

    {
      "type": "list",
      "attributes": {
        "class": {
          "type": "character",
          "attributes": {},
          "value": ["tbl_df", "tbl", "data.frame"]
        },
        "row.names": {
          "type": "integer",
          "attributes": {},
          "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33]
        },
        "names": {
          "type": "character",
          "attributes": {},
          "value": ["hex_id", "benefit"]
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
          "value": ["SA_09", "SA_10", "SA_11", "SA_14", "SA_15", "SA_16", "SA_17", "SA_18", "SA_19", "SA_22", "SA_23", "SA_24", "SA_25", "SA_26", "SA_27", "SA_30", "SA_31", "SA_32", "SA_33", "SA_34", "SA_35", "SA_38", "SA_39", "SA_40", "SA_41", "SA_42", "SA_43", "SA_46", "SA_47", "SA_48", "SA_49", "SA_50", "SA_51"]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0.02528368, 0.03485357, 0.03141667, 0.02566625, 0.01928652, 0.02382907, 0.02182787, 0.03402855, 0.02863136, 0.03151551, 0.03196036, 0.03608763, 0.03165296, 0.04535179, 0.0349252, 0.02787689, 0.04238222, 0.03646896, 0.0181828, 0.05344517, 0.04244337, 0.02169283, 0.0265782, 0.03240868, 0.02073265, 0.06066311, 0.03760137, 0.02339519, 0.01853099, 0.02108828, 0.0316076, 0.01898059, 0.01609197]
        }
      ]
    }

# calculate_benefit()

    {
      "type": "list",
      "attributes": {
        "names": {
          "type": "character",
          "attributes": {},
          "value": ["hex_id", "benefit", "geometry"]
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
          "value": ["geometry"]
        },
        "agr": {
          "type": "integer",
          "attributes": {
            "class": {
              "type": "character",
              "attributes": {},
              "value": ["factor"]
            },
            "levels": {
              "type": "character",
              "attributes": {},
              "value": ["constant", "aggregate", "identity"]
            },
            "names": {
              "type": "character",
              "attributes": {},
              "value": ["hex_id", "benefit"]
            }
          },
          "value": ["NA", "NA"]
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
          "value": ["SA_09", "SA_10", "SA_11", "SA_14", "SA_15", "SA_16", "SA_17", "SA_18", "SA_19", "SA_22", "SA_23", "SA_24", "SA_25", "SA_26", "SA_27", "SA_30", "SA_31", "SA_32", "SA_33", "SA_34", "SA_35", "SA_38", "SA_39", "SA_40", "SA_41", "SA_42", "SA_43", "SA_46", "SA_47", "SA_48", "SA_49", "SA_50", "SA_51"]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0.02528368, 0.03485357, 0.03141667, 0.02566625, 0.01928652, 0.02382907, 0.02182787, 0.03402855, 0.02863136, 0.03151551, 0.03196036, 0.03608763, 0.03165296, 0.04535179, 0.0349252, 0.02787689, 0.04238222, 0.03646896, 0.0181828, 0.05344517, 0.04244337, 0.02169283, 0.0265782, 0.03240868, 0.02073265, 0.06066311, 0.03760137, 0.02339519, 0.01853099, 0.02108828, 0.0316076, 0.01898059, 0.01609197]
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
          "value": ["hex_id", "benefit", "geometry"]
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
          "value": ["geometry"]
        },
        "agr": {
          "type": "integer",
          "attributes": {
            "class": {
              "type": "character",
              "attributes": {},
              "value": ["factor"]
            },
            "levels": {
              "type": "character",
              "attributes": {},
              "value": ["constant", "aggregate", "identity"]
            },
            "names": {
              "type": "character",
              "attributes": {},
              "value": ["hex_id", "benefit"]
            }
          },
          "value": ["NA", "NA"]
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
          "value": ["SA_09", "SA_10", "SA_11", "SA_14", "SA_15", "SA_16", "SA_17", "SA_18", "SA_19", "SA_22", "SA_23", "SA_24", "SA_25", "SA_26", "SA_27", "SA_30", "SA_31", "SA_32", "SA_33", "SA_34", "SA_35", "SA_38", "SA_39", "SA_40", "SA_41", "SA_42", "SA_43", "SA_46", "SA_47", "SA_48", "SA_49", "SA_50", "SA_51"]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0.0119285, 0.01975958, 0.01884433, 0.01476375, 0.01013073, 0.00982169, 0.01124025, 0.01642263, 0.01622658, 0.01232236, 0.01329881, 0.01484863, 0.01438923, 0.0214935, 0.01816837, 0.0130616, 0.01899598, 0.0175363, 0.00522913, 0.0258516, 0.02037034, 0.01032313, 0.01586939, 0.02031297, 0.01076746, 0.03621824, 0.01757937, 0.00954283, 0.00510712, 0.00991435, 0.01385522, 0.00682846, 0.00659594]
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
        }
      ]
    }

# calculate_benefit() without GRTS

    {
      "type": "list",
      "attributes": {
        "names": {
          "type": "character",
          "attributes": {},
          "value": ["hex_id", "benefit", "geometry"]
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
          "value": ["geometry"]
        },
        "agr": {
          "type": "integer",
          "attributes": {
            "class": {
              "type": "character",
              "attributes": {},
              "value": ["factor"]
            },
            "levels": {
              "type": "character",
              "attributes": {},
              "value": ["constant", "aggregate", "identity"]
            },
            "names": {
              "type": "character",
              "attributes": {},
              "value": ["hex_id", "benefit"]
            }
          },
          "value": ["NA", "NA"]
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
          "value": ["SA_09", "SA_10", "SA_11", "SA_14", "SA_15", "SA_16", "SA_17", "SA_18", "SA_19", "SA_22", "SA_23", "SA_24", "SA_25", "SA_26", "SA_27", "SA_30", "SA_31", "SA_32", "SA_33", "SA_34", "SA_35", "SA_38", "SA_39", "SA_40", "SA_41", "SA_42", "SA_43", "SA_46", "SA_47", "SA_48", "SA_49", "SA_50", "SA_51"]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0.01211196, 0.00549967, 0.00962177, 0.01051268, 0.00846311, 0.01251568, 0.01287297, 0.00841674, 0.00579029, 0.00794678, 0.01160754, 0.00907389, 0.01367304, 0.00697242, 0.00332717, 0.00651508, 0.01371981, 0.00560771, 0.00752857, 0.009034, 0.00642576, 0.01294383, 0.00668602, 0.00745574, 0.01129917, 0.00689854, 0.0083465, 0.01282545, 0.00690822, 0.00499033, 0.00977203, 0.01215618, 0.00623269]
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
          "value": ["hex_id", "benefit", "geometry"]
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
          "value": ["geometry"]
        },
        "agr": {
          "type": "integer",
          "attributes": {
            "class": {
              "type": "character",
              "attributes": {},
              "value": ["factor"]
            },
            "levels": {
              "type": "character",
              "attributes": {},
              "value": ["constant", "aggregate", "identity"]
            },
            "names": {
              "type": "character",
              "attributes": {},
              "value": ["hex_id", "benefit"]
            }
          },
          "value": ["NA", "NA"]
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
          "value": ["SA_09", "SA_10", "SA_11", "SA_14", "SA_15", "SA_16", "SA_17", "SA_18", "SA_19", "SA_22", "SA_23", "SA_24", "SA_25", "SA_26", "SA_27", "SA_30", "SA_31", "SA_32", "SA_33", "SA_34", "SA_35", "SA_38", "SA_39", "SA_40", "SA_41", "SA_42", "SA_43", "SA_46", "SA_47", "SA_48", "SA_49", "SA_50", "SA_51"]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0.01211196, 0.00549967, 0.00962177, 0.01051268, 0.00846311, 0.01251568, 0.01287297, 0.00841674, 0.00579029, 0.00794678, 0.01160754, 0.00907389, 0.01367304, 0.00697242, 0.00332717, 0.00651508, 0.01371981, 0.00560771, 0.00752857, 0.009034, 0.00642576, 0.01294383, 0.00668602, 0.00745574, 0.01129917, 0.00689854, 0.0083465, 0.01282545, 0.00690822, 0.00499033, 0.00977203, 0.01215618, 0.00623269]
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
        }
      ]
    }

