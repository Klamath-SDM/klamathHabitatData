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
#'   \item \code{sub_basin}: sub-basin name (upper klamath, lower klamath, trinity)
#'   \item \code{data_type}: data type = fish habitat extents
#'   \item \code{species}: species name (coho, steelhead, chinook)
#'   \item \code{lifestage}: fish life stage
#'   \item \code{run}: species run (summer, winter, mixed, unknown, spring, fall, NA)
#'   \item \code{extent}: pre-or-post dam removal extent
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

#' Chinook Salmon Intrinsic Potential by River and Population Unit
#'
#' A dataset containing intrinsic potential (IP) habitat estimates for Chinook
#' salmon across rivers in the Klamath Basin. Population unit classifications follow
#' Williams et al. (2006). IP model variables and suitability curves follow
#' Agrawal et al. (2005) and Bjorkstedt et al. (2005).
#'
#' @format A data frame with 25 rows and 6 variables:
#' \describe{
#'   \item{river}{Name of the river or stream reach (character, lowercase)}
#'   \item{population_unit}{Population unit classification per Williams et al.
#'     (2006) Table 2. One of: lower klamath river, middle klamath river, upper
#'     klamath river, lower trinity river, upper trinity river, salmon river,
#'     scott river, shasta river, or upstream of dam removal (character,
#'     lowercase)}
#'   \item{ip_km}{Intrinsic potential integrated over accessible stream length
#'     within the river, calculated as the sum of reach length (km)
#'     multiplied by reach-scale IP score. (numeric, IP-km)}
#'   \item{total_reach_length_km}{total reach length (numeric, IP-km)}
#'   \item{ip_mean}{Mean reach-scale IP score across all accessible reaches,
#'   weighted by reach length. Values range from
#'     0 (unsuitable) to 1 (ideal habitat) (numeric)}
#'   \item{n_reaches}{Number of NHD stream reaches included in the IP
#'     calculation for that river (integer)}
#' }
#'
#' @details
#' Intrinsic potential (IP) is calculated as the geometric mean of three
#' reach-scale suitability scores — channel gradient, mean annual discharge,
#' and valley width index — each mapped to a suitability curve ranging from
#' 0 to 1 following Burnett et al. (2003) and Agrawal et al. (2005). The
#' limiting-factors structure of the model means a low score on any single
#' variable substantially reduces overall IP.
#'
#' Stream network attributes were derived from the National Hydrography Dataset
#' Plus (NHDPlus). Population unit boundaries follow Table 2 in Williams et al.
#' (2006), with tributaries not explicitly named in that table assigned to the
#' population unit of the mainstem reach they enter. The Salmon, Scott, and
#' Shasta rivers are treated as independent population units per Table 2.
#' Rivers upstream of the Klamath dam removal area (Williamson River, Sprague
#' River, Wood River, Lost River, and Link River) are grouped into a single
#' unit labelled "upstream of dam removal".
#'
#' @source
#' \itemize{
#'   \item Agrawal, A., Schick, R.S., Bjorkstedt, E.P., Szerlong, R.G.,
#'     Goslin, M.N., Spence, B.C., Williams, T.H., and Burnett, K.M. (2005).
#'     Predicting the potential for historical coho, Chinook and steelhead
#'     habitat in northern California. NOAA Technical Memorandum
#'     NMFS-SWFSC-379.
#'   \item Burnett, K.M., Reeves, G.H., Miller, D., Clarke, S., Christiansen,
#'     K., and Vance-Borland, K. (2003). A first step toward broad-scale
#'     identification of freshwater protected areas for Pacific salmon and trout
#'     in Oregon, USA. Proceedings of the World Congress on Aquatic Protected
#'     Areas, Cairns, Australia.
#'   \item Williams, T.H., Bjorkstedt, E.P., Duffy, W.G., Hillemeier, D.,
#'     Kautsky, G., Lisle, T.E., McCain, M., Rode, M., Szerlong, R.G., Schick,
#'     R.S., Goslin, M.N., and Agrawal, A. (2006). Historical population
#'     structure of coho salmon in the Southern Oregon/Northern California
#'     Coasts Evolutionarily Significant Unit. NOAA Technical Memorandum
#'     NMFS-SWFSC-390.
#' }
#'
#' @examples
#' # summarise total IP-km by population unit
#' chinook_ip |>
#'   dplyr::group_by(population_unit) |>
#'   dplyr::summarise(
#'     total_ip_km   = sum(ip_km, na.rm = TRUE),
#'     mean_ip       = mean(ip_mean, na.rm = TRUE),
#'     total_reaches = sum(n_reaches)
#'   ) |>
#'   dplyr::arrange(dplyr::desc(total_ip_km))
#'
#' # plot IP-km by river colored by population unit
#' ggplot2::ggplot(chinook_ip,
#'   ggplot2::aes(x = ip_km,
#'                y = reorder(river, ip_km),
#'                fill = population_unit)) +
#'   ggplot2::geom_col() +
#'   ggplot2::labs(x = "IP-km", y = NULL, fill = "Population Unit") +
#'   ggplot2::theme_bw()
"chinook_ip"
