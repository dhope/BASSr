# select_sites() - Shortest Path

    {
      "type": "list",
      "attributes": {
        "row.names": {
          "type": "integer",
          "attributes": {},
          "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]
        },
        "names": {
          "type": "character",
          "attributes": {},
          "value": ["SW_ID", "ID", "COMP_ID", "X", "Y", "benefit", "num_runs", "nsamples", "geometry", "scaled_benefit", "aru", "os"]
        },
        "class": {
          "type": "character",
          "attributes": {},
          "value": ["sf", "tbl_df", "tbl", "data.frame"]
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
              "value": ["SW_ID", "ID", "COMP_ID", "X", "Y", "benefit", "num_runs", "nsamples", "scaled_benefit", "aru", "os"]
            }
          },
          "value": ["NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA"]
        }
      },
      "value": [
        {
          "type": "double",
          "attributes": {},
          "value": [41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [132, 133, 49, 161, 113, 19, 32, 100, 37, 109, 209, 210, 14, 169, 89, 66, 152, 122]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["41152_132", "41152_133", "41152_49", "41152_161", "41152_113", "41152_19", "41152_32", "41152_100", "41152_37", "41152_109", "41152_209", "41152_210", "41152_14", "41152_169", "41152_89", "41152_66", "41152_152", "41152_122"]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [1686258.55368, 1685958.55368, 1685508.55368, 1688658.55368, 1689258.55368, 1688208.55368, 1685808.55368, 1689708.55368, 1688808.55368, 1688058.55368, 1687758.55368, 1688058.55368, 1686258.55368, 1687758.55368, 1687008.55368, 1688058.55368, 1687608.55368, 1688058.55368]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [5863941.79478, 5863941.79478, 5864721.21764, 5866539.87099, 5866020.25575, 5865240.83288, 5865240.83288, 5864201.6024, 5864721.21764, 5866020.25575, 5862902.56429, 5862902.56429, 5864981.02526, 5863422.17953, 5865760.44813, 5864461.41002, 5863681.98716, 5863941.79478]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0.40342814, 0.40342814, 0.36217903, 0.35973557, 0.32798872, 0.32507445, 0.31730125, 0.30862324, 0.29980423, 0.2940333, 0.28505862, 0.28505862, 0.28180574, 0.24703335, 0.24504619, 0.23411359, 0.22479301, 0.22381106]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2]
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
              "value": [820722.34415638, 13051539.8949357, 824692.26991128, 13054699.44024841]
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
                  "value": ["EPSG:3161"]
                },
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["PROJCRS[\"NAD83 / Ontario MNR Lambert\",\n    BASEGEOGCRS[\"NAD83\",\n        DATUM[\"North American Datum 1983\",\n            ELLIPSOID[\"GRS 1980\",6378137,298.257222101,\n                LENGTHUNIT[\"metre\",1]]],\n        PRIMEM[\"Greenwich\",0,\n            ANGLEUNIT[\"degree\",0.0174532925199433]],\n        ID[\"EPSG\",4269]],\n    CONVERSION[\"Ontario MNR Lambert\",\n        METHOD[\"Lambert Conic Conformal (2SP)\",\n            ID[\"EPSG\",9802]],\n        PARAMETER[\"Latitude of false origin\",0,\n            ANGLEUNIT[\"degree\",0.0174532925199433],\n            ID[\"EPSG\",8821]],\n        PARAMETER[\"Longitude of false origin\",-85,\n            ANGLEUNIT[\"degree\",0.0174532925199433],\n            ID[\"EPSG\",8822]],\n        PARAMETER[\"Latitude of 1st standard parallel\",44.5,\n            ANGLEUNIT[\"degree\",0.0174532925199433],\n            ID[\"EPSG\",8823]],\n        PARAMETER[\"Latitude of 2nd standard parallel\",53.5,\n            ANGLEUNIT[\"degree\",0.0174532925199433],\n            ID[\"EPSG\",8824]],\n        PARAMETER[\"Easting at false origin\",930000,\n            LENGTHUNIT[\"metre\",1],\n            ID[\"EPSG\",8826]],\n        PARAMETER[\"Northing at false origin\",6430000,\n            LENGTHUNIT[\"metre\",1],\n            ID[\"EPSG\",8827]]],\n    CS[Cartesian,2],\n        AXIS[\"(E)\",east,\n            ORDER[1],\n            LENGTHUNIT[\"metre\",1]],\n        AXIS[\"(N)\",north,\n            ORDER[2],\n            LENGTHUNIT[\"metre\",1]],\n    USAGE[\n        SCOPE[\"Province-wide spatial data management.\"],\n        AREA[\"Canada - Ontario.\"],\n        BBOX[41.67,-95.16,56.9,-74.35]],\n    ID[\"EPSG\",3161]]"]
                }
              ]
            },
            "classes": {
              "type": "character",
              "attributes": {},
              "value": ["GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION"]
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
              "value": [821131.81366289, 13053171.46115426]
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
              "value": [820852.67237993, 13053282.37430713]
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
              "value": [820722.34415638, 13054173.33976986]
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
              "value": [824326.25559581, 13054699.44024841]
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
              "value": [824692.26991128, 13053994.53056465]
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
              "value": [823426.87993502, 13053658.15562043]
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
              "value": [821193.74513042, 13054545.49397142]
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
              "value": [824438.04677472, 13052137.46961229]
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
              "value": [823792.89581128, 13052953.26501491]
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
              "value": [823575.70605772, 13054438.21186364]
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
              "value": [822142.99711455, 13051650.80602382]
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
              "value": [822422.13515529, 13051539.8949357]
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
              "value": [821516.32980694, 13054137.5845561]
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
              "value": [822335.25553826, 13052133.846874]
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
              "value": [822502.57700733, 13054584.89469354]
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
              "value": [822998.9156476, 13052989.02923428]
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
              "value": [822291.81558641, 13052430.82599584]
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
              "value": [822806.65439361, 13052505.97913769]
            }
          ]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0.95999704, 0.95999704, 0.86184071, 0.85602627, 0.78048151, 0.7735467, 0.7550496, 0.73439943, 0.71341373, 0.69968124, 0.67832509, 0.67832509, 0.67058454, 0.58784023, 0.58311157, 0.55709638, 0.53491713, 0.53258049]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU"]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary"]
        }
      ]
    }

