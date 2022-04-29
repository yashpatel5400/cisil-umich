import os
import geoplot as gplt
import geopandas as gpd
import geoplot.crs as gcrs
import imageio
import pandas as pd
import pathlib
import matplotlib.pyplot as plt
import mapclassify as mc
import numpy as np

root_dir = "raw_data"
q1_dir = "Question 1_ Fare Reinstatement"

king_county = pd.read_csv(os.path.join(root_dir, "King_County_ACS_2019_tract.csv"))
gis_data = gpd.read_file(os.path.join(root_dir, "KCM_Stops_Data/kcm_stops.shp"))

apc_data = pd.read_csv(os.path.join(root_dir, q1_dir, "apc_detailed_09-01-2020_10-31-2020.csv"))
kcm_data = pd.read_csv(os.path.join(root_dir, q1_dir, "alltrips_2020-09_to_2020-10.csv"))
stop_data = pd.read_csv(os.path.join(root_dir, q1_dir, "stop_activity_granular_2020-09-01_2020-10-31.csv"))

desc_maps = {
	"apc_data_dictionary.xlsx": apc_data,
	"alltrips_data_dictionary.xlsx": kcm_data,
	"stop_activity_granular_data_dictionary.xlsx": stop_data,
}

for desc in desc_maps:
	desc_df = pd.read_excel(os.path.join(root_dir, q1_dir, desc))
	data_df_cols = desc_maps[desc].columns
	print(desc)
	for col in data_df_cols:
		print(f"`{col}` : {desc_df[desc_df['Column Name'] == col]['Description'].values[0]}\n")
	print("------------------------------")