# CISIL (UMich Team 2022)
Below are the instructions from the CISIL data extraction (in `raw_data.zip`)

## Guide to the data for the CISIL Data Challenge

This folder contains all relevant data for the policy questions posed in the CISIL Data Challenge. Thank you to King County Metro (KCM) for curating and providing these transportation data.

*README Updates*:

March 21, 2022: Added recent files and updated file descriptions to Question 1 sub-folder.

March 23, 2022: Added additional data files to Question 2 sub-folder; included Data Challenge Information package in raw_data folder.

**Sub-folder contents:**

KCM_Stops_Data folder contains the shapefiles with KCM bus stop locations:

    -   kcm_stops.cpg

    -   kcm_stops.dbf

    -   kcm_stops.prj

    -   kcm_stops.sbn

    -   kcm_stops.sbx

    -   kcm_stops.shp

    -   kcm_stops.shx

    -   kcm_stops.xml

Question 1: Fare Reinstatement folder contains the detailed automated passenger count data from September 1, 2020 through October 31, 2020:

    -   apc_data_dictionary.xlsx [Master data dictionary for APC data, includes more variables than those made available in the data files.]

    -   apc_detailed_09-01-2020_10-31-2020.csv [Route-level APC data]
    
    -   alltrips_2020-09_to_2020-10.csv [file of all scheduled KCM trips]
    
    -   alltrips_data_dictionary.xlsx [data dictionary corresponding to alltrips_2020-09_to_2020-10.csv]
    
    -   stop_activity_granular_2020-09-01_2020-10-31.csv [Stop-level APC data]
    
    -   stop_activity_granular_data_dictionary.xlsx [data dictionary corresponding to stop_activity_granular_2020-09-01_2020-10-31.csv]

Question 2: Fare Subsidies folder contains the ORCA LIFT data:

    -   LIFT_data_dictionary.xlsx [data dictionary corresponding to LIFT data files]

    -   LIFT_boardings.csv [includes boardings data from March 5, 2017 to October 31, 2021]

    -   LIFT_registry.csv [includes registry data from March 1, 2017 to May 3, 2021]

    -   LIFT_sales.csv [includes sales data from March 5, 2017 to October 31, 2021]
    
    -   LIFT_boardings_2021-11-01_to_2022-03-06.csv [includes boardings data from November 11, 2021 to March 6, 2022; can be appended to LIFT_boardings.csv]
    
    -   LIFT_registry_2022-03-22.csv [includes registry data from March 1, 2017 to March 22, 2022]
    
    -   LIFT_sales_2021-11-01_to_2022-03-06.csv [includes sales data from November 1, 2021 to March 6, 2022; can be appended to LIFT_sales.csv]

Remaining Files:

This folder also contains the 2019 5-year American Community Survey data for all census tracts in King County, WA on a list of selected variables (King_County_ACS_2019_tract.csv). \[**Note**: The 2019 data are the most recent available for King County.\] The ACS_Variables_Selected.xlsx file lists the selected variables and their descriptions.

It also includes the Data Challenge Information Package file shared with teams via email and campuswire.

Additional data available:

-   GTFS for stop/route/schedule information can be accessed through [[GTFS feeds]](https://developers.google.com/transit/gtfs), [[SoundTransit]](https://www.soundtransit.org/help-contacts/business-information/open-transit-data-otd/otd-downloads), and [[TransitFeeds]](https://www.soundtransit.org/help-contacts/business-information/open-transit-data-otd/otd-downloads).

-   The complete 2019 5-year American Community Survey can be accessed via API through the [[U.S. Census website]](https://www.census.gov/data/developers/data-sets/acs-5year.html).