---

    {
      "type": "list",
      "attributes": {
        "row.names": {
          "type": "integer",
          "attributes": {},
          "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]
        },
        "names": {
          "type": "character",
          "attributes": {},
          "value": ["SW_ID", "ID", "COMP_ID", "X", "Y", "benefit", "num_runs", "nsamples", "geometry", "scaled_benefit", "running_value", "total_value", "mean_value", "origin", "lineid", "linepoint", "route"]
        },
        "class": {
          "type": "character",
          "attributes": {},
          "value": ["sf", "tbl_df", "tbl", "data.frame"]
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
              "value": ["SW_ID", "ID", "COMP_ID", "X", "Y", "benefit", "num_runs", "nsamples", "scaled_benefit", "running_value", "total_value", "mean_value", "origin", "lineid", "linepoint", "route"]
            }
          },
          "value": ["NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA"]
        }
      },
      "value": [
        {
          "type": "double",
          "attributes": {},
          "value": [41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [121, 152, 169, 190, 209, 210, 107, 132, 133, 16, 49, 79, 122, 19, 2, 34, 66, 94]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["41152_121", "41152_152", "41152_169", "41152_190", "41152_209", "41152_210", "41152_107", "41152_132", "41152_133", "41152_16", "41152_49", "41152_79", "41152_122", "41152_19", "41152_2", "41152_34", "41152_66", "41152_94"]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [1687758.55368, 1687608.55368, 1687758.55368, 1687908.55368, 1687758.55368, 1688058.55368, 1685808.55368, 1686258.55368, 1685958.55368, 1685658.55368, 1685508.55368, 1685658.55368, 1688058.55368, 1688208.55368, 1688058.55368, 1687908.55368, 1688058.55368, 1687908.55368]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [5863941.79478, 5863681.98716, 5863422.17953, 5863162.37191, 5862902.56429, 5862902.56429, 5864201.6024, 5863941.79478, 5863941.79478, 5864981.02526, 5864721.21764, 5864461.41002, 5863941.79478, 5865240.83288, 5864981.02526, 5864721.21764, 5864461.41002, 5864201.6024]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0.22900222, 0.22479301, 0.24703335, 0.27906609, 0.28505862, 0.28505862, 0.33237174, 0.40342814, 0.40342814, 0.30718041, 0.36217903, 0.25834694, 0.22381106, 0.32507445, 0.22635036, 0.31934416, 0.23411359, 0.33955851]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2]
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
              "value": [820722.34415638, 13051539.8949357, 823426.87993502, 13054359.41663215]
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
                  "value": ["EPSG:3161"]
                },
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["PROJCRS[\"NAD83 / Ontario MNR Lambert\",\n    BASEGEOGCRS[\"NAD83\",\n        DATUM[\"North American Datum 1983\",\n            ELLIPSOID[\"GRS 1980\",6378137,298.257222101,\n                LENGTHUNIT[\"metre\",1]]],\n        PRIMEM[\"Greenwich\",0,\n            ANGLEUNIT[\"degree\",0.0174532925199433]],\n        ID[\"EPSG\",4269]],\n    CONVERSION[\"Ontario MNR Lambert\",\n        METHOD[\"Lambert Conic Conformal (2SP)\",\n            ID[\"EPSG\",9802]],\n        PARAMETER[\"Latitude of false origin\",0,\n            ANGLEUNIT[\"degree\",0.0174532925199433],\n            ID[\"EPSG\",8821]],\n        PARAMETER[\"Longitude of false origin\",-85,\n            ANGLEUNIT[\"degree\",0.0174532925199433],\n            ID[\"EPSG\",8822]],\n        PARAMETER[\"Latitude of 1st standard parallel\",44.5,\n            ANGLEUNIT[\"degree\",0.0174532925199433],\n            ID[\"EPSG\",8823]],\n        PARAMETER[\"Latitude of 2nd standard parallel\",53.5,\n            ANGLEUNIT[\"degree\",0.0174532925199433],\n            ID[\"EPSG\",8824]],\n        PARAMETER[\"Easting at false origin\",930000,\n            LENGTHUNIT[\"metre\",1],\n            ID[\"EPSG\",8826]],\n        PARAMETER[\"Northing at false origin\",6430000,\n            LENGTHUNIT[\"metre\",1],\n            ID[\"EPSG\",8827]]],\n    CS[Cartesian,2],\n        AXIS[\"(E)\",east,\n            ORDER[1],\n            LENGTHUNIT[\"metre\",1]],\n        AXIS[\"(N)\",north,\n            ORDER[2],\n            LENGTHUNIT[\"metre\",1]],\n    USAGE[\n        SCOPE[\"Province-wide spatial data management.\"],\n        AREA[\"Canada - Ontario.\"],\n        BBOX[41.67,-95.16,56.9,-74.35]],\n    ID[\"EPSG\",3161]]"]
                }
              ]
            },
            "classes": {
              "type": "character",
              "attributes": {},
              "value": ["GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION"]
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
              "value": [822527.51510148, 13052616.89317583]
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
              "value": [822291.81558641, 13052430.82599584]
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
              "value": [822335.25553826, 13052133.846874]
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
              "value": [822378.69540691, 13051836.86988543]
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
              "value": [822142.99711455, 13051650.80602382]
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
              "value": [822422.13515529, 13051539.8949357]
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
              "value": [820809.22975835, 13053579.3607469]
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
              "value": [821131.81366289, 13053171.46115426]
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
              "value": [820852.67237993, 13053282.37430713]
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
              "value": [820958.04440924, 13054359.41663215]
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
              "value": [820722.34415638, 13054173.33976986]
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
              "value": [820765.78701714, 13053876.34923397]
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
              "value": [822806.65439361, 13052505.97913769]
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
              "value": [823426.87993502, 13053658.15562043]
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
              "value": [823191.17804057, 13053472.08479391]
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
              "value": [822955.47661421, 13053286.01444185]
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
              "value": [822998.9156476, 13052989.02923428]
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
              "value": [822763.2151219, 13052802.96092189]
            }
          ]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0.54493337, 0.53491713, 0.58784023, 0.66406527, 0.67832509, 0.67832509, 0.79091134, 0.95999704, 0.95999704, 0.73096608, 0.86184071, 0.61476202, 0.53258049, 0.7735467, 0.538623, 0.75991092, 0.55709638, 0.80801297]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [8, 8, 8, 8, 8, 8, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [8, 8, 8, 8, 8, 8, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [1.6, 1.6, 1.6, 1.6, 1.6, 1.6, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["41152_209", "41152_209", "41152_209", "41152_209", "41152_209", "41152_209", "41152_132", "41152_132", "41152_132", "41152_132", "41152_132", "41152_132", "41152_19", "41152_19", "41152_19", "41152_19", "41152_19", "41152_19"]
        },
        {
          "type": "integer",
          "attributes": {},
          "value": [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["p5", "p4", "p3", "p2", "p0", "p1", "p2", "p0", "p1", "p5", "p4", "p3", "p5", "p0", "p1", "p2", "p3", "p4"]
        },
        {
          "type": "integer",
          "attributes": {},
          "value": [1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3]
        }
      ]
    }

---

    {
      "type": "list",
      "attributes": {
        "row.names": {
          "type": "integer",
          "attributes": {},
          "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36]
        },
        "names": {
          "type": "character",
          "attributes": {},
          "value": ["SW_ID", "ID", "COMP_ID", "X", "Y", "benefit", "num_runs", "nsamples", "geometry", "scaled_benefit", "aru", "os"]
        },
        "class": {
          "type": "character",
          "attributes": {},
          "value": ["sf", "tbl_df", "tbl", "data.frame"]
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
              "value": ["SW_ID", "ID", "COMP_ID", "X", "Y", "benefit", "num_runs", "nsamples", "scaled_benefit", "aru", "os"]
            }
          },
          "value": ["NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA"]
        }
      },
      "value": [
        {
          "type": "double",
          "attributes": {},
          "value": [41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [132, 133, 49, 161, 113, 19, 32, 100, 37, 109, 209, 210, 14, 169, 89, 66, 152, 122, 3, 43, 93, 140, 146, 53, 173, 8, 47, 121, 33, 189, 107, 21, 207, 179, 187, 88]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["41152_132", "41152_133", "41152_49", "41152_161", "41152_113", "41152_19", "41152_32", "41152_100", "41152_37", "41152_109", "41152_209", "41152_210", "41152_14", "41152_169", "41152_89", "41152_66", "41152_152", "41152_122", "41436_3", "41436_43", "41436_93", "41436_140", "41436_146", "41436_53", "41436_173", "41436_8", "41436_47", "41436_121", "41436_33", "41436_189", "41436_107", "41436_21", "41436_207", "41436_179", "41436_187", "41436_88"]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [1686258.55368, 1685958.55368, 1685508.55368, 1688658.55368, 1689258.55368, 1688208.55368, 1685808.55368, 1689708.55368, 1688808.55368, 1688058.55368, 1687758.55368, 1688058.55368, 1686258.55368, 1687758.55368, 1687008.55368, 1688058.55368, 1687608.55368, 1688058.55368, 1767108.55368, 1766058.55368, 1764558.55368, 1766358.55368, 1766658.55368, 1767408.55368, 1767708.55368, 1768608.55368, 1764858.55368, 1766508.55368, 1764258.55368, 1765158.55368, 1764558.55368, 1767558.55368, 1765608.55368, 1765008.55368, 1765758.55368, 1766058.55368]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [5863941.79478, 5863941.79478, 5864721.21764, 5866539.87099, 5866020.25575, 5865240.83288, 5865240.83288, 5864201.6024, 5864721.21764, 5866020.25575, 5862902.56429, 5862902.56429, 5864981.02526, 5863422.17953, 5865760.44813, 5864461.41002, 5863681.98716, 5863941.79478, 5871476.21579, 5871216.40817, 5872255.63865, 5872775.2539, 5870177.17768, 5871995.83103, 5869917.37006, 5871476.21579, 5871216.40817, 5870436.98531, 5871736.02341, 5873294.86914, 5870696.79293, 5871736.02341, 5873554.67676, 5869917.37006, 5873294.86914, 5872255.63865]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0.40342814, 0.40342814, 0.36217903, 0.35973557, 0.32798872, 0.32507445, 0.31730125, 0.30862324, 0.29980423, 0.2940333, 0.28505862, 0.28505862, 0.28180574, 0.24703335, 0.24504619, 0.23411359, 0.22479301, 0.22381106, 0.40862026, 0.3909828, 0.31873518, 0.31246209, 0.31146035, 0.30678784, 0.30345934, 0.28679872, 0.28477196, 0.27592136, 0.27532863, 0.26792391, 0.26495894, 0.26467146, 0.25503759, 0.24565751, 0.24254606, 0.23057083]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2]
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
              "value": [820722.34415638, 13028604.18447694, 900533.73664659, 13054699.44024841]
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
                  "value": ["EPSG:3161"]
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
              "value": [821131.81366289, 13053171.46115426]
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
              "value": [820852.67237993, 13053282.37430713]
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
              "value": [820722.34415638, 13054173.33976986]
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
              "value": [824326.25559581, 13054699.44024841]
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
              "value": [824692.26991128, 13053994.53056465]
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
              "value": [823426.87993502, 13053658.15562043]
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
              "value": [821193.74513042, 13054545.49397142]
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
              "value": [824438.04677472, 13052137.46961229]
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
              "value": [823792.89581128, 13052953.26501491]
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
              "value": [823575.70605772, 13054438.21186364]
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
              "value": [822142.99711455, 13051650.80602382]
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
              "value": [822422.13515529, 13051539.8949357]
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
              "value": [821516.32980694, 13054137.5845561]
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
              "value": [822335.25553826, 13052133.846874]
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
              "value": [822502.57700733, 13054584.89469354]
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
              "value": [822998.9156476, 13052989.02923428]
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
              "value": [822291.81558641, 13052430.82599584]
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
              "value": [822806.65439361, 13052505.97913769]
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
              "value": [899138.44508427, 13030274.30882096]
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
              "value": [898065.5158299, 13030421.33995944]
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
              "value": [897055.08665832, 13031941.69664066]
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
              "value": [898921.90187486, 13031758.60600112]
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
              "value": [898238.75518401, 13029233.93446228]
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
              "value": [899609.94781867, 13030646.07470798]
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
              "value": [899119.23596824, 13028604.18447694]
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
              "value": [900533.73664659, 13029719.44666056]
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
              "value": [896949.27283483, 13030865.22255613]
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
              "value": [898195.44554371, 13029530.78290064]
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
              "value": [896583.58580456, 13031569.91383157]
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
              "value": [897998.09425617, 13032685.26806891]
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
              "value": [896477.77508524, 13030493.44848365]
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
              "value": [899653.25534986, 13030349.21855795]
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
              "value": [898512.91104153, 13032760.18508105]
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
              "value": [896607.71282408, 13029602.89134687]
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
              "value": [898556.22083467, 13032463.31514867]
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
              "value": [898450.39761437, 13031386.82921477]
            }
          ]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0.95999704, 0.95999704, 0.86184071, 0.85602627, 0.78048151, 0.7735467, 0.7550496, 0.73439943, 0.71341373, 0.69968124, 0.67832509, 0.67832509, 0.67058454, 0.58784023, 0.58311157, 0.55709638, 0.53491713, 0.53258049, 0.93926446, 0.89872256, 0.73265242, 0.71823294, 0.71593033, 0.70518998, 0.697539, 0.65924251, 0.65458373, 0.63423955, 0.63287708, 0.6158564, 0.60904106, 0.60838024, 0.58623561, 0.56467432, 0.55752227, 0.52999571]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU"]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary"]
        }
      ]
    }

