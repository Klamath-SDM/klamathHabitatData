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
