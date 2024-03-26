# create_sites()

    {
      "type": "list",
      "attributes": {
        "names": {
          "type": "character",
          "attributes": {},
          "value": ["hex_id", "site_id", "geometry"]
        },
        "row.names": {
          "type": "integer",
          "attributes": {},
          "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91]
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
              "value": ["hex_id", "site_id"]
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
          "value": ["NA", "NA"]
        },
        "class": {
          "type": "character",
          "attributes": {},
          "value": ["sf", "tbl_df", "tbl", "data.frame"]
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
          "value": ["SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09"]
        },
        {
          "type": "integer",
          "attributes": {},
          "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91]
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
              "value": [3.34936491, 18.30127019, 46.65063509, 68.30127019]
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
            "classes": {
              "type": "character",
              "attributes": {},
              "value": ["GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION", "GEOMETRYCOLLECTION"]
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
              "value": [25, 18.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [29.33012702, 20.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [33.66025404, 23.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.99038106, 25.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [42.32050808, 28.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [46.65063509, 30.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 20.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 23.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [29.33012702, 25.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [33.66025404, 28.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.99038106, 30.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [42.32050808, 33.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [46.65063509, 35.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [16.33974596, 23.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 25.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 28.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [29.33012702, 30.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [33.66025404, 33.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.99038106, 35.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [42.32050808, 38.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [46.65063509, 40.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [12.00961894, 25.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [16.33974596, 28.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 30.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 33.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [29.33012702, 35.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [33.66025404, 38.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.99038106, 40.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [42.32050808, 43.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [46.65063509, 45.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [7.67949192, 28.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [12.00961894, 30.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [16.33974596, 33.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 35.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 38.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [29.33012702, 40.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [33.66025404, 43.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.99038106, 45.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [42.32050808, 48.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [46.65063509, 50.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [3.34936491, 30.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [7.67949192, 33.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [12.00961894, 35.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [16.33974596, 38.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 40.80127019]
            },
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
              "value": [29.33012702, 45.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [33.66025404, 48.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.99038106, 50.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [42.32050808, 53.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [46.65063509, 55.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [3.34936491, 35.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [7.67949192, 38.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [12.00961894, 40.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [16.33974596, 43.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 45.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 48.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [29.33012702, 50.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [33.66025404, 53.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.99038106, 55.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [42.32050808, 58.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [3.34936491, 40.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [7.67949192, 43.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [12.00961894, 45.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [16.33974596, 48.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 50.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 53.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [29.33012702, 55.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [33.66025404, 58.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.99038106, 60.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [3.34936491, 45.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [7.67949192, 48.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [12.00961894, 50.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [16.33974596, 53.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 55.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 58.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [29.33012702, 60.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [33.66025404, 63.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [3.34936491, 50.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [7.67949192, 53.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [12.00961894, 55.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [16.33974596, 58.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 60.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 63.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [29.33012702, 65.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [3.34936491, 55.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [7.67949192, 58.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [12.00961894, 60.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [16.33974596, 63.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 65.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 68.30127019]
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
          "value": ["hex_id", "site_id", "geometry", "province"]
        },
        "row.names": {
          "type": "integer",
          "attributes": {},
          "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 258, 259, 260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 276, 277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 287, 288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298, 299, 300, 301, 302, 303, 304, 305, 306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 316, 317, 318, 319, 320, 321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331, 332, 333, 334, 335, 336, 337, 338, 339, 340, 341, 342, 343, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379, 380, 381, 382, 383, 384, 385, 386, 387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 397, 398, 399, 400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 418, 419, 420, 421, 422, 423, 424, 425, 426, 427, 428, 429, 430, 431, 432, 433, 434, 435, 436, 437, 438, 439, 440, 441, 442, 443, 444, 445, 446, 447, 448, 449, 450, 451, 452, 453, 454, 455, 456, 457, 458, 459, 460, 461, 462, 463, 464, 465, 466, 467, 468, 469, 470, 471, 472, 473, 474, 475, 476, 477, 478, 479, 480, 481, 482, 483, 484, 485, 486, 487, 488, 489, 490, 491, 492, 493, 494, 495, 496, 497, 498, 499, 500, 501, 502, 503, 504, 505, 506, 507, 508, 509, 510, 511, 512, 513, 514, 515, 516, 517, 518, 519, 520, 521, 522, 523, 524, 525, 526, 527, 528, 529, 530, 531, 532, 533, 534, 535, 536, 537, 538, 539, 540, 541, 542, 543, 544, 545, 546, 547, 548, 549, 550, 551, 552, 553, 554, 555, 556, 557, 558, 559, 560, 561, 562, 563, 564, 565, 566, 567, 568, 569, 570, 571, 572, 573, 574, 575, 576, 577, 578, 579, 580, 581, 582, 583, 584, 585, 586, 587, 588, 589, 590, 591, 592, 593, 594, 595, 596, 597, 598, 599, 600, 601, 602, 603, 604, 605, 606, 607, 608, 609, 610, 611, 612, 613, 614, 615, 616, 617, 618, 619, 620, 621, 622, 623, 624, 625, 626, 627, 628, 629, 630, 631, 632, 633, 634, 635, 636, 637, 638, 639, 640, 641, 642, 643, 644, 645, 646, 647, 648, 649, 650, 651, 652, 653, 654, 655, 656, 657, 658, 659, 660, 661, 662, 663, 664, 665, 666, 667, 668, 669, 670, 671, 672, 673, 674, 675, 676, 677, 678, 679, 680, 681, 682, 683, 684, 685, 686, 687, 688, 689, 690, 691, 692, 693, 694, 695, 696, 697, 698, 699, 700, 701, 702, 703, 704, 705, 706, 707, 708, 709, 710, 711, 712, 713, 714, 715, 716, 717, 718, 719, 720, 721, 722, 723, 724, 725, 726, 727, 728, 729, 730, 731, 732, 733, 734, 735, 736, 737, 738, 739, 740, 741, 742, 743, 744, 745, 746, 747, 748, 749, 750, 751, 752, 753, 754, 755, 756, 757, 758, 759, 760, 761, 762, 763, 764, 765, 766, 767, 768, 769, 770, 771, 772, 773, 774, 775, 776, 777, 778, 779, 780, 781, 782, 783, 784, 785, 786, 787, 788, 789, 790, 791, 792, 793, 794, 795, 796, 797, 798, 799, 800, 801, 802, 803, 804, 805, 806, 807, 808, 809, 810, 811, 812, 813, 814, 815, 816, 817, 818, 819, 820, 821, 822, 823, 824, 825, 826, 827, 828, 829, 830, 831, 832, 833, 834, 835, 836, 837, 838, 839, 840, 841, 842, 843, 844, 845, 846, 847, 848, 849, 850, 851, 852, 853, 854, 855, 856, 857, 858, 859, 860, 861, 862, 863, 864, 865, 866, 867, 868, 869, 870, 871, 872, 873, 874, 875, 876, 877, 878, 879, 880, 881, 882, 883, 884, 885, 886, 887, 888, 889, 890, 891, 892, 893, 894, 895, 896, 897, 898, 899, 900, 901, 902, 903, 904, 905, 906, 907, 908, 909, 910]
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
              "value": ["hex_id", "site_id", "province"]
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
          "value": ["NA", "NA", "NA"]
        },
        "class": {
          "type": "character",
          "attributes": {},
          "value": ["sf", "tbl_df", "tbl", "data.frame"]
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
          "value": ["SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_16", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_17", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_18", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_19", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22", "SA_22"]
        },
        {
          "type": "integer",
          "attributes": {},
          "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 258, 259, 260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 276, 277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 287, 288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298, 299, 300, 301, 302, 303, 304, 305, 306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 316, 317, 318, 319, 320, 321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331, 332, 333, 334, 335, 336, 337, 338, 339, 340, 341, 342, 343, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379, 380, 381, 382, 383, 384, 385, 386, 387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 397, 398, 399, 400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 414, 415, 416, 417, 418, 419, 420, 421, 422, 423, 424, 425, 426, 427, 428, 429, 430, 431, 432, 433, 434, 435, 436, 437, 438, 439, 440, 441, 442, 443, 444, 445, 446, 447, 448, 449, 450, 451, 452, 453, 454, 455, 456, 457, 458, 459, 460, 461, 462, 463, 464, 465, 466, 467, 468, 469, 470, 471, 472, 473, 474, 475, 476, 477, 478, 479, 480, 481, 482, 483, 484, 485, 486, 487, 488, 489, 490, 491, 492, 493, 494, 495, 496, 497, 498, 499, 500, 501, 502, 503, 504, 505, 506, 507, 508, 509, 510, 511, 512, 513, 514, 515, 516, 517, 518, 519, 520, 521, 522, 523, 524, 525, 526, 527, 528, 529, 530, 531, 532, 533, 534, 535, 536, 537, 538, 539, 540, 541, 542, 543, 544, 545, 546, 547, 548, 549, 550, 551, 552, 553, 554, 555, 556, 557, 558, 559, 560, 561, 562, 563, 564, 565, 566, 567, 568, 569, 570, 571, 572, 573, 574, 575, 576, 577, 578, 579, 580, 581, 582, 583, 584, 585, 586, 587, 588, 589, 590, 591, 592, 593, 594, 595, 596, 597, 598, 599, 600, 601, 602, 603, 604, 605, 606, 607, 608, 609, 610, 611, 612, 613, 614, 615, 616, 617, 618, 619, 620, 621, 622, 623, 624, 625, 626, 627, 628, 629, 630, 631, 632, 633, 634, 635, 636, 637, 638, 639, 640, 641, 642, 643, 644, 645, 646, 647, 648, 649, 650, 651, 652, 653, 654, 655, 656, 657, 658, 659, 660, 661, 662, 663, 664, 665, 666, 667, 668, 669, 670, 671, 672, 673, 674, 675, 676, 677, 678, 679, 680, 681, 682, 683, 684, 685, 686, 687, 688, 689, 690, 691, 692, 693, 694, 695, 696, 697, 698, 699, 700, 701, 702, 703, 704, 705, 706, 707, 708, 709, 710, 711, 712, 713, 714, 715, 716, 717, 718, 719, 720, 721, 722, 723, 724, 725, 726, 727, 728, 729, 730, 731, 732, 733, 734, 735, 736, 737, 738, 739, 740, 741, 742, 743, 744, 745, 746, 747, 748, 749, 750, 751, 752, 753, 754, 755, 756, 757, 758, 759, 760, 761, 762, 763, 764, 765, 766, 767, 768, 769, 770, 771, 772, 773, 774, 775, 776, 777, 778, 779, 780, 781, 782, 783, 784, 785, 786, 787, 788, 789, 790, 791, 792, 793, 794, 795, 796, 797, 798, 799, 800, 801, 802, 803, 804, 805, 806, 807, 808, 809, 810, 811, 812, 813, 814, 815, 816, 817, 818, 819, 820, 821, 822, 823, 824, 825, 826, 827, 828, 829, 830, 831, 832, 833, 834, 835, 836, 837, 838, 839, 840, 841, 842, 843, 844, 845, 846, 847, 848, 849, 850, 851, 852, 853, 854, 855, 856, 857, 858, 859, 860, 861, 862, 863, 864, 865, 866, 867, 868, 869, 870, 871, 872, 873, 874, 875, 876, 877, 878, 879, 880, 881, 882, 883, 884, 885, 886, 887, 888, 889, 890, 891, 892, 893, 894, 895, 896, 897, 898, 899, 900, 901, 902, 903, 904, 905, 906, 907, 908, 909, 910]
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
              "value": [3.34936491, 18.30127019, 121.65063509, 284.80762114]
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
              "value": [25, 18.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [29.33012702, 20.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [33.66025404, 23.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.99038106, 25.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [42.32050808, 28.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [46.65063509, 30.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 20.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 23.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [29.33012702, 25.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [33.66025404, 28.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.99038106, 30.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [42.32050808, 33.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [46.65063509, 35.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [16.33974596, 23.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 25.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 28.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [29.33012702, 30.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [33.66025404, 33.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.99038106, 35.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [42.32050808, 38.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [46.65063509, 40.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [12.00961894, 25.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [16.33974596, 28.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 30.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 33.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [29.33012702, 35.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [33.66025404, 38.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.99038106, 40.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [42.32050808, 43.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [46.65063509, 45.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [7.67949192, 28.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [12.00961894, 30.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [16.33974596, 33.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 35.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 38.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [29.33012702, 40.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [33.66025404, 43.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.99038106, 45.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [42.32050808, 48.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [46.65063509, 50.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [3.34936491, 30.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [7.67949192, 33.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [12.00961894, 35.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [16.33974596, 38.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 40.80127019]
            },
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
              "value": [29.33012702, 45.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [33.66025404, 48.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.99038106, 50.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [42.32050808, 53.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [46.65063509, 55.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [3.34936491, 35.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [7.67949192, 38.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [12.00961894, 40.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [16.33974596, 43.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 45.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 48.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [29.33012702, 50.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [33.66025404, 53.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.99038106, 55.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [42.32050808, 58.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [3.34936491, 40.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [7.67949192, 43.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [12.00961894, 45.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [16.33974596, 48.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 50.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 53.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [29.33012702, 55.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [33.66025404, 58.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.99038106, 60.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [3.34936491, 45.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [7.67949192, 48.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [12.00961894, 50.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [16.33974596, 53.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 55.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 58.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [29.33012702, 60.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [33.66025404, 63.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [3.34936491, 50.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [7.67949192, 53.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [12.00961894, 55.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [16.33974596, 58.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 60.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 63.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [29.33012702, 65.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [3.34936491, 55.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [7.67949192, 58.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [12.00961894, 60.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [16.33974596, 63.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 65.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 68.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 104.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [29.33012702, 107.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [33.66025404, 109.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.99038106, 112.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [42.32050808, 114.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [46.65063509, 117.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 107.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 109.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [29.33012702, 112.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [33.66025404, 114.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.99038106, 117.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [42.32050808, 119.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [46.65063509, 122.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [16.33974596, 109.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 112.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 114.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [29.33012702, 117.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [33.66025404, 119.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.99038106, 122.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [42.32050808, 124.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [46.65063509, 127.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [12.00961894, 112.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [16.33974596, 114.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 117.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 119.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [29.33012702, 122.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [33.66025404, 124.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.99038106, 127.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [42.32050808, 129.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [46.65063509, 132.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [7.67949192, 114.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [12.00961894, 117.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [16.33974596, 119.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 122.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 124.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [29.33012702, 127.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [33.66025404, 129.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.99038106, 132.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [42.32050808, 134.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [46.65063509, 137.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [3.34936491, 117.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [7.67949192, 119.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [12.00961894, 122.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [16.33974596, 124.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 127.40381057]
            },
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
              "value": [29.33012702, 132.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [33.66025404, 134.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.99038106, 137.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [42.32050808, 139.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [46.65063509, 142.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [3.34936491, 122.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [7.67949192, 124.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [12.00961894, 127.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [16.33974596, 129.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 132.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 134.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [29.33012702, 137.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [33.66025404, 139.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.99038106, 142.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [42.32050808, 144.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [3.34936491, 127.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [7.67949192, 129.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [12.00961894, 132.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [16.33974596, 134.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 137.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 139.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [29.33012702, 142.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [33.66025404, 144.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.99038106, 147.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [3.34936491, 132.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [7.67949192, 134.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [12.00961894, 137.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [16.33974596, 139.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 142.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 144.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [29.33012702, 147.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [33.66025404, 149.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [3.34936491, 137.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [7.67949192, 139.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [12.00961894, 142.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [16.33974596, 144.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 147.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 149.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [29.33012702, 152.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [3.34936491, 142.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [7.67949192, 144.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [12.00961894, 147.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [16.33974596, 149.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 152.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 154.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 191.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [29.33012702, 194.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [33.66025404, 196.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.99038106, 199.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [42.32050808, 201.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [46.65063509, 204.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 194.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 196.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [29.33012702, 199.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [33.66025404, 201.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.99038106, 204.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [42.32050808, 206.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [46.65063509, 209.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [16.33974596, 196.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 199.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 201.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [29.33012702, 204.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [33.66025404, 206.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.99038106, 209.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [42.32050808, 211.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [46.65063509, 214.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [12.00961894, 199.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [16.33974596, 201.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 204.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 206.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [29.33012702, 209.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [33.66025404, 211.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.99038106, 214.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [42.32050808, 216.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [46.65063509, 219.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [7.67949192, 201.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [12.00961894, 204.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [16.33974596, 206.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 209.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 211.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [29.33012702, 214.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [33.66025404, 216.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.99038106, 219.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [42.32050808, 221.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [46.65063509, 224.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [3.34936491, 204.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [7.67949192, 206.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [12.00961894, 209.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [16.33974596, 211.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 214.00635095]
            },
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
              "value": [29.33012702, 219.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [33.66025404, 221.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.99038106, 224.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [42.32050808, 226.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [46.65063509, 229.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [3.34936491, 209.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [7.67949192, 211.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [12.00961894, 214.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [16.33974596, 216.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 219.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 221.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [29.33012702, 224.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [33.66025404, 226.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.99038106, 229.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [42.32050808, 231.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [3.34936491, 214.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [7.67949192, 216.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [12.00961894, 219.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [16.33974596, 221.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 224.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 226.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [29.33012702, 229.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [33.66025404, 231.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.99038106, 234.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [3.34936491, 219.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [7.67949192, 221.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [12.00961894, 224.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [16.33974596, 226.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 229.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 231.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [29.33012702, 234.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [33.66025404, 236.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [3.34936491, 224.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [7.67949192, 226.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [12.00961894, 229.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [16.33974596, 231.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 234.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 236.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [29.33012702, 239.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [3.34936491, 229.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [7.67949192, 231.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [12.00961894, 234.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [16.33974596, 236.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [20.66987298, 239.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 241.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 61.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [54.33012702, 64.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [58.66025404, 66.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.99038106, 69.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [67.32050808, 71.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [71.65063509, 74.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [45.66987298, 64.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 66.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [54.33012702, 69.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [58.66025404, 71.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.99038106, 74.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [67.32050808, 76.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [71.65063509, 79.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [41.33974596, 66.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [45.66987298, 69.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 71.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [54.33012702, 74.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [58.66025404, 76.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.99038106, 79.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [67.32050808, 81.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [71.65063509, 84.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.00961894, 69.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [41.33974596, 71.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [45.66987298, 74.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 76.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [54.33012702, 79.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [58.66025404, 81.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.99038106, 84.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [67.32050808, 86.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [71.65063509, 89.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [32.67949192, 71.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.00961894, 74.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [41.33974596, 76.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [45.66987298, 79.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 81.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [54.33012702, 84.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [58.66025404, 86.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.99038106, 89.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [67.32050808, 91.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [71.65063509, 94.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [28.34936491, 74.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [32.67949192, 76.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.00961894, 79.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [41.33974596, 81.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [45.66987298, 84.10254038]
            },
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
              "value": [54.33012702, 89.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [58.66025404, 91.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.99038106, 94.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [67.32050808, 96.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [71.65063509, 99.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [28.34936491, 79.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [32.67949192, 81.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.00961894, 84.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [41.33974596, 86.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [45.66987298, 89.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 91.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [54.33012702, 94.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [58.66025404, 96.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.99038106, 99.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [67.32050808, 101.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [28.34936491, 84.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [32.67949192, 86.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.00961894, 89.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [41.33974596, 91.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [45.66987298, 94.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 96.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [54.33012702, 99.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [58.66025404, 101.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.99038106, 104.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [28.34936491, 89.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [32.67949192, 91.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.00961894, 94.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [41.33974596, 96.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [45.66987298, 99.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 101.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [54.33012702, 104.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [58.66025404, 106.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [28.34936491, 94.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [32.67949192, 96.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.00961894, 99.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [41.33974596, 101.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [45.66987298, 104.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 106.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [54.33012702, 109.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [28.34936491, 99.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [32.67949192, 101.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.00961894, 104.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [41.33974596, 106.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [45.66987298, 109.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 111.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 148.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [54.33012702, 150.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [58.66025404, 153.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.99038106, 155.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [67.32050808, 158.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [71.65063509, 160.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [45.66987298, 150.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 153.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [54.33012702, 155.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [58.66025404, 158.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.99038106, 160.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [67.32050808, 163.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [71.65063509, 165.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [41.33974596, 153.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [45.66987298, 155.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 158.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [54.33012702, 160.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [58.66025404, 163.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.99038106, 165.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [67.32050808, 168.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [71.65063509, 170.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.00961894, 155.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [41.33974596, 158.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [45.66987298, 160.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 163.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [54.33012702, 165.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [58.66025404, 168.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.99038106, 170.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [67.32050808, 173.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [71.65063509, 175.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [32.67949192, 158.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.00961894, 160.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [41.33974596, 163.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [45.66987298, 165.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 168.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [54.33012702, 170.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [58.66025404, 173.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.99038106, 175.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [67.32050808, 178.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [71.65063509, 180.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [28.34936491, 160.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [32.67949192, 163.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.00961894, 165.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [41.33974596, 168.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [45.66987298, 170.70508076]
            },
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
              "value": [54.33012702, 175.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [58.66025404, 178.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.99038106, 180.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [67.32050808, 183.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [71.65063509, 185.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [28.34936491, 165.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [32.67949192, 168.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.00961894, 170.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [41.33974596, 173.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [45.66987298, 175.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 178.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [54.33012702, 180.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [58.66025404, 183.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.99038106, 185.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [67.32050808, 188.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [28.34936491, 170.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [32.67949192, 173.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.00961894, 175.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [41.33974596, 178.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [45.66987298, 180.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 183.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [54.33012702, 185.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [58.66025404, 188.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.99038106, 190.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [28.34936491, 175.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [32.67949192, 178.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.00961894, 180.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [41.33974596, 183.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [45.66987298, 185.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 188.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [54.33012702, 190.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [58.66025404, 193.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [28.34936491, 180.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [32.67949192, 183.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.00961894, 185.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [41.33974596, 188.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [45.66987298, 190.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 193.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [54.33012702, 195.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [28.34936491, 185.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [32.67949192, 188.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.00961894, 190.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [41.33974596, 193.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [45.66987298, 195.70508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 198.20508076]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 234.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [54.33012702, 237.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [58.66025404, 239.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.99038106, 242.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [67.32050808, 244.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [71.65063509, 247.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [45.66987298, 237.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 239.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [54.33012702, 242.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [58.66025404, 244.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.99038106, 247.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [67.32050808, 249.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [71.65063509, 252.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [41.33974596, 239.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [45.66987298, 242.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 244.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [54.33012702, 247.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [58.66025404, 249.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.99038106, 252.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [67.32050808, 254.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [71.65063509, 257.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.00961894, 242.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [41.33974596, 244.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [45.66987298, 247.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 249.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [54.33012702, 252.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [58.66025404, 254.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.99038106, 257.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [67.32050808, 259.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [71.65063509, 262.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [32.67949192, 244.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.00961894, 247.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [41.33974596, 249.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [45.66987298, 252.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 254.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [54.33012702, 257.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [58.66025404, 259.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.99038106, 262.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [67.32050808, 264.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [71.65063509, 267.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [28.34936491, 247.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [32.67949192, 249.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.00961894, 252.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [41.33974596, 254.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [45.66987298, 257.30762114]
            },
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
              "value": [54.33012702, 262.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [58.66025404, 264.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.99038106, 267.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [67.32050808, 269.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [71.65063509, 272.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [28.34936491, 252.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [32.67949192, 254.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.00961894, 257.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [41.33974596, 259.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [45.66987298, 262.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 264.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [54.33012702, 267.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [58.66025404, 269.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.99038106, 272.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [67.32050808, 274.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [28.34936491, 257.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [32.67949192, 259.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.00961894, 262.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [41.33974596, 264.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [45.66987298, 267.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 269.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [54.33012702, 272.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [58.66025404, 274.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.99038106, 277.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [28.34936491, 262.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [32.67949192, 264.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.00961894, 267.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [41.33974596, 269.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [45.66987298, 272.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 274.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [54.33012702, 277.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [58.66025404, 279.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [28.34936491, 267.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [32.67949192, 269.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.00961894, 272.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [41.33974596, 274.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [45.66987298, 277.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 279.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [54.33012702, 282.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [28.34936491, 272.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [32.67949192, 274.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [37.00961894, 277.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [41.33974596, 279.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [45.66987298, 282.30762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 284.80762114]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [75, 18.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [79.33012702, 20.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [83.66025404, 23.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [87.99038106, 25.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [92.32050808, 28.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [96.65063509, 30.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [70.66987298, 20.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [75, 23.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [79.33012702, 25.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [83.66025404, 28.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [87.99038106, 30.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [92.32050808, 33.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [96.65063509, 35.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [66.33974596, 23.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [70.66987298, 25.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [75, 28.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [79.33012702, 30.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [83.66025404, 33.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [87.99038106, 35.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [92.32050808, 38.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [96.65063509, 40.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.00961894, 25.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [66.33974596, 28.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [70.66987298, 30.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [75, 33.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [79.33012702, 35.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [83.66025404, 38.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [87.99038106, 40.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [92.32050808, 43.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [96.65063509, 45.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [57.67949192, 28.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.00961894, 30.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [66.33974596, 33.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [70.66987298, 35.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [75, 38.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [79.33012702, 40.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [83.66025404, 43.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [87.99038106, 45.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [92.32050808, 48.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [96.65063509, 50.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [53.34936491, 30.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [57.67949192, 33.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.00961894, 35.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [66.33974596, 38.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [70.66987298, 40.80127019]
            },
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
              "value": [79.33012702, 45.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [83.66025404, 48.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [87.99038106, 50.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [92.32050808, 53.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [96.65063509, 55.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [53.34936491, 35.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [57.67949192, 38.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.00961894, 40.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [66.33974596, 43.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [70.66987298, 45.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [75, 48.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [79.33012702, 50.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [83.66025404, 53.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [87.99038106, 55.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [92.32050808, 58.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [53.34936491, 40.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [57.67949192, 43.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.00961894, 45.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [66.33974596, 48.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [70.66987298, 50.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [75, 53.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [79.33012702, 55.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [83.66025404, 58.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [87.99038106, 60.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [53.34936491, 45.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [57.67949192, 48.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.00961894, 50.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [66.33974596, 53.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [70.66987298, 55.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [75, 58.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [79.33012702, 60.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [83.66025404, 63.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [53.34936491, 50.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [57.67949192, 53.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.00961894, 55.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [66.33974596, 58.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [70.66987298, 60.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [75, 63.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [79.33012702, 65.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [53.34936491, 55.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [57.67949192, 58.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.00961894, 60.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [66.33974596, 63.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [70.66987298, 65.80127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [75, 68.30127019]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [75, 104.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [79.33012702, 107.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [83.66025404, 109.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [87.99038106, 112.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [92.32050808, 114.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [96.65063509, 117.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [70.66987298, 107.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [75, 109.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [79.33012702, 112.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [83.66025404, 114.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [87.99038106, 117.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [92.32050808, 119.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [96.65063509, 122.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [66.33974596, 109.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [70.66987298, 112.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [75, 114.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [79.33012702, 117.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [83.66025404, 119.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [87.99038106, 122.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [92.32050808, 124.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [96.65063509, 127.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.00961894, 112.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [66.33974596, 114.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [70.66987298, 117.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [75, 119.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [79.33012702, 122.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [83.66025404, 124.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [87.99038106, 127.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [92.32050808, 129.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [96.65063509, 132.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [57.67949192, 114.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.00961894, 117.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [66.33974596, 119.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [70.66987298, 122.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [75, 124.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [79.33012702, 127.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [83.66025404, 129.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [87.99038106, 132.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [92.32050808, 134.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [96.65063509, 137.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [53.34936491, 117.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [57.67949192, 119.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.00961894, 122.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [66.33974596, 124.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [70.66987298, 127.40381057]
            },
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
              "value": [79.33012702, 132.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [83.66025404, 134.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [87.99038106, 137.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [92.32050808, 139.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [96.65063509, 142.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [53.34936491, 122.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [57.67949192, 124.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.00961894, 127.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [66.33974596, 129.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [70.66987298, 132.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [75, 134.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [79.33012702, 137.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [83.66025404, 139.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [87.99038106, 142.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [92.32050808, 144.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [53.34936491, 127.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [57.67949192, 129.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.00961894, 132.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [66.33974596, 134.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [70.66987298, 137.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [75, 139.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [79.33012702, 142.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [83.66025404, 144.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [87.99038106, 147.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [53.34936491, 132.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [57.67949192, 134.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.00961894, 137.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [66.33974596, 139.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [70.66987298, 142.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [75, 144.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [79.33012702, 147.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [83.66025404, 149.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [53.34936491, 137.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [57.67949192, 139.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.00961894, 142.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [66.33974596, 144.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [70.66987298, 147.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [75, 149.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [79.33012702, 152.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [53.34936491, 142.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [57.67949192, 144.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.00961894, 147.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [66.33974596, 149.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [70.66987298, 152.40381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [75, 154.90381057]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [75, 191.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [79.33012702, 194.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [83.66025404, 196.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [87.99038106, 199.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [92.32050808, 201.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [96.65063509, 204.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [70.66987298, 194.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [75, 196.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [79.33012702, 199.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [83.66025404, 201.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [87.99038106, 204.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [92.32050808, 206.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [96.65063509, 209.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [66.33974596, 196.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [70.66987298, 199.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [75, 201.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [79.33012702, 204.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [83.66025404, 206.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [87.99038106, 209.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [92.32050808, 211.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [96.65063509, 214.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.00961894, 199.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [66.33974596, 201.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [70.66987298, 204.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [75, 206.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [79.33012702, 209.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [83.66025404, 211.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [87.99038106, 214.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [92.32050808, 216.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [96.65063509, 219.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [57.67949192, 201.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.00961894, 204.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [66.33974596, 206.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [70.66987298, 209.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [75, 211.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [79.33012702, 214.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [83.66025404, 216.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [87.99038106, 219.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [92.32050808, 221.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [96.65063509, 224.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [53.34936491, 204.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [57.67949192, 206.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.00961894, 209.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [66.33974596, 211.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [70.66987298, 214.00635095]
            },
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
              "value": [79.33012702, 219.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [83.66025404, 221.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [87.99038106, 224.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [92.32050808, 226.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [96.65063509, 229.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [53.34936491, 209.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [57.67949192, 211.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.00961894, 214.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [66.33974596, 216.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [70.66987298, 219.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [75, 221.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [79.33012702, 224.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [83.66025404, 226.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [87.99038106, 229.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [92.32050808, 231.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [53.34936491, 214.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [57.67949192, 216.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.00961894, 219.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [66.33974596, 221.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [70.66987298, 224.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [75, 226.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [79.33012702, 229.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [83.66025404, 231.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [87.99038106, 234.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [53.34936491, 219.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [57.67949192, 221.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.00961894, 224.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [66.33974596, 226.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [70.66987298, 229.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [75, 231.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [79.33012702, 234.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [83.66025404, 236.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [53.34936491, 224.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [57.67949192, 226.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.00961894, 229.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [66.33974596, 231.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [70.66987298, 234.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [75, 236.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [79.33012702, 239.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [53.34936491, 229.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [57.67949192, 231.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [62.00961894, 234.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [66.33974596, 236.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [70.66987298, 239.00635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [75, 241.50635095]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [100, 61.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [104.33012702, 64.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [108.66025404, 66.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [112.99038106, 69.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [117.32050808, 71.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [121.65063509, 74.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [95.66987298, 64.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [100, 66.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [104.33012702, 69.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [108.66025404, 71.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [112.99038106, 74.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [117.32050808, 76.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [121.65063509, 79.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [91.33974596, 66.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [95.66987298, 69.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [100, 71.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [104.33012702, 74.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [108.66025404, 76.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [112.99038106, 79.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [117.32050808, 81.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [121.65063509, 84.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [87.00961894, 69.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [91.33974596, 71.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [95.66987298, 74.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [100, 76.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [104.33012702, 79.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [108.66025404, 81.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [112.99038106, 84.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [117.32050808, 86.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [121.65063509, 89.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [82.67949192, 71.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [87.00961894, 74.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [91.33974596, 76.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [95.66987298, 79.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [100, 81.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [104.33012702, 84.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [108.66025404, 86.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [112.99038106, 89.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [117.32050808, 91.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [121.65063509, 94.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [78.34936491, 74.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [82.67949192, 76.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [87.00961894, 79.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [91.33974596, 81.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [95.66987298, 84.10254038]
            },
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
              "value": [104.33012702, 89.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [108.66025404, 91.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [112.99038106, 94.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [117.32050808, 96.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [121.65063509, 99.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [78.34936491, 79.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [82.67949192, 81.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [87.00961894, 84.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [91.33974596, 86.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [95.66987298, 89.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [100, 91.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [104.33012702, 94.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [108.66025404, 96.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [112.99038106, 99.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [117.32050808, 101.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [78.34936491, 84.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [82.67949192, 86.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [87.00961894, 89.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [91.33974596, 91.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [95.66987298, 94.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [100, 96.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [104.33012702, 99.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [108.66025404, 101.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [112.99038106, 104.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [78.34936491, 89.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [82.67949192, 91.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [87.00961894, 94.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [91.33974596, 96.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [95.66987298, 99.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [100, 101.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [104.33012702, 104.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [108.66025404, 106.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [78.34936491, 94.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [82.67949192, 96.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [87.00961894, 99.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [91.33974596, 101.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [95.66987298, 104.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [100, 106.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [104.33012702, 109.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [78.34936491, 99.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [82.67949192, 101.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [87.00961894, 104.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [91.33974596, 106.60254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [95.66987298, 109.10254038]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [100, 111.60254038]
            }
          ]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON", "ON"]
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
          "value": ["hex_id", "site_id", "geometry"]
        },
        "row.names": {
          "type": "integer",
          "attributes": {},
          "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35]
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
              "value": ["hex_id", "site_id"]
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
          "value": ["NA", "NA"]
        },
        "class": {
          "type": "character",
          "attributes": {},
          "value": ["sf", "tbl_df", "tbl", "data.frame"]
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
          "value": ["SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_09", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_10", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_11", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_14", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15", "SA_15"]
        },
        {
          "type": "integer",
          "attributes": {},
          "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35]
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
              "value": [9.76940283, 25.71449143, 65.23059717, 234.0931297]
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
              "value": [25, 25.71449143]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [40.23059717, 34.50788081]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [9.76940283, 34.50788081]
            },
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
              "value": [40.23059717, 52.09465957]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [9.76940283, 52.09465957]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 60.88804895]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 112.31703181]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [40.23059717, 121.11042119]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [9.76940283, 121.11042119]
            },
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
              "value": [40.23059717, 138.69719995]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [9.76940283, 138.69719995]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 147.49058933]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 198.91957219]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [40.23059717, 207.71296157]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [9.76940283, 207.71296157]
            },
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
              "value": [40.23059717, 225.29974032]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [9.76940283, 225.29974032]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [25, 234.0931297]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 69.01576162]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [65.23059717, 77.809151]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [34.76940283, 77.809151]
            },
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
              "value": [65.23059717, 95.39592976]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [34.76940283, 95.39592976]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 104.18931914]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 155.618302]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [65.23059717, 164.41169138]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [34.76940283, 164.41169138]
            },
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
              "value": [65.23059717, 181.99847014]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [34.76940283, 181.99847014]
            },
            {
              "type": "double",
              "attributes": {
                "class": {
                  "type": "character",
                  "attributes": {},
                  "value": ["XY", "POINT", "sfg"]
                }
              },
              "value": [50, 190.79185951]
            }
          ]
        }
      ]
    }

