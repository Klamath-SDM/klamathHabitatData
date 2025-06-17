library(tidyr)
library(dplyr)
library(janitor)
library(sf)
library(tidyverse)
library(pins)

#TODO - check if we are inculdinng this in an R package, if so just source from package
# using sub-basin shp to assign sub_basin names to other data
# sub_basin <- st_read("data-raw/tables_with_data/sub-basin-boundaries/Klamath_HUC8_Subbasin.shp")
#
# # function to assign sub-basin to datasets #TODO let's consider moving this function to an R package(?)
# assign_sub_basin <- function(data, sub_basin, is_point = TRUE, lon_col = "longitude", lat_col = "latitude", sub_basin_col = "NAME") {
#   if (is_point) {
#     sf_data <- st_as_sf(data, coords = c(lon_col, lat_col), crs = 4326)
#   } else {
#     sf_data <- st_as_sf(data)
#   }
#   sf_data <- sf_data |>
#     st_transform(st_crs(sub_basin)) |>
#     st_join(sub_basin[sub_basin_col]) |>
#     rename(sub_basin = !!sub_basin_col)
#   if (is_point) {
#     coords <- st_coordinates(sf_data)
#     sf_data[[lon_col]] <- coords[, 1]
#     sf_data[[lat_col]] <- coords[, 2]
#     sf_data <- st_drop_geometry(sf_data)
#   }
#   return(sf_data)
# }


# habitat data ----
habitat_data <- read_csv(here::here('data-raw','habitat_data.csv')) |>
  clean_names() |>
  mutate(longitude = as.numeric(longtidue)) |>
  rename(stream = river) |>
  # assign_sub_basin(sub_basin) |>
  select(-longtidue) |>
  # select(stream, sub_basin, everything()) |>
  select(stream, everything()) |>
  glimpse()
