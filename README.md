# CISIL (UMich Team 2022)
Below are the instructions from the CISIL data extraction (in `raw_data.zip`)

## Data Overview
For sanity's sake, we're documenting the relevant things for each question here:

### Q1 Data
For Q1, the following data are relevant:

`KCM_Stops_Data/`: GIS spatial data (stop locations & attributes)
`Question 1_ Fare Reinstatement/*.csv` : data about rides (the excel files are just descriptions of what the columns mean)
`King_County_ACS_2019_tract.csv` : demographics from recent Census

### Q1 Data Descriptions
Here is a (long) set of descriptions of the relevant columns:

### apc_data_dictionary.xlsx
`SERVICE_CHANGE_NUM` : Three-digit code indicating the year and whether the service change is the first, second, or third service change of the year.  For example, the spring 2021 service change is SERVICE_CHANGE_NUM 211; the fall 2021 service change is SERVICE_CHANGE_NUM 212.

`OPERATION_DATE` : The service date the recorded service operated.  This date is the service date, which generally runs from 4am one day to 4am the next day.  So, for instance, regular weekday service scheduled for Friday, October 25, 2019 would have an OPERATION_DATE of 2019-10-25 even if that service ran in the early AM hours of Saturday, October 26.

`FIRST_STOP_ID` : Stop ID of the first stop of the trip.  For deadhead trips, this may be a stop at the base or a layover stop.

`LAST_STOP_ID` : Stop ID of the last stop of the trip.  For deadhead trips, this may be a stop at the base or a layover stop.

`SERVICE_RTE_NUM` : The customer-facing number of the route, i.e. the number used in timetables, at bus stops, in printed materials, and on buses' headsigns. This number may be different than BLOCK_RTE_NUM. All routes have a service number, even routes that are not known as numbered routes to customers. E.g. A line = route 671. Base deadhead for DART routes is not tracked in this table.

`SERVICE_TYPE_CD` : If null or starts with any letter than E, indicates local trip; if not null and begins with the letter E, an express trip

`EXPRESS_LOCAL_CD` : Express or local

`INBD_OUTBD_CD` : Inbound or outbound; inbound is towards primary attraction, which is usually the direction the route operates toward during the AM peak.

`TRIP_ID` : Unique identifier for each service, base or deadhead trip.  For layover, trip_ID is set to the trip_ID of the next service trip.

`SCHED_START_TIME_MNTS_AFTER_MIDNT` : Trip start time, in minutes after midnight of the service day. Trips that start after midnight, but that are associated with the previous calendar day's service, have values that exceed 1,440 (24 x 60).

`SCHED_END_TIME_MNTS_AFTER_MIDNT` : Trip end time, in minutes after midnight of the service day.  Trips that end after midnight, but that are associated with the previous calendar day's service, have values that exceed 1,440 (24 x 60).

`SCHED_START_TIME` : Scheduled trip start time, in hours and minutes AM or PM.  Trips that start after midnight, but that are associated with the previous calendar day's service, have a suffix of "X" instead of "AM".

`SCHED_END_TIME` : Scheduled trip end time, in hours and minutes AM or PM.  Trips that end after midnight, but that are associated with the previous calendar day's service, have a suffix of "X" instead of "AM".

`ACTUAL_START_TIME_MNTS_AFTER_MIDNT` : Actual trip start time, in minutes after midnight of the service day. Trips that start after midnight, but that are associated with the previous calendar day's service, have values that exceed 1,440 (24 x 60).

`ACTUAL_END_TIME_MNTS_AFTER_MIDNT` : Actual trip end time, in minutes after midnight of the service day. Trips that end after midnight, but that are associated with the previous calendar day's service, have values that exceed 1,440 (24 x 60).

`ACTUAL_START_TIME` : Actual trip start time, in hours and minutes AM or PM.  Trips that start after midnight, but that are associated with the previous calendar day's service, have a suffix of "X" instead of "AM".

`ACTUAL_END_TIME` : Actual trip end time, in hours and minutes AM or PM.  Trips that end after midnight, but that are associated with the previous calendar day's service, have a suffix of "X" instead of "AM".

`PSNGR_BOARDINGS` : The total number of boardings (rides, ridership, ons) registered for the entire trip; can exceed the coach's capacity on trips with high passenger turnover.

`PSNGR_ALIGHTINGS` : The total number of alightings (offs) registered for the trip; can exceed the coach's capacity on trips with high passenger turnover.

`PSNGR_MILES` : Number of miles traveled by all passengers on the trip.  Calculated on a stop-to-stop basis by taking the departing load from one stop, multiplying that by the distance to the next stop, repeating the process for all stop pairs, and summing the results.

