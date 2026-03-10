## klamathHabitatData

The `klamathHabitatData` package is an `R` data package developed by FlowWest that provides curated environmental and geospatial datasets on habitat in the Klamath River Basin.
The package is intended to support research, modeling, and restoration planning by making commonly used fisheries datasets easily accessible in a consistent format.

Installation
You can install the development version of klamathHabitatData from GitHub with:

```
# install.packages("devtools")
devtools::install_github("Klamath-SDM/klamathHabitatData")
```

Data sources
The data in this package comes from a variety of public sources, including:

- California Department of Fish and Wildlife (CDFW)
- Oregon Department of Fish and Wildlife
- Literature-based habitat models

### Example
The example below demonstrates how to access fish passage barrier data for the Klamath:  

```
library(klamathHabitatData)
library(tidyverse)
library(sf)

klamathHabitatData::barriers |> glimpse()
Rows: 38
Columns: 9
$ barrier_type   <chr> "dam", "culvert", "other", "dam", "dam", "dam", "culvert", "dam", "da…
$ barrier_status <chr> "blocked", "partial", "blocked", "blocked", "blocked", "partial", "pa…
$ stream_name    <chr> "blue springs creek", "deming creek", "copperfield draw creek", "agen…
$ location       <chr> NA, "sprague river", "upper klamath river", NA, "upper klamath river"…
$ source_entity  <chr> "odfw", "odfw", "odfw", "odfw", "odfw", "owrd", "usfs_winema", "odfw"…
$ species        <chr> "bull trout (ft historical), summer steelhead (historical), redband t…
$ latitude       <dbl> 42.69435, 42.45255, 42.58838, 42.61989, 42.43142, 42.13457, 42.44706,…
$ longitude      <dbl> -122.0749, -120.9489, -121.7499, -121.9325, -122.1233, -121.9489, -12…
$ geometry       <POINT [foot]> POINT (888912.5 348345), POINT (1191144 256472.1), POINT (97…
```

What’s Included
The package contains cleaned, documented data objects including:

- barriers - Fish Passage Barriers filtered to the Klamath Basin (2025)
- habitat_extents - Fish habitat extents (currently pre-dam)
- *And more in development…*

Use data(package = "klamathHabitatData") to view all datasets included.
