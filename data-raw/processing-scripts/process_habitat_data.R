library(tidyr)
library(dplyr)
library(janitor)
library(sf)
library(tidyverse)
library(pins)
library(rivermile)

# habitat data ----
habitat_data <- read_csv(here::here('data-raw','habitat_data.csv')) |>
  clean_names() |>
  mutate(longitude = as.numeric(longtidue)) |>
  rename(stream = river) |>
  assign_sub_basin(sub_basin) |>
  select(-longtidue) |>
  select(stream, sub_basin, everything()) |>
  select(stream, everything()) |>
  glimpse()

# save rda files
usethis::use_data(habitat_data, overwrite = TRUE)


### Habitat Extent Shapefiles ----

# klamath streams - for filterinng
streams <- st_read("data-raw/habitat-extent-files/Merged_Rivers.shp")
streams <- st_transform(streams, crs = 4326)

kl_basin_outline <- st_read("data-raw/klamath_basin_outline/R8_FAC_Klamath_Basin_WFL1.shp")
kl_basin_outline <- st_transform(kl_basin_outline, crs = 4326)

#chinook
chinook_dist <- read_sf("data-raw/habitat-extent-files/Chinook_Abundance_Linear.shp")
chinook_extent <- st_transform(chinook_dist, crs = 4326)

chinook_extent <- st_intersection(chinook_extent, kl_basin_outline)

centroids <- st_centroid(chinook_extent)
chinook_extent$longitude <- st_coordinates(centroids)[, 1]
chinook_extent$latitude  <- st_coordinates(centroids)[, 2]
chinook_extent <- assign_sub_basin(chinook_extent, sub_basin, is_point = FALSE)
chinook_extent <- chinook_extent |>
  filter(Location %in% streams$Label)

#coho
coho_extent <- read_sf("data-raw/habitat-extent-files/Coho_Abundance_Linear.shp")
coho_extent <- st_transform(coho_extent, crs = 4326)
coho_extent <- st_intersection(coho_extent, kl_basin_outline)
coho_extent <- assign_sub_basin(coho_extent, sub_basin, is_point = FALSE)
coho_extent <- coho_extent |>
  filter(Location %in% streams$Label)
# steelhead
steelhead_extent <- read_sf("data-raw/habitat-extent-files/Steelhead_Abundance_Linear.shp")
steelhead_extent <- st_transform(steelhead_extent, crs = 4326)
steelhead_extent <- st_intersection(steelhead_extent, kl_basin_outline)
steelhead_extent <- assign_sub_basin(steelhead_extent, sub_basin, is_point = FALSE)
steelhead_extent <- steelhead_extent |>
  filter(Location %in% streams$Label)


 #TODO check on extract_waterbody functiong
habitat_extent <- bind_rows(coho_extent, steelhead_extent, chinook_extent) |>
  clean_names() |>
  select(-c(miles2, shape_len, fid, area, perimeter, kbbnd, kbbnd_id, shape_are, shape_len_1, global_id,trend_id, link)) |>
  mutate(stream = extract_waterbody(location),
         data_type = "fish habitat extent") |>
  rename(species = c_name,
         species_full_name = s_name) |>
  select(stream, sub_basin, data_type, location, species, species_full_name, run, everything()) |>
  st_drop_geometry() |>
  glimpse()

