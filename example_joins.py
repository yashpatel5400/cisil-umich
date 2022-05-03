import os

import geopandas as gpd
import pandas as pd
import numpy as np

data_dir = "/Users/jwass/Documents/Research/raw_data"
q1_dir = "Question 1_ Fare Reinstatement"
stop_locs = gpd.read_file(os.path.join(data_dir, "stops_with_tract_ids.shp"))
acs = pd.read_csv(os.path.join(data_dir, "King_County_ACS_2019_tract.csv"), index_col=[0])
trips = pd.read_csv(os.path.join(data_dir, q1_dir, "alltrips_2020-09_to_2020-10.csv"))
apc = pd.read_csv(os.path.join(data_dir, q1_dir, "apc_detailed_09-01-2020_10-31-2020.csv"))
stops = pd.read_csv(os.path.join(data_dir, "stop_activity_granular_2020-09-01_2020-10-31.csv"),
                    iterator = True, chunksize = 50000)

trip_id = 44052264
keep = pd.DataFrame()
for chunk in stops:
    keep = pd.concat([keep, chunk[chunk["TRIP_ID"] == trip_id]], axis=0)

keep["SERVICE_CHANGE_NUM"] = [202 if c.find("SUM") == 0 else 203 for c in keep["BOOKING_ID"]]

merged = keep.merge(trips[[c for c in trips if c != "MINOR_CHANGE_NUM"]].drop_duplicates(),
                    on=["TRIP_ID", "KEY_BLOCK_NUM", "SERVICE_CHANGE_NUM"])

stop_locs["STOP_ID"] = stop_locs["STOP_ID"].astype(int)
larger_merged = merged.merge(stop_locs, on="STOP_ID")

stop_locs["GEOID"] = stop_locs["GEOID"].astype(int)
biggest_merged = larger_merged.merge(acs, on="GEOID")
