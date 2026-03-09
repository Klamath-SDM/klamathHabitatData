library(tidyr)
library(dplyr)
library(janitor)
library(sf)
library(tidyverse)
library(pins)
library(rivermile)

# habitat data ----
habitat_modeled_data <- read_csv(here::here('data-raw','habitat_data.csv')) |>
  clean_names() |>
  mutate(longitude = as.numeric(longtidue)) |>
  rename(stream = river) |>
  assign_sub_basin(sub_basin) |>
  select(-longtidue) |>
  select(stream, sub_basin, everything()) |>
  select(stream, everything()) |>
  glimpse()

# save rda files
usethis::use_data(habitat_modeled_data, overwrite = TRUE)


### Habitat Extent Shapefiles ----
### California pre-dam removal:
# data source: https://gis.data.ca.gov/
# chinook: https://gis.data.ca.gov/datasets/6b01676840b54ddbb3840aa6b99ec6c6_0/explore?location=39.781855%2C-122.362776%2C7
# coho: https://gis.data.ca.gov/search?q=abundance%20linear
# steelhead: https://gis.data.ca.gov/search?q=abundance%20linear

kl_basin_outline <- rivermile::klamath_hucs |> st_union() |> st_transform(kl_basin_outline, crs = 4326)

#chinook
chinook_dist <- read_sf("data-raw/habitat-extent-files/Chinook_Abundance_Linear.shp")
chinook_extent <- st_transform(chinook_dist, crs = 4326)

chinook_extent <- st_intersection(chinook_extent, kl_basin_outline)
chinook_extent <- assign_sub_basin(chinook_extent, sub_basin, is_point = FALSE)

#coho
coho_extent <- read_sf("data-raw/habitat-extent-files/Coho_Abundance_Linear.shp")
coho_extent <- st_transform(coho_extent, crs = 4326)
coho_extent <- st_intersection(coho_extent, kl_basin_outline)
coho_extent <- assign_sub_basin(coho_extent, sub_basin, is_point = FALSE)

# steelhead
steelhead_extent <- read_sf("data-raw/habitat-extent-files/Steelhead_Abundance_Linear.shp")
steelhead_extent <- st_transform(steelhead_extent, crs = 4326)
steelhead_extent <- st_intersection(steelhead_extent, kl_basin_outline)
steelhead_extent <- assign_sub_basin(steelhead_extent, sub_basin, is_point = FALSE)

habitat_extents <- bind_rows(coho_extent, steelhead_extent, chinook_extent) |>
  clean_names() |>
  mutate(stream = tolower(location),
         data_type = "fish habitat extent",
         location_name = tolower(location),
         lifestage = tolower(stage),
         species = tolower(c_name),
         species_full_name = tolower(s_name),
         run = tolower(run)) |>
  select(-c(stage, obs_type, c_name, s_name, objectid, obs,  mean, location, category,  shape_len, trend_id, link, location_name)) |>
  mutate(location = rivermile::extract_waterbody_short(stream)) |>
  filter(!is.na(location)) |>
  select(-stream, -latest_year, -species_full_name) |>
  mutate(extent = "pre-dam removal") |>
  select(location, sub_basin, data_type, species, lifestage, run, extent, everything()) |>
  glimpse()

# TODO: add historic extent to this
# https://dfw.state.or.us/fish/CRP/klamath_reintroduction_plan.asp

# save rda files
usethis::use_data(habitat_extents, overwrite = TRUE)