---

    {
      "type": "list",
      "attributes": {
        "row.names": {
          "type": "integer",
          "attributes": {},
          "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36]
        },
        "names": {
          "type": "character",
          "attributes": {},
          "value": ["SW_ID", "ID", "COMP_ID", "X", "Y", "benefit", "num_runs", "nsamples", "geometry", "scaled_benefit", "running_value", "total_value", "mean_value", "origin", "lineid", "linepoint", "route"]
        },
        "class": {
          "type": "character",
          "attributes": {},
          "value": ["sf", "tbl_df", "tbl", "data.frame"]
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
              "value": ["SW_ID", "ID", "COMP_ID", "X", "Y", "benefit", "num_runs", "nsamples", "scaled_benefit", "running_value", "total_value", "mean_value", "origin", "lineid", "linepoint", "route"]
            }
          },
          "value": ["NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA"]
        }
      },
      "value": [
        {
          "type": "double",
          "attributes": {},
          "value": [41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [121, 152, 169, 190, 209, 210, 107, 132, 133, 16, 49, 79, 122, 19, 2, 34, 66, 94, 19, 20, 21, 3, 4, 53, 101, 121, 122, 146, 43, 73, 15, 16, 33, 47, 64, 93]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["41152_121", "41152_152", "41152_169", "41152_190", "41152_209", "41152_210", "41152_107", "41152_132", "41152_133", "41152_16", "41152_49", "41152_79", "41152_122", "41152_19", "41152_2", "41152_34", "41152_66", "41152_94", "41436_19", "41436_20", "41436_21", "41436_3", "41436_4", "41436_53", "41436_101", "41436_121", "41436_122", "41436_146", "41436_43", "41436_73", "41436_15", "41436_16", "41436_33", "41436_47", "41436_64", "41436_93"]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [1687758.55368, 1687608.55368, 1687758.55368, 1687908.55368, 1687758.55368, 1688058.55368, 1685808.55368, 1686258.55368, 1685958.55368, 1685658.55368, 1685508.55368, 1685658.55368, 1688058.55368, 1688208.55368, 1688058.55368, 1687908.55368, 1688058.55368, 1687908.55368, 1766958.55368, 1767258.55368, 1767558.55368, 1767108.55368, 1767408.55368, 1767408.55368, 1766358.55368, 1766508.55368, 1766808.55368, 1766658.55368, 1766058.55368, 1766208.55368, 1764708.55368, 1764408.55368, 1764258.55368, 1764858.55368, 1764408.55368, 1764558.55368]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [5863941.79478, 5863681.98716, 5863422.17953, 5863162.37191, 5862902.56429, 5862902.56429, 5864201.6024, 5863941.79478, 5863941.79478, 5864981.02526, 5864721.21764, 5864461.41002, 5863941.79478, 5865240.83288, 5864981.02526, 5864721.21764, 5864461.41002, 5864201.6024, 5871736.02341, 5871736.02341, 5871736.02341, 5871476.21579, 5871476.21579, 5871995.83103, 5870696.79293, 5870436.98531, 5870436.98531, 5870177.17768, 5871216.40817, 5870956.60055, 5871476.21579, 5871476.21579, 5871736.02341, 5871216.40817, 5871995.83103, 5872255.63865]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0.22900222, 0.22479301, 0.24703335, 0.27906609, 0.28505862, 0.28505862, 0.33237174, 0.40342814, 0.40342814, 0.30718041, 0.36217903, 0.25834694, 0.22381106, 0.32507445, 0.22635036, 0.31934416, 0.23411359, 0.33955851, 0.26420197, 0.34825552, 0.26467146, 0.40862026, 0.33923579, 0.30678784, 0.29949176, 0.27592136, 0.32142303, 0.31146035, 0.3909828, 0.22421253, 0.24557221, 0.32300513, 0.27532863, 0.28477196, 0.35417974, 0.31873518]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2]
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
              "value": [820722.34415638, 13029233.93446228, 899653.25534986, 13054359.41663215]
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
                  "value": ["EPSG:3161"]
                },
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["PROJCRS[\"NAD83 / Ontario MNR Lambert\",\n    BASEGEOGCRS[\"NAD83\",\n        DATUM[\"North American Datum 1983\",\n            ELLIPSOID[\"GRS 1980\",6378137,298.257222101,\n                LENGTHUNIT[\"metre\",1]]],\n        PRIMEM[\"Greenwich\",0,\n            ANGLEUNIT[\"degree\",0.0174532925199433]],\n        ID[\"EPSG\",4269]],\n    CONVERSION[\"Ontario MNR Lambert\",\n        METHOD[\"Lambert Conic Conformal (2SP)\",\n            ID[\"EPSG\",9802]],\n        PARAMETER[\"Latitude of false origin\",0,\n            ANGLEUNIT[\"degree\",0.0174532925199433],\n            ID[\"EPSG\",8821]],\n        PARAMETER[\"Longitude of false origin\",-85,\n            ANGLEUNIT[\"degree\",0.0174532925199433],\n            ID[\"EPSG\",8822]],\n        PARAMETER[\"Latitude of 1st standard parallel\",44.5,\n            ANGLEUNIT[\"degree\",0.0174532925199433],\n            ID[\"EPSG\",8823]],\n        PARAMETER[\"Latitude of 2nd standard parallel\",53.5,\n            ANGLEUNIT[\"degree\",0.0174532925199433],\n            ID[\"EPSG\",8824]],\n        PARAMETER[\"Easting at false origin\",930000,\n            LENGTHUNIT[\"metre\",1],\n            ID[\"EPSG\",8826]],\n        PARAMETER[\"Northing at false origin\",6430000,\n            LENGTHUNIT[\"metre\",1],\n            ID[\"EPSG\",8827]]],\n    CS[Cartesian,2],\n        AXIS[\"(E)\",east,\n            ORDER[1],\n            LENGTHUNIT[\"metre\",1]],\n        AXIS[\"(N)\",north,\n            ORDER[2],\n            LENGTHUNIT[\"metre\",1]],\n    USAGE[\n        SCOPE[\"Province-wide spatial data management.\"],\n        AREA[\"Canada - Ontario.\"],\n        BBOX[41.67,-95.16,56.9,-74.35]],\n    ID[\"EPSG\",3161]]"]
                }
              ]
            },
            "classes": {
              "type": "character",
              "attributes": {},
              "value": []
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
              "value": [822527.51510148, 13052616.89317583]
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
              "value": [822291.81558641, 13052430.82599584]
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
              "value": [822335.25553826, 13052133.846874]
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
              "value": [822378.69540691, 13051836.86988543]
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
              "value": [822142.99711455, 13051650.80602382]
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
              "value": [822422.13515529, 13051539.8949357]
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
              "value": [820809.22975835, 13053579.3607469]
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
              "value": [821131.81366289, 13053171.46115426]
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
              "value": [820852.67237993, 13053282.37430713]
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
              "value": [820958.04440924, 13054359.41663215]
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
              "value": [820722.34415638, 13054173.33976986]
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
              "value": [820765.78701714, 13053876.34923397]
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
              "value": [822806.65439361, 13052505.97913769]
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
              "value": [823426.87993502, 13053658.15562043]
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
              "value": [823191.17804057, 13053472.08479391]
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
              "value": [822955.47661421, 13053286.01444185]
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
              "value": [822998.9156476, 13052989.02923428]
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
              "value": [822763.2151219, 13052802.96092189]
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
              "value": [899095.13671177, 13030571.16434296]
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
              "value": [899374.19620297, 13030460.19151649]
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
              "value": [899653.25534986, 13030349.21855795]
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
              "value": [899138.44508427, 13030274.30882096]
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
              "value": [899417.50408557, 13030163.3366531]
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
              "value": [899609.94781867, 13030646.07470798]
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
              "value": [898152.13576507, 13029827.63327981]
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
              "value": [898195.44554371, 13029530.78290064]
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
              "value": [898474.50396243, 13029419.8138925]
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
              "value": [898238.75518401, 13029233.93446228]
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
              "value": [898065.5158299, 13030421.33995944]
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
              "value": [898108.8258481, 13030124.48560127]
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
              "value": [896905.96068262, 13031162.08140138]
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
              "value": [896626.89858424, 13031273.05237803]
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
              "value": [896583.58580456, 13031569.91383157]
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
              "value": [896949.27283483, 13030865.22255613]
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
              "value": [896819.33596435, 13031755.80494003]
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
              "value": [897055.08665832, 13031941.69664066]
            }
          ]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0.54493337, 0.53491713, 0.58784023, 0.66406527, 0.67832509, 0.67832509, 0.79091134, 0.95999704, 0.95999704, 0.73096608, 0.86184071, 0.61476202, 0.53258049, 0.7735467, 0.538623, 0.75991092, 0.55709638, 0.80801297, 0.60730106, 0.80050859, 0.60838024, 0.93926446, 0.77977562, 0.70518998, 0.68841902, 0.63423955, 0.73883077, 0.71593033, 0.89872256, 0.51538037, 0.56447825, 0.74246743, 0.63287708, 0.65458373, 0.81412616, 0.73265242]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [8, 8, 8, 8, 8, 8, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [8, 8, 8, 8, 8, 8, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [1.6, 1.6, 1.6, 1.6, 1.6, 1.6, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["41152_209", "41152_209", "41152_209", "41152_209", "41152_209", "41152_209", "41152_132", "41152_132", "41152_132", "41152_132", "41152_132", "41152_132", "41152_19", "41152_19", "41152_19", "41152_19", "41152_19", "41152_19", "41436_3", "41436_3", "41436_3", "41436_3", "41436_3", "41436_3", "41436_43", "41436_43", "41436_43", "41436_43", "41436_43", "41436_43", "41436_93", "41436_93", "41436_93", "41436_93", "41436_93", "41436_93"]
        },
        {
          "type": "integer",
          "attributes": {},
          "value": [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["p5", "p4", "p3", "p2", "p0", "p1", "p2", "p0", "p1", "p5", "p4", "p3", "p5", "p0", "p1", "p2", "p3", "p4", "p5", "p4", "p2", "p0", "p1", "p3", "p2", "p3", "p5", "p4", "p0", "p1", "p4", "p3", "p2", "p5", "p1", "p0"]
        },
        {
          "type": "integer",
          "attributes": {},
          "value": [1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3]
        }
      ]
    }

---

    {
      "type": "list",
      "attributes": {
        "row.names": {
          "type": "integer",
          "attributes": {},
          "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90]
        },
        "names": {
          "type": "character",
          "attributes": {},
          "value": ["SW_ID", "ID", "COMP_ID", "X", "Y", "benefit", "num_runs", "nsamples", "geometry", "scaled_benefit", "aru", "os"]
        },
        "class": {
          "type": "character",
          "attributes": {},
          "value": ["sf", "tbl_df", "tbl", "data.frame"]
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
              "value": ["SW_ID", "ID", "COMP_ID", "X", "Y", "benefit", "num_runs", "nsamples", "scaled_benefit", "aru", "os"]
            }
          },
          "value": ["NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA"]
        }
      },
      "value": [
        {
          "type": "double",
          "attributes": {},
          "value": [41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41518, 41518, 41518, 41518, 41518, 41518, 41518, 41518, 41518, 41518, 41518, 41518, 41518, 41518, 41518, 41518, 41518, 41518, 41606, 41606, 41606, 41606, 41606, 41606, 41606, 41606, 41606, 41606, 41606, 41606, 41606, 41606, 41606, 41606, 41606, 41606, 41613, 41613, 41613, 41613, 41613, 41613, 41613, 41613, 41613, 41613, 41613, 41613, 41613, 41613, 41613, 41613, 41613, 41613]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [132, 133, 49, 161, 113, 19, 32, 100, 37, 109, 209, 210, 14, 169, 89, 66, 152, 122, 3, 43, 93, 140, 146, 53, 173, 8, 47, 121, 33, 189, 107, 21, 207, 179, 187, 88, 69, 45, 36, 22, 124, 35, 135, 99, 176, 132, 147, 109, 42, 104, 150, 151, 46, 47, 99, 100, 126, 156, 21, 108, 137, 118, 65, 26, 110, 173, 92, 17, 147, 82, 10, 192, 45, 87, 88, 154, 115, 169, 150, 120, 25, 137, 24, 187, 217, 110, 3, 37, 36, 58]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["41152_132", "41152_133", "41152_49", "41152_161", "41152_113", "41152_19", "41152_32", "41152_100", "41152_37", "41152_109", "41152_209", "41152_210", "41152_14", "41152_169", "41152_89", "41152_66", "41152_152", "41152_122", "41436_3", "41436_43", "41436_93", "41436_140", "41436_146", "41436_53", "41436_173", "41436_8", "41436_47", "41436_121", "41436_33", "41436_189", "41436_107", "41436_21", "41436_207", "41436_179", "41436_187", "41436_88", "41518_69", "41518_45", "41518_36", "41518_22", "41518_124", "41518_35", "41518_135", "41518_99", "41518_176", "41518_132", "41518_147", "41518_109", "41518_42", "41518_104", "41518_150", "41518_151", "41518_46", "41518_47", "41606_99", "41606_100", "41606_126", "41606_156", "41606_21", "41606_108", "41606_137", "41606_118", "41606_65", "41606_26", "41606_110", "41606_173", "41606_92", "41606_17", "41606_147", "41606_82", "41606_10", "41606_192", "41613_45", "41613_87", "41613_88", "41613_154", "41613_115", "41613_169", "41613_150", "41613_120", "41613_25", "41613_137", "41613_24", "41613_187", "41613_217", "41613_110", "41613_3", "41613_37", "41613_36", "41613_58"]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [1686258.55368, 1685958.55368, 1685508.55368, 1688658.55368, 1689258.55368, 1688208.55368, 1685808.55368, 1689708.55368, 1688808.55368, 1688058.55368, 1687758.55368, 1688058.55368, 1686258.55368, 1687758.55368, 1687008.55368, 1688058.55368, 1687608.55368, 1688058.55368, 1767108.55368, 1766058.55368, 1764558.55368, 1766358.55368, 1766658.55368, 1767408.55368, 1767708.55368, 1768608.55368, 1764858.55368, 1766508.55368, 1764258.55368, 1765158.55368, 1764558.55368, 1767558.55368, 1765608.55368, 1765008.55368, 1765758.55368, 1766058.55368, 1703958.55368, 1701708.55368, 1703508.55368, 1704108.55368, 1703658.55368, 1703208.55368, 1703208.55368, 1704408.55368, 1702158.55368, 1701258.55368, 1703208.55368, 1703058.55368, 1702608.55368, 1701708.55368, 1704108.55368, 1704408.55368, 1701408.55368, 1701108.55368, 1685658.55368, 1685958.55368, 1685508.55368, 1682658.55368, 1685058.55368, 1684008.55368, 1685058.55368, 1682808.55368, 1684008.55368, 1683858.55368, 1684608.55368, 1685208.55368, 1682358.55368, 1681608.55368, 1684458.55368, 1684758.55368, 1683708.55368, 1684758.55368, 1735458.55368, 1736358.55368, 1736058.55368, 1735758.55368, 1736208.55368, 1736508.55368, 1737858.55368, 1734708.55368, 1738758.55368, 1737558.55368, 1738458.55368, 1735758.55368, 1735308.55368, 1737108.55368, 1737108.55368, 1737558.55368, 1737258.55368, 1736208.55368]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [5863941.79478, 5863941.79478, 5864721.21764, 5866539.87099, 5866020.25575, 5865240.83288, 5865240.83288, 5864201.6024, 5864721.21764, 5866020.25575, 5862902.56429, 5862902.56429, 5864981.02526, 5863422.17953, 5865760.44813, 5864461.41002, 5863681.98716, 5863941.79478, 5871476.21579, 5871216.40817, 5872255.63865, 5872775.2539, 5870177.17768, 5871995.83103, 5869917.37006, 5871476.21579, 5871216.40817, 5870436.98531, 5871736.02341, 5873294.86914, 5870696.79293, 5871736.02341, 5873554.67676, 5869917.37006, 5873294.86914, 5872255.63865, 5873121.66406, 5873381.47168, 5873381.47168, 5873901.08692, 5872602.04881, 5873381.47168, 5874940.31741, 5872861.85644, 5872082.43357, 5872602.04881, 5872342.24119, 5874680.50979, 5873381.47168, 5872861.85644, 5872342.24119, 5872342.24119, 5873381.47168, 5873381.47168, 5875026.91995, 5875026.91995, 5874767.11232, 5874507.3047, 5876066.15043, 5876845.57329, 5877105.38092, 5876845.57329, 5875286.72757, 5876066.15043, 5876845.57329, 5874247.49708, 5876585.76567, 5875806.34281, 5874507.3047, 5876585.76567, 5875806.34281, 5873987.68946, 5875546.53519, 5876585.76567, 5876585.76567, 5874507.3047, 5876845.57329, 5874247.49708, 5874507.3047, 5876845.57329, 5876066.15043, 5877105.38092, 5876066.15043, 5877624.99616, 5873727.88184, 5876845.57329, 5875806.34281, 5875546.53519, 5875546.53519, 5876325.95805]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0.40342814, 0.40342814, 0.36217903, 0.35973557, 0.32798872, 0.32507445, 0.31730125, 0.30862324, 0.29980423, 0.2940333, 0.28505862, 0.28505862, 0.28180574, 0.24703335, 0.24504619, 0.23411359, 0.22479301, 0.22381106, 0.40862026, 0.3909828, 0.31873518, 0.31246209, 0.31146035, 0.30678784, 0.30345934, 0.28679872, 0.28477196, 0.27592136, 0.27532863, 0.26792391, 0.26495894, 0.26467146, 0.25503759, 0.24565751, 0.24254606, 0.23057083, 0.37132208, 0.35125169, 0.34078834, 0.31798178, 0.28171585, 0.25122926, 0.25122926, 0.25088787, 0.20903761, 0.20122615, 0.19978533, 0.19867584, 0.19847361, 0.18701402, 0.17482879, 0.1715543, 0.17022513, 0.16505528, 0.48288478, 0.43824054, 0.42277381, 0.3111055, 0.28981107, 0.27867194, 0.27787648, 0.26811447, 0.25782059, 0.25444941, 0.25401984, 0.23410594, 0.22744819, 0.21819951, 0.21553798, 0.20467833, 0.19113425, 0.18293998, 0.46564352, 0.41505338, 0.37129887, 0.34869503, 0.32160847, 0.31191911, 0.28550103, 0.26218057, 0.26003387, 0.25018194, 0.24825808, 0.2449977, 0.24311579, 0.24294628, 0.23530658, 0.22061783, 0.22041222, 0.20849948]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2]
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
              "value": [820722.34415638, 13028604.18447694, 900533.73664659, 13066444.9538622]
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
                  "value": ["EPSG:3161"]
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
              "value": [821131.81366289, 13053171.46115426]
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
              "value": [820852.67237993, 13053282.37430713]
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
              "value": [820722.34415638, 13054173.33976986]
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
              "value": [824326.25559581, 13054699.44024841]
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
              "value": [824692.26991128, 13053994.53056465]
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
              "value": [823426.87993502, 13053658.15562043]
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
              "value": [821193.74513042, 13054545.49397142]
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
              "value": [824438.04677472, 13052137.46961229]
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
              "value": [823792.89581128, 13052953.26501491]
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
              "value": [823575.70605772, 13054438.21186364]
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
              "value": [822142.99711455, 13051650.80602382]
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
              "value": [822422.13515529, 13051539.8949357]
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
              "value": [821516.32980694, 13054137.5845561]
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
              "value": [822335.25553826, 13052133.846874]
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
              "value": [822502.57700733, 13054584.89469354]
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
              "value": [822998.9156476, 13052989.02923428]
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
              "value": [822291.81558641, 13052430.82599584]
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
              "value": [822806.65439361, 13052505.97913769]
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
              "value": [899138.44508427, 13030274.30882096]
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
              "value": [898065.5158299, 13030421.33995944]
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
              "value": [897055.08665832, 13031941.69664066]
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
              "value": [898921.90187486, 13031758.60600112]
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
              "value": [898238.75518401, 13029233.93446228]
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
              "value": [899609.94781867, 13030646.07470798]
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
              "value": [899119.23596824, 13028604.18447694]
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
              "value": [900533.73664659, 13029719.44666056]
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
              "value": [896949.27283483, 13030865.22255613]
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
              "value": [898195.44554371, 13029530.78290064]
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
              "value": [896583.58580456, 13031569.91383157]
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
              "value": [897998.09425617, 13032685.26806891]
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
              "value": [896477.77508524, 13030493.44848365]
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
              "value": [899653.25534986, 13030349.21855795]
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
              "value": [898512.91104153, 13032760.18508105]
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
              "value": [896607.71282408, 13029602.89134687]
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
              "value": [898556.22083467, 13032463.31514867]
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
              "value": [898450.39761437, 13031386.82921477]
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
              "value": [840997.92409458, 13055160.61493684]
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
              "value": [839000.57509717, 13056234.25925309]
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
              "value": [840675.38119243, 13055568.57041948]
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
              "value": [841425.96184377, 13055829.74126444]
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
              "value": [840526.47930718, 13054788.50038756]
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
              "value": [840396.24767695, 13055679.51891203]
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
              "value": [840973.18922152, 13057128.75347098]
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
              "value": [841320.46554332, 13054752.6626356]
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
              "value": [838938.50608766, 13054860.16606161]
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
              "value": [838293.41068235, 13055676.06696659]
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
              "value": [840011.62542014, 13054713.38950452]
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
              "value": [840737.46395825, 13056942.68708112]
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
              "value": [839837.97964536, 13055901.41547295]
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
              "value": [838808.26653063, 13055751.18431965]
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
              "value": [840849.02121318, 13054380.55257896]
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
              "value": [841128.15247664, 13054269.60665385]
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
              "value": [838721.43958109, 13056345.2068966]
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
              "value": [838442.30373176, 13056456.15439841]
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
              "value": [824675.23681634, 13063699.78585223]
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
              "value": [824954.39173004, 13063588.84093568]
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
              "value": [824439.51992889, 13063513.6708524]
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
              "value": [821691.39707686, 13064326.03927522]
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
              "value": [824501.48414594, 13064888.04331225]
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
              "value": [823812.85093225, 13066001.15755592]
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
              "value": [824886.0466919, 13065854.43350427]
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
              "value": [822696.21201653, 13066444.9538622]
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
              "value": [823236.01695054, 13064551.57298121]
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
              "value": [823384.85357518, 13065331.83251491]
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
              "value": [824371.16841036, 13065779.25854032]
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
              "value": [823968.0876634, 13063141.44261038]
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
              "value": [822181.33309085, 13066369.77182414]
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
              "value": [821195.02065379, 13065922.32826276]
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
              "value": [823366.33769437, 13063660.38535098]
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
              "value": [824414.60711938, 13065482.1847199]
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
              "value": [823149.13583961, 13065145.70852422]
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
              "value": [823453.21762378, 13063066.27082666]
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
              "value": [871202.7722954, 13045763.92831878]
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
              "value": [872424.8455597, 13046396.88470543]
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
              "value": [872145.74498505, 13046507.85750954]
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
              "value": [871097.10479721, 13044687.10829322]
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
              "value": [872381.48939415, 13046693.84112217]
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
              "value": [871698.65816552, 13044168.23373196]
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
              "value": [873050.78643358, 13043910.3383148]
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
              "value": [870985.98071356, 13047248.7071787]
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
              "value": [874465.24521023, 13045026.17390458]
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
              "value": [873733.63573074, 13046435.92675828]
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
              "value": [874186.14797741, 13045137.14629972]
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
              "value": [872251.42014634, 13047584.72261402]
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
              "value": [870389.88518051, 13044129.18066468]
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
              "value": [873218.79053808, 13046360.91987319]
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
              "value": [872834.01201319, 13045395.05657735]
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
              "value": [873156.46512732, 13044987.13854197]
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
              "value": [872877.36716817, 13045098.108915]
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
              "value": [872189.10150343, 13046210.90243907]
            }
          ]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0.95999704, 0.95999704, 0.86184071, 0.85602627, 0.78048151, 0.7735467, 0.7550496, 0.73439943, 0.71341373, 0.69968124, 0.67832509, 0.67832509, 0.67058454, 0.58784023, 0.58311157, 0.55709638, 0.53491713, 0.53258049, 0.93926446, 0.89872256, 0.73265242, 0.71823294, 0.71593033, 0.70518998, 0.697539, 0.65924251, 0.65458373, 0.63423955, 0.63287708, 0.6158564, 0.60904106, 0.60838024, 0.58623561, 0.56467432, 0.55752227, 0.52999571, 0.87854255, 0.8310563, 0.80630016, 0.75234019, 0.66653553, 0.59440471, 0.59440471, 0.59359698, 0.49457989, 0.4760981, 0.47268914, 0.4700641, 0.46958562, 0.44247241, 0.41364233, 0.40589493, 0.40275014, 0.39051835, 0.892427, 0.80991927, 0.78133496, 0.57495898, 0.53560442, 0.51501801, 0.51354791, 0.49550659, 0.47648231, 0.47025197, 0.46945809, 0.43265488, 0.4203506, 0.40325797, 0.39833914, 0.37826926, 0.35323822, 0.33809427, 0.94156062, 0.83926416, 0.75078977, 0.70508338, 0.65031266, 0.63072016, 0.57730113, 0.53014567, 0.52580492, 0.50588368, 0.50199352, 0.49540083, 0.49159549, 0.49125274, 0.47580477, 0.44610319, 0.44568745, 0.42159913]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU", "ARU"]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary", "Primary"]
        }
      ]
    }

