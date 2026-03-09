library(tidyverse)
library(sf)

# data download: https://nrimp.dfw.state.or.us/DataClearinghouse/default.aspx?p=202&XMLname=1094.xml
# documentation: https://www.oregon.gov/eis/geo/OGIC%20Approved%20Data%20Standards/Fish-Passage-Barrier-Data-Standard-v1.1-2010.pdf
barriers_raw <- read_sf("data-raw/PriorityBarriers2025_shp/PriorityBarriers2025.shp") |>
  janitor::clean_names() |>
  glimpse()

klamath_poly <- rivermile::klamath_hucs |>
  st_transform(st_crs(barriers_raw)) |>
  st_union()

barriers <- barriers_raw |>
  select(fpb_ftr_ty, fpb_f_pas_sta, fpb_str_nm, fpb_comment,
         odfw_fish_d, fpb_own_ty, subbasin, fpb_o_nm, species, fpb_lat, fpb_long, geometry) |>
  st_transform(st_crs(klamath_poly)) |>
  st_filter(klamath_poly, .predicate = st_within) |>
  rename(source_entity = fpb_o_nm,
         barrier_type = fpb_ftr_ty,
         barrier_status = fpb_f_pas_sta,
         stream_name = fpb_str_nm,
         comment = fpb_comment,
         basin = odfw_fish_d,
         owner_type = fpb_own_ty,
         location = subbasin,
         latitude = fpb_lat,
         longitude = fpb_long) |>
  mutate(location = tolower(location),
         barrier_type = tolower(barrier_type),
         barrier_status = tolower(barrier_status),
         stream_name = tolower(stream_name),
         species = tolower(species),
         source_entity = tolower(source_entity)) |>
  mutate(
    location = case_when(
      location %in% c("sprague") ~ "sprague river",
      location %in% c("upper klamath") ~ "upper klamath river",
      location %in% c("lost") ~ "lost River",
      location %in% c("williamson") ~ "williamson river",
      TRUE ~ NA_character_)) |>
  select(-comment, -owner_type, -basin) |>
  glimpse()

unique(barriers$barrier_type)
unique(barriers$barrier_status)

# fpbONm  Name of the source originator / entity that provides the data
# fpbFtrTy  Fish passage barrier feature type
# fpbFPasSta  Status of fish passage at the barrier feature
# fpbStrNm  Stream name from GNIS
# fpbComment  Additional, relevant information about the fish passage barrier feature

ggplot() +
  geom_sf(data = rivermile::klamath_hucs |> st_union()) +
  geom_sf(data = rivermile::all_klamath_rivers_line, color = "darkblue", alpha = 0.5) +
  geom_sf(data = barriers) +
  ggtitle("Fish Passage Barriers in the Klamath Basin") +
  theme_minimal()

usethis::use_data(barriers, overwrite = TRUE)


