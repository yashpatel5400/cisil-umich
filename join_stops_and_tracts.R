install.packages("dplyr")
install.packages("ggplot2")
install.packages("sf")
install.packages("tigris")
library(dplyr)
library(ggplot2)
library(sf)
library(tigris)

data_dir <- "Documents/Research/raw_data/"
stops <- sf::read_sf(paste0(data_dir, "KCM_Stops_Data/kcm_stops.shp"))
acs <- read.csv(paste0(data_dir, "King_County_ACS_2019_tract.csv"))
king_tracts <- tigris::tracts(state = "WA", county = "KING", year = 2020)

# Remove stops outside of King County
remove_stops <- sf::st_join(sf::st_transform(stops, crs=4269),
                                 king_tracts,
                                 join=sf::st_intersects) %>%
  dplyr::filter(is.na(GEOID)) %>%
  dplyr::pull(OBJECTID)

# Certain tracts from the tigris shapefile aren't in the ACS file, so we'll instead join
# stops in those tracts to the nearest tract present in the ACS file
filtered_tracts <- king_tracts[king_tracts$GEOID %in% acs$GEOID,]

# left_joined_tracts <- king_tracts %>%
#   dplyr::left_join(as.data.frame(filtered_tracts)[, c("GEOID", "NAMELSAD")], by = "GEOID") %>%
#   dplyr::mutate(filtered = ifelse(is.na(NAMELSAD.y), "Yes", "No"))

# ggplot(left_joined_tracts) +
#   geom_sf(aes(fill = filtered), color = "black") +
#   geom_sf(data=stops, size = 0.5, color = "#1c1cb8") +
#   labs(title = "All King County Tracts in the Tigris::tracts file") +
#   theme(panel.background = element_blank(),
#         axis.text = element_text(color = "black")) +
#   guides(color = "none")
# 
# ggplot(joined) +
#   geom_sf(data=filtered_tracts) + 
#   geom_sf() +
#   theme(panel.background = element_blank(),
#         axis.text = element_text(color = "black"))

joined <- sf::st_join(sf::st_transform(stops[!(stops$OBJECTID %in% remove_stops),], crs=4269),
                      filtered_tracts, join=sf::st_nearest_feature)
# 
# unfiltered_joined %>%
#   dplyr::filter(GEOID == "53033023807")
# 
# as.data.frame(dplyr::select(unfiltered_joined, GEOID, OBJECTID)) %>%
#   dplyr::left_join(as.data.frame(dplyr::select(joined, GEOID, OBJECTID)), by = "OBJECTID") %>%
#   dplyr::filter(GEOID.x != GEOID.y) %>%
#   ggplot() +
#   geom_sf(data=king_tracts) +
#   geom_sf(aes(geometry=geometry.y, color = GEOID.x)) +
#   guides(color = "none")

out <- joined %>%
  dplyr::select(!!!syms(c(colnames(stops), "GEOID"))) %>%
  dplyr::filter(!is.na(GEOID)) %>%  # drop the stops that are outside King County
  dplyr::mutate_at("GEOID", as.numeric)

sf::st_write(sf::st_as_sf(out),
             "Documents/Research/raw_data/stops_with_tract_ids.shp",
             layer_options = "GEOMETRY=AS_XY")
