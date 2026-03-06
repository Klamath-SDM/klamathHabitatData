#' @title Salmon Habitat Data
#' @name habitat_modeled_data
#' @description This dataset compiles modeled salmon habitat data derived from literature reviews.
#' It includes information on habitat model extent, data sources, and approximate geographic locations.
#' The Stream Salmonid Simulator (S3) model incorporates two-dimensional (2D) hydraulic models for specific Klamath River sections to calculate habitat suitability based on environmental variables, such as river flow and channel width. These models use Weighted Usable Habitat Area (WUA) curves created for specific life stages and habitat types of salmon. The WUA information derived from 2D models (covering 11.3 km or 3.6% of the Klamath’s river length) is extrapolated to unmodeled reaches, enabling habitat assessments across larger river sections.
#' Three S3 models have been developed. The original model was developed to support Fall Run Chinook and later updated to include the Trinity River and Coho populations.
#' @format A tibble with 15 rows and 13 columns
#' \itemize{
#'   \item \code{stream}: stream
#'   \item \code{sub_basin}: sub-basin name (Upper Klamath, Lower Klamath, Trinity)
#'   \item \code{location_name}: location name
#'   \item \code{model_type}: type of model used (2D hydrodynamic model, SRH-2D, micro-habitat models, HEC-EFM, SRH-1D)
#'   \item \code{length_miles}: geographical length of data coverage in miles
#'   \item \code{rm_start}: river mile of the beginning of extent, if applicable
#'   \item \code{rm_end}: river mile of the end of extent, if applicable
#'   \item \code{status}: status of model used (developed, in development)
#'   \item \code{location_souorce}: source used to determine the coordinates
#'   \item \code{source}: literature reference
#'   \item \code{link}: web link containing more information about data
#'   \item \code{latitude}: latitude of data location
#'   \item \code{longitude}: longitude of data location
#'   }
#' @details
#' For more infomation about these data compilation visit {the exploratory markdown}{https://github.com/Klamath-SDM/klamath-map/blob/add-habitat/data-raw/habitat_summary.html}
#'
'habitat_modeled_data'


#' @title Salmon Habitat Data
#' @name habitat_extents
#' @description
#' A spatial dataset of linear stream segments in the Klamath Basin that define the extent of salmonid habitat. These features represent:
#' \itemize{
#'   \item The reaches or stream sections for which abundance data apply (e.g., survey areas)
#'   \item Known or modeled distribution areas for steelhead, coho, and Chinook salmon
#'   \item Areas where these species are currently present or have been extirpated
#' }
#' @format A tibble with 744 rows and 11 variables.
#' \itemize{
#'   \item \code{location}: stream or river name
#'   \item \code{subbasin}: sub-basin name (upper klamath, lower klamath, trinity)
#'   \item \code{data_type}: data type = fish habitat extents
#'   \item \code{species}: species name (coho, steelhead, chinook)
#'   \item \code{species_full_name}: species full name (oncorhynchus kisutch,oncorhynchus mykiss ,oncorhynchus tshawytscha)
#'   \item \code{lifestage}: fish life stage
#'   \item \code{run}: species run (summer, winter, mixed, unknown, spring, fall, NA)
#'   \item \code{latest_year}: TODO
#'   \item \code{latitude}: latitude of data location
#'   \item \code{longitude}: longitude of data location
#'   \item \code{geometry}: the spatial geometry associated with each extent
#'   }
'habitat_extents'

#' @title Fish Passage Barriers (2025)
#' @name barriers
#' @description
#' A spatial dataset of priority fish barriers in the Klamath Basin. Data source: https://nrimp.dfw.state.or.us/DataClearinghouse/default.aspx?p=202&XMLname=1094.xml
#' @format A tibble with 38 rows and 9 variables.
#' \itemize{
#'   \item \code{location}: mainstem location
#'   \item \code{stream_name}: stream or river name
#'   \item \code{barrier_type}: type of passage barrier
#'.  \item \code{barrier_status}: status of passage barrier (partial, blocked)
#'   \item \code{source_entity}: entity that provides the data
#'   \item \code{species}: species impacted
#'   \item \code{latitude}: latitude of data location
#'   \item \code{longitude}: longitude of data location
#'   \item \code{geometry}: the spatial geometry associated with each extent
#'   }
'barriers'
