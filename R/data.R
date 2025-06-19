#' @title Salmon Habitat Data
#' @name habitat_data
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
'habitat_data'