`MAX_PSNGR_LOAD` : The highest number of passengers observed to have been on the coach at the same time.

`NUMBER_OF_STOPS` : The number of times the bus was observed to have stopped at bus stops.

`COACH_NUM` : The 4-digit ID of the coach that actually ran the trip.  May be different from the coach type indicated in the ALL_TRIPS table.

`KEY_BLOCK_NUM` : Unique identifier of vehicle assignment of trip, calculated as follows:  (Daycode *100000) + (block route number * 100) + block run number

`PATT_ID` : For service patterns, PATT_ID is a 8 digit positive integer comprised of the following elements from left to right:  digit 1: cardinal direction of pattern where N = 1, S=2, W=3, E=4; digit 2: Inbound/Outbound of pattern where inbound = 0, outbound = 1; digit 3-5: route number where padding zeros are added to the beginning of route for routes <100; digit 6-8: sch_pattern_ID.  For deadhead and base pattern, PATT_ID = Itn External No (from HASTUS) * -1

`FIRST_STOP_NM` : Name of the first stop of the trip.  For deadhead trips, this may be a stop at the base or a layover stop.

`LAST_STOP_NM` : Name of the last stop of the trip.  For deadhead trips, this may be a stop at the base or a layover stop.

`SCHED_DAY_TYPE_CODED_NUM` : 0 = weekday, 1 = Saturday, 2 = Sunday

`DAY_CODE` : WK = weekday, SA = Saturday, SU = Sunday, N/A = non-typical day

`TRIP_DURATION_VARIANCE` : Difference between scheduled running time and measured running time; negative values indicate trip took more time than was scheduled.

`ACTUAL_REVENUE_MILES` : Actual miles the coach ran on the trip.  Since this table contains only service trips, all miles are revenue miles.

`SCHED_REVENUE_MILES` : Scheduled revenue miles for the trip.  Revenue miles are miles traveled when the bus is available for customers to use.

`PCNT_PATT_QUALITY` : A measure of how well the path actually taken by the coach matches the path the coach was scheduled to take.  Detours off the scheduled path degrade pattern quality.  When pattern quality is below 90%, data is excluded from the TRIP_SUMMARY table.

`HOLIDAY_NAME` : When applicable, indicates the name of a holiday or other day that may have atypical ridership.  Excluded from the TRIP_SUMMARY table.

------------------------------
### alltrips_data_dictionary.xlsx
`SERVICE_CHANGE_NUM` : Three-digit code indicating the year and whether the service change is the first, second, or third service change of the year.  For example, the spring 2021 service change is SERVICE_CHANGE_NUM 211; the fall 2021 service change is SERVICE_CHANGE_NUM 212. Note that in the years from 2000-2009, the leading zeroes are dropped, and this number will be either 1 or 2 digits long. For example, the Spring 2000 service change has SERVICE_CHANGE_NUM = 1 and Fall 2005 has SERVICE_CHANGE_NUM = 53.

`MINOR_CHANGE_NUM` : Unique integer that identifies the biweekly period.  0 represents the service in effect on the first bi-weekly of the service change

`SCHED_DAY_TYPE_CODED_NUM` : 0 = weekday, 1 = Saturday, 2 = Sunday

`KEY_BLOCK_NUM` : Unique identifier of vehicle assignment of trip, calculated as follows:  (SCHED_DAY_TYPE_CODED_NUM *100000) + (BLOCK_RTE_NUM * 100) + BLOCK_RUN_NUM

`BLOCK_TOTAL_MILES` : Total mileage of entire block

`TRIP_MILES` : Mileage of trip.  0 for layover.  Null for trips where any TPI of the trip has not been mapped yet.

`BLOCK_RTE_NUM` : Block route number.  May be different than SERVICE_RTE_NUM.

`BLOCK_RUN_NUM` : Block run number

`SEAT_CNT` : # of seats of this bus type

`TRIP_ID` : Unique identifier for each service, base or deadhead trip.  For layover, trip_ID is set to the trip_ID of the next service trip.

`START_TIME_MNTS_AFTER_MIDNT` : Trip start time, in minutes after midnight of the service day. Trips that start after midnight, but that are associated with the previous calendar day's service, have values that exceed 1,440 (24 x 60).

`END_TIME_MNTS_AFTER_MIDNT` : Trip end time, in minutes after midnight of the service day.  Trips that end after midnight, but that are associated with the previous calendar day's service, have values that exceed 1,440 (24 x 60).