---

    {
      "type": "list",
      "attributes": {
        "row.names": {
          "type": "integer",
          "attributes": {},
          "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90]
        },
        "names": {
          "type": "character",
          "attributes": {},
          "value": ["SW_ID", "ID", "COMP_ID", "X", "Y", "benefit", "num_runs", "nsamples", "geometry", "scaled_benefit", "running_value", "total_value", "mean_value", "origin", "lineid", "linepoint", "route"]
        },
        "class": {
          "type": "character",
          "attributes": {},
          "value": ["sf", "tbl_df", "tbl", "data.frame"]
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
              "value": ["SW_ID", "ID", "COMP_ID", "X", "Y", "benefit", "num_runs", "nsamples", "scaled_benefit", "running_value", "total_value", "mean_value", "origin", "lineid", "linepoint", "route"]
            }
          },
          "value": ["NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA", "NA"]
        }
      },
      "value": [
        {
          "type": "double",
          "attributes": {},
          "value": [41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41152, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41436, 41518, 41518, 41518, 41518, 41518, 41518, 41518, 41518, 41518, 41518, 41518, 41518, 41518, 41518, 41518, 41518, 41518, 41518, 41606, 41606, 41606, 41606, 41606, 41606, 41606, 41606, 41606, 41606, 41606, 41606, 41606, 41606, 41606, 41606, 41606, 41606, 41613, 41613, 41613, 41613, 41613, 41613, 41613, 41613, 41613, 41613, 41613, 41613, 41613, 41613, 41613, 41613, 41613, 41613]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [121, 152, 169, 190, 209, 210, 107, 132, 133, 16, 49, 79, 122, 19, 2, 34, 66, 94, 19, 20, 21, 3, 4, 53, 101, 121, 122, 146, 43, 73, 15, 16, 33, 47, 64, 93, 34, 35, 36, 37, 42, 69, 104, 45, 46, 47, 76, 77, 124, 125, 126, 150, 151, 99, 100, 126, 127, 150, 173, 99, 108, 109, 110, 21, 53, 82, 1, 10, 2, 26, 42, 65, 108, 115, 58, 80, 87, 88, 125, 150, 3, 36, 68, 97, 24, 25, 37, 5, 6, 7]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["41152_121", "41152_152", "41152_169", "41152_190", "41152_209", "41152_210", "41152_107", "41152_132", "41152_133", "41152_16", "41152_49", "41152_79", "41152_122", "41152_19", "41152_2", "41152_34", "41152_66", "41152_94", "41436_19", "41436_20", "41436_21", "41436_3", "41436_4", "41436_53", "41436_101", "41436_121", "41436_122", "41436_146", "41436_43", "41436_73", "41436_15", "41436_16", "41436_33", "41436_47", "41436_64", "41436_93", "41518_34", "41518_35", "41518_36", "41518_37", "41518_42", "41518_69", "41518_104", "41518_45", "41518_46", "41518_47", "41518_76", "41518_77", "41518_124", "41518_125", "41518_126", "41518_150", "41518_151", "41518_99", "41606_100", "41606_126", "41606_127", "41606_150", "41606_173", "41606_99", "41606_108", "41606_109", "41606_110", "41606_21", "41606_53", "41606_82", "41606_1", "41606_10", "41606_2", "41606_26", "41606_42", "41606_65", "41613_108", "41613_115", "41613_58", "41613_80", "41613_87", "41613_88", "41613_125", "41613_150", "41613_3", "41613_36", "41613_68", "41613_97", "41613_24", "41613_25", "41613_37", "41613_5", "41613_6", "41613_7"]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [1687758.55368, 1687608.55368, 1687758.55368, 1687908.55368, 1687758.55368, 1688058.55368, 1685808.55368, 1686258.55368, 1685958.55368, 1685658.55368, 1685508.55368, 1685658.55368, 1688058.55368, 1688208.55368, 1688058.55368, 1687908.55368, 1688058.55368, 1687908.55368, 1766958.55368, 1767258.55368, 1767558.55368, 1767108.55368, 1767408.55368, 1767408.55368, 1766358.55368, 1766508.55368, 1766808.55368, 1766658.55368, 1766058.55368, 1766208.55368, 1764708.55368, 1764408.55368, 1764258.55368, 1764858.55368, 1764408.55368, 1764558.55368, 1702908.55368, 1703208.55368, 1703508.55368, 1703808.55368, 1702608.55368, 1703958.55368, 1701708.55368, 1701708.55368, 1701408.55368, 1701108.55368, 1701558.55368, 1701258.55368, 1703658.55368, 1703958.55368, 1704258.55368, 1704108.55368, 1704408.55368, 1704408.55368, 1685958.55368, 1685508.55368, 1685808.55368, 1685358.55368, 1685208.55368, 1685658.55368, 1684008.55368, 1684308.55368, 1684608.55368, 1685058.55368, 1684908.55368, 1684758.55368, 1684008.55368, 1683708.55368, 1684308.55368, 1683858.55368, 1683858.55368, 1684008.55368, 1736508.55368, 1736208.55368, 1736208.55368, 1736658.55368, 1736358.55368, 1736058.55368, 1737708.55368, 1737858.55368, 1737108.55368, 1737258.55368, 1737408.55368, 1737558.55368, 1738458.55368, 1738758.55368, 1737558.55368, 1737708.55368, 1738008.55368, 1738308.55368]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [5863941.79478, 5863681.98716, 5863422.17953, 5863162.37191, 5862902.56429, 5862902.56429, 5864201.6024, 5863941.79478, 5863941.79478, 5864981.02526, 5864721.21764, 5864461.41002, 5863941.79478, 5865240.83288, 5864981.02526, 5864721.21764, 5864461.41002, 5864201.6024, 5871736.02341, 5871736.02341, 5871736.02341, 5871476.21579, 5871476.21579, 5871995.83103, 5870696.79293, 5870436.98531, 5870436.98531, 5870177.17768, 5871216.40817, 5870956.60055, 5871476.21579, 5871476.21579, 5871736.02341, 5871216.40817, 5871995.83103, 5872255.63865, 5873381.47168, 5873381.47168, 5873381.47168, 5873381.47168, 5873381.47168, 5873121.66406, 5872861.85644, 5873381.47168, 5873381.47168, 5873381.47168, 5873121.66406, 5873121.66406, 5872602.04881, 5872602.04881, 5872602.04881, 5872342.24119, 5872342.24119, 5872861.85644, 5875026.91995, 5874767.11232, 5874767.11232, 5874507.3047, 5874247.49708, 5875026.91995, 5876845.57329, 5876845.57329, 5876845.57329, 5876066.15043, 5876325.95805, 5876585.76567, 5875806.34281, 5875806.34281, 5875806.34281, 5876066.15043, 5875546.53519, 5875286.72757, 5876845.57329, 5876845.57329, 5876325.95805, 5876585.76567, 5876585.76567, 5876585.76567, 5874767.11232, 5874507.3047, 5875806.34281, 5875546.53519, 5875286.72757, 5875026.91995, 5876066.15043, 5876066.15043, 5875546.53519, 5875806.34281, 5875806.34281, 5875806.34281]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0.22900222, 0.22479301, 0.24703335, 0.27906609, 0.28505862, 0.28505862, 0.33237174, 0.40342814, 0.40342814, 0.30718041, 0.36217903, 0.25834694, 0.22381106, 0.32507445, 0.22635036, 0.31934416, 0.23411359, 0.33955851, 0.26420197, 0.34825552, 0.26467146, 0.40862026, 0.33923579, 0.30678784, 0.29949176, 0.27592136, 0.32142303, 0.31146035, 0.3909828, 0.22421253, 0.24557221, 0.32300513, 0.27532863, 0.28477196, 0.35417974, 0.31873518, 0.22715659, 0.25122926, 0.34078834, 0.17321462, 0.19847361, 0.37132208, 0.18701402, 0.35125169, 0.17022513, 0.16505528, 0.19520313, 0.21216127, 0.28171585, 0.17728219, 0.18009252, 0.17482879, 0.1715543, 0.25088787, 0.43824054, 0.42277381, 0.27778152, 0.20073618, 0.23410594, 0.48288478, 0.27867194, 0.1833462, 0.25401984, 0.28981107, 0.25994279, 0.20467833, 0.19529652, 0.19113425, 0.21776661, 0.25444941, 0.19423489, 0.25782059, 0.44234993, 0.32160847, 0.20849948, 0.21593559, 0.41505338, 0.37129887, 0.23745483, 0.28550103, 0.23530658, 0.22041222, 0.26672513, 0.25121723, 0.24825808, 0.26003387, 0.22061783, 0.2599408, 0.22317903, 0.29083271]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200, 200]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2]
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
              "value": [820722.34415638, 13029233.93446228, 899653.25534986, 13066001.15755592]
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
                  "value": ["EPSG:3161"]
                },
                {
                  "type": "character",
                  "attributes": {},
                  "value": ["PROJCRS[\"NAD83 / Ontario MNR Lambert\",\n    BASEGEOGCRS[\"NAD83\",\n        DATUM[\"North American Datum 1983\",\n            ELLIPSOID[\"GRS 1980\",6378137,298.257222101,\n                LENGTHUNIT[\"metre\",1]]],\n        PRIMEM[\"Greenwich\",0,\n            ANGLEUNIT[\"degree\",0.0174532925199433]],\n        ID[\"EPSG\",4269]],\n    CONVERSION[\"Ontario MNR Lambert\",\n        METHOD[\"Lambert Conic Conformal (2SP)\",\n            ID[\"EPSG\",9802]],\n        PARAMETER[\"Latitude of false origin\",0,\n            ANGLEUNIT[\"degree\",0.0174532925199433],\n            ID[\"EPSG\",8821]],\n        PARAMETER[\"Longitude of false origin\",-85,\n            ANGLEUNIT[\"degree\",0.0174532925199433],\n            ID[\"EPSG\",8822]],\n        PARAMETER[\"Latitude of 1st standard parallel\",44.5,\n            ANGLEUNIT[\"degree\",0.0174532925199433],\n            ID[\"EPSG\",8823]],\n        PARAMETER[\"Latitude of 2nd standard parallel\",53.5,\n            ANGLEUNIT[\"degree\",0.0174532925199433],\n            ID[\"EPSG\",8824]],\n        PARAMETER[\"Easting at false origin\",930000,\n            LENGTHUNIT[\"metre\",1],\n            ID[\"EPSG\",8826]],\n        PARAMETER[\"Northing at false origin\",6430000,\n            LENGTHUNIT[\"metre\",1],\n            ID[\"EPSG\",8827]]],\n    CS[Cartesian,2],\n        AXIS[\"(E)\",east,\n            ORDER[1],\n            LENGTHUNIT[\"metre\",1]],\n        AXIS[\"(N)\",north,\n            ORDER[2],\n            LENGTHUNIT[\"metre\",1]],\n    USAGE[\n        SCOPE[\"Province-wide spatial data management.\"],\n        AREA[\"Canada - Ontario.\"],\n        BBOX[41.67,-95.16,56.9,-74.35]],\n    ID[\"EPSG\",3161]]"]
                }
              ]
            },
            "classes": {
              "type": "character",
              "attributes": {},
              "value": []
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
              "value": [822527.51510148, 13052616.89317583]
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
              "value": [822291.81558641, 13052430.82599584]
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
              "value": [822335.25553826, 13052133.846874]
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
              "value": [822378.69540691, 13051836.86988543]
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
              "value": [822142.99711455, 13051650.80602382]
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
              "value": [822422.13515529, 13051539.8949357]
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
              "value": [820809.22975835, 13053579.3607469]
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
              "value": [821131.81366289, 13053171.46115426]
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
              "value": [820852.67237993, 13053282.37430713]
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
              "value": [820958.04440924, 13054359.41663215]
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
              "value": [820722.34415638, 13054173.33976986]
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
              "value": [820765.78701714, 13053876.34923397]
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
              "value": [822806.65439361, 13052505.97913769]
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
              "value": [823426.87993502, 13053658.15562043]
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
              "value": [823191.17804057, 13053472.08479391]
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
              "value": [822955.47661421, 13053286.01444185]
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
              "value": [822998.9156476, 13052989.02923428]
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
              "value": [822763.2151219, 13052802.96092189]
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
              "value": [899095.13671177, 13030571.16434296]
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
              "value": [899374.19620297, 13030460.19151649]
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
              "value": [899653.25534986, 13030349.21855795]
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
              "value": [899138.44508427, 13030274.30882096]
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
              "value": [899417.50408557, 13030163.3366531]
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
              "value": [899609.94781867, 13030646.07470798]
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
              "value": [898152.13576507, 13029827.63327981]
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
              "value": [898195.44554371, 13029530.78290064]
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
              "value": [898474.50396243, 13029419.8138925]
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
              "value": [898238.75518401, 13029233.93446228]
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
              "value": [898065.5158299, 13030421.33995944]
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
              "value": [898108.8258481, 13030124.48560127]
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
              "value": [896905.96068262, 13031162.08140138]
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
              "value": [896626.89858424, 13031273.05237803]
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
              "value": [896583.58580456, 13031569.91383157]
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
              "value": [896949.27283483, 13030865.22255613]
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
              "value": [896819.33596435, 13031755.80494003]
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
              "value": [897055.08665832, 13031941.69664066]
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
              "value": [840117.1138279, 13055790.46726321]
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
              "value": [840396.24767695, 13055679.51891203]
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
              "value": [840675.38119243, 13055568.57041948]
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
              "value": [840954.51437431, 13055457.6217856]
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
              "value": [839837.97964536, 13055901.41547295]
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
              "value": [840997.92409458, 13055160.61493684]
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
              "value": [838808.26653063, 13055751.18431965]
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
              "value": [839000.57509717, 13056234.25925309]
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
              "value": [838721.43958109, 13056345.2068966]
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
              "value": [838442.30373176, 13056456.15439841]
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
              "value": [838764.85313585, 13056048.1946224]
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
              "value": [838485.7177656, 13056159.14144574]
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
              "value": [840526.47930718, 13054788.50038756]
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
              "value": [840805.61138412, 13054677.55392753]
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
              "value": [841084.7431273, 13054566.60732599]
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
              "value": [840849.02121318, 13054380.55257896]
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
              "value": [841128.15247664, 13054269.60665385]
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
              "value": [841320.46554332, 13054752.6626356]
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
              "value": [824954.39173004, 13063588.84093568]
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
              "value": [824439.51992889, 13063513.6708524]
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
              "value": [824718.67469702, 13063402.7267646]
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
              "value": [824203.80354456, 13063327.55643854]
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
              "value": [823968.0876634, 13063141.44261038]
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
              "value": [824675.23681634, 13063699.78585223]
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
              "value": [823812.85093225, 13066001.15755592]
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
              "value": [824092.00983632, 13065890.20811995]
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
              "value": [824371.16841036, 13065779.25854032]
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
              "value": [824501.48414594, 13064888.04331225]
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
              "value": [824458.04571026, 13065185.11300871]
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
              "value": [824414.60711938, 13065482.1847199]
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
              "value": [823428.29383207, 13065034.76227037]
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
              "value": [823149.13583961, 13065145.70852422]
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
              "value": [823707.45149442, 13064923.81587246]
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
              "value": [823384.85357518, 13065331.83251491]
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
              "value": [823192.57645407, 13064848.63969989]
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
              "value": [823236.01695054, 13064551.57298121]
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
              "value": [872660.59011426, 13046582.867507]
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
              "value": [872381.48939415, 13046693.84112217]
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
              "value": [872189.10150343, 13046210.90243907]
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
              "value": [872703.94579557, 13046285.9117667]
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
              "value": [872424.8455597, 13046396.88470543]
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
              "value": [872145.74498505, 13046507.85750954]
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
              "value": [873007.43180568, 13044207.27792331]
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
              "value": [873050.78643358, 13043910.3383148]
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
              "value": [872834.01201319, 13045395.05657735]
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
              "value": [872877.36716817, 13045098.108915]
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
              "value": [872920.72219144, 13044801.16326838]
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
              "value": [872964.07704594, 13044504.21954303]
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
              "value": [874186.14797741, 13045137.14629972]
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
              "value": [874465.24521023, 13045026.17390458]
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
              "value": [873156.46512732, 13044987.13854197]
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
              "value": [873392.20856162, 13045173.11434791]
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
              "value": [873671.30632723, 13045062.14303109]
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
              "value": [873950.40375372, 13044951.17157958]
            }
          ]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [0.54493337, 0.53491713, 0.58784023, 0.66406527, 0.67832509, 0.67832509, 0.79091134, 0.95999704, 0.95999704, 0.73096608, 0.86184071, 0.61476202, 0.53258049, 0.7735467, 0.538623, 0.75991092, 0.55709638, 0.80801297, 0.60730106, 0.80050859, 0.60838024, 0.93926446, 0.77977562, 0.70518998, 0.68841902, 0.63423955, 0.73883077, 0.71593033, 0.89872256, 0.51538037, 0.56447825, 0.74246743, 0.63287708, 0.65458373, 0.81412616, 0.73265242, 0.53744914, 0.59440471, 0.80630016, 0.40982322, 0.46958562, 0.87854255, 0.44247241, 0.8310563, 0.40275014, 0.39051835, 0.46184772, 0.50197042, 0.66653553, 0.41944704, 0.42609623, 0.41364233, 0.40589493, 0.59359698, 0.80991927, 0.78133496, 0.51337242, 0.3709837, 0.43265488, 0.892427, 0.51501801, 0.33884502, 0.46945809, 0.53560442, 0.48040437, 0.37826926, 0.36093059, 0.35323822, 0.40245792, 0.47025197, 0.35896857, 0.47648231, 0.89445951, 0.65031266, 0.42159913, 0.43663541, 0.83926416, 0.75078977, 0.48014868, 0.57730113, 0.47580477, 0.44568745, 0.53933507, 0.50797712, 0.50199352, 0.52580492, 0.44610319, 0.52561673, 0.45128211, 0.58808212]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [8, 8, 8, 8, 8, 8, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [8, 8, 8, 8, 8, 8, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [1.6, 1.6, 1.6, 1.6, 1.6, 1.6, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.6, 1.6, 1.6, 1.6, 1.6, 1.6, 1.6, 1.6, 1.6, 1.6, 1.6, 1.6, 1.6, 1.6, 1.6, 1.6, 1.6, 1.6, 1.6, 1.6, 1.6, 1.6, 1.6, 1.6, 1.6, 1.6, 1.6, 1.6, 1.6, 1.6, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.6, 1.6, 1.6, 1.6, 1.6, 1.6, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4, 1.4]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["41152_209", "41152_209", "41152_209", "41152_209", "41152_209", "41152_209", "41152_132", "41152_132", "41152_132", "41152_132", "41152_132", "41152_132", "41152_19", "41152_19", "41152_19", "41152_19", "41152_19", "41152_19", "41436_3", "41436_3", "41436_3", "41436_3", "41436_3", "41436_3", "41436_43", "41436_43", "41436_43", "41436_43", "41436_43", "41436_43", "41436_93", "41436_93", "41436_93", "41436_93", "41436_93", "41436_93", "41518_69", "41518_69", "41518_69", "41518_69", "41518_69", "41518_69", "41518_45", "41518_45", "41518_45", "41518_45", "41518_45", "41518_45", "41518_124", "41518_124", "41518_124", "41518_124", "41518_124", "41518_124", "41606_99", "41606_99", "41606_99", "41606_99", "41606_99", "41606_99", "41606_21", "41606_21", "41606_21", "41606_21", "41606_21", "41606_21", "41606_65", "41606_65", "41606_65", "41606_65", "41606_65", "41606_65", "41613_87", "41613_87", "41613_87", "41613_87", "41613_87", "41613_87", "41613_150", "41613_150", "41613_150", "41613_150", "41613_150", "41613_150", "41613_25", "41613_25", "41613_25", "41613_25", "41613_25", "41613_25"]
        },
        {
          "type": "integer",
          "attributes": {},
          "value": [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["p5", "p4", "p3", "p2", "p0", "p1", "p2", "p0", "p1", "p5", "p4", "p3", "p5", "p0", "p1", "p2", "p3", "p4", "p5", "p4", "p2", "p0", "p1", "p3", "p2", "p3", "p5", "p4", "p0", "p1", "p4", "p3", "p2", "p5", "p1", "p0", "p4", "p3", "p2", "p1", "p5", "p0", "p5", "p0", "p1", "p2", "p4", "p3", "p0", "p1", "p4", "p2", "p3", "p5", "p1", "p3", "p2", "p4", "p5", "p0", "p5", "p4", "p3", "p0", "p1", "p2", "p4", "p2", "p5", "p3", "p1", "p0", "p4", "p3", "p1", "p5", "p0", "p2", "p1", "p0", "p5", "p4", "p3", "p2", "p1", "p0", "p5", "p4", "p3", "p2"]
        },
        {
          "type": "integer",
          "attributes": {},
          "value": [1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3]
        }
      ]
    }

