install.packages("ggplot2")
install.packages("sf")
install.packages("tigris")
library(sf)
library(ggplot2)
library(tigris)

stops <- sf::read_sf("Documents/Research/raw_data/KCM_Stops_Data/kcm_stops.shp")
wa_tracts <- tigris::tracts(state = "WA", county = "KING")

ggplot(wa_tracts) +
  geom_sf() +
  geom_sf(data=stops)

joined <- sf::st_join(sf::st_transform(stops, crs=4269), wa_tracts, join=sf::st_within)
out <- joined %>%
  dplyr::select(!!!syms(c(colnames(stops), "GEOID"))) %>%
  dplyr::filter(!is.na(GEOID)) %>%  # drop the stops that are outside King County
  dplyr::mutate_at("GEOID", as.numeric)

sf::st_write(sf::st_as_sf(out),
             "Documents/Research/raw_data/stops_with_tract_ids.shp",
             layer_options = "GEOMETRY=AS_XY")