`DAY_PART_CD` : This field bins trips together based on start time of trip:  AM - 5AM-9AM, MID - 9AM-3PM, PM - 3PM-7PM, XEV - 7PM - 10PM, XNT 10PM - 5AM.  Note:  Historically, time periods have sometimes been different than this.  A weekend period of DAY was used to encompass AM, MID, and PM.

`PATT_ID` : For service patterns, PATT_ID is a 8 digit positive integer comprised of the following elements from left to right:  digit 1: cardinal direction of pattern where N = 1, S=2, W=3, E=4; digit 2: Inbound/Outbound of pattern where inbound = 0, outbound = 1; digit 3-5: route number where padding zeros are added to the beginning of route for routes <100; digit 6-8: sch_pattern_ID.  For deadhead and base pattern, PATT_ID = Itn External No (from HASTUS) * -1

`SERVICE_RTE_NUM` : The customer-facing number of the route, i.e. the number used in timetables, at bus stops, in printed materials, and on buses' headsigns. This number may be different than BLOCK_RTE_NUM. All routes have a service number, even routes that are not known as numbered routes to customers. E.g. A line = route 671. Base deadhead for DART routes is not tracked in this table.

`SERVICE_TYPE_CD` : If null or starts with any letter than E, indicates local trip; if not null and begins with the letter E, an express trip

`EXPRESS_LOCAL_CD` : E = Express; L = Local

`TRIP_COMPASS_DIR_CD` : Cardinal direction of trip

`INBD_OUTBD_CD` : Inbound or outbound; inbound is towards primary attraction, which is usually the direction the route operates toward during the AM peak.

`REVENUE_TRIP_SEQ_NUM` : The sequential number of the revenue trip in the block.  This column is left blank for deadhead trips and for layovers.

`FIRST_STOP_ID` : Stop ID of the first stop of the trip.  For deadhead trips, this may be a stop at the base or a layover stop.

`LAST_STOP_ID` : Stop ID of the last stop of the trip.  For deadhead trips, this may be a stop at the base or a layover stop.

`FIRST_STOP_NM` : Name of the first stop of the trip.  For deadhead trips, this may be a stop at the base or a layover stop.

`LAST_STOP_NM` : Name of the last stop of the trip.  For deadhead trips, this may be a stop at the base or a layover stop.

`TRIP_DURATION_MNTS` : Duration of trip in minutes: SCHED_END_TIME_MNTS_AFTER_MIDNT - SCHED_START_TIME_MNTS_AFTER_MIDNT

------------------------------
### stop_activity_granular_data_dictionary.xlsx
`OPERATION_DATE` : The date on which the trip was observed in YYYY-MM-DD format

`BOOKING_ID` : Shorthand code for the service change in a format expected by the Hastus NetPlan and ATP modules

`SCHED_DAY_TYPE_CODED_NUM` : 0 = weekday, 1 = Saturday, 2 = Sunday

`SERVICE_RTE_LIST` : The customer-facing number of the route (as text to facilitate the creation of the products based on this table), i.e. the number used in timetables, at bus stops, in printed materials, and on buses' headsigns. This number may be different than BLOCK_RTE_NUM. All routes have a service number, even routes that are not known as numbered routes to customers. E.g. A line = route 671.

`TRIP_COMPASS_DIR_CD` : Cardinal direction of trip

`KEY_BLOCK_NUM` : Unique identifier of vehicle assignment of trip, calculated as follows:  (SCHED_DAY_TYPE_CODED_NUM *100000) + (BLOCK_RTE_NUM * 100) + BLOCK_RUN_NUM

`STOP_SEQUENCE_NUM` : Numbered sequence of all bus stops, merging all patterns into a single sequence to provide a proper sequence of stops, regardless of which pattern a particular trip follows.

`STOP_ID` : Unique identifier for each bus stop

`STOP_NM` : The name of the stop

`SCHED_ARRIVAL_SECS_AFTER_MIDNT` : The time the bus is scheduled to arrive at the stop, expressed as hh:mm:ss without the colons. Valid only for timestops.

`FULL_DATE` : The date on which the trip was observed in MM/DD/YYYY format

`ACTUAL_ARRIVAL_SECS_AFTER_MIDNT` : The time the bus was measured to have arrived at the stop, expressed as hh:mm:ss without the colons

`ACTUAL_DEPARTURE_SECS_AFTER_MIDNT` : The time the bus was measured to have left the stop, expressed as hh:mm:ss without the colons

`PSNGR_BOARDINGS` : The number of passengers that boarded the bus

`PSNGR_ALIGHTINGS` : The number of passengers that departed the bus

`TRIP_ID` : Trip id

`DEP_PSNGR_LOAD` : Number of passengers on the coach

------------------------------

---

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
