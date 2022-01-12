


-- Creating a table to insert all the data from date 2020-11 to 2021-11
-- This table will contain the useful information about the data.

DROP TABLE IF EXISTS Citibike_Analysis..tripdata_2020_11_2021_11_clean
CREATE TABLE Citibike_Analysis..tripdata_2020_11_2021_11_clean (
  trip_id varchar(50),
  ride_type varchar(50),
  start_dt datetime,
  end_dt datetime,
  member_type varchar(50),
  trip_length time,
  week_day varchar(50));


/* Inserting values into the table
  2 new columns - 
    trip_length - Gives the time for which the bike was used.
	week_day - Gives the day when the bike was used. */

INSERT INTO Citibike_Analysis..tripdata_2020_11_2021_11_clean
SELECT ride_id, rideable_type, started_at, ended_at, member_casual, 
  DATEADD(SECOND, DATEDIFF(SECOND, started_at, ended_at), 0) AS ride_length,
  DATENAME(WEEKDAY, started_at) AS week_day
FROM 
  Citibike_Analysis..[2020_11_tripdata]
WHERE
  ended_at <> started_at And ended_at > started_at  -- This specifies that end time is not equal or lesser than the start time

UNION ALL

SELECT ride_id, rideable_type, started_at, ended_at, member_casual, 
  DATEADD(SECOND, DATEDIFF(SECOND, started_at, ended_at), 0) AS ride_length,
  DATENAME(WEEKDAY, started_at) AS week_day
FROM 
  Citibike_Analysis..[2020_12_tripdata]
WHERE
  ended_at <> started_at And ended_at > started_at

UNION ALL

SELECT ride_id, rideable_type, started_at, ended_at, member_casual, 
  DATEADD(SECOND, DATEDIFF(SECOND, started_at, ended_at), 0) AS ride_length,
  DATENAME(WEEKDAY, started_at) AS week_day
FROM 
  Citibike_Analysis..[2021_01_tripdata]
WHERE
  ended_at <> started_at And ended_at > started_at

UNION ALL

SELECT ride_id, rideable_type, started_at, ended_at, member_casual, 
  DATEADD(SECOND, DATEDIFF(SECOND, started_at, ended_at), 0) AS ride_length,
  DATENAME(WEEKDAY, started_at) AS week_day
FROM 
  Citibike_Analysis..[2021_02_tripdata]
WHERE
  ended_at <> started_at And ended_at > started_at

UNION ALL

SELECT ride_id, rideable_type, started_at, ended_at, member_casual, 
  DATEADD(SECOND, DATEDIFF(SECOND, started_at, ended_at), 0) AS ride_length,
  DATENAME(WEEKDAY, started_at) AS week_day
FROM 
  Citibike_Analysis..[2021_03_tripdata]
WHERE
  ended_at <> started_at And ended_at > started_at

UNION ALL

SELECT ride_id, rideable_type, started_at, ended_at, member_casual, 
  DATEADD(SECOND, DATEDIFF(SECOND, started_at, ended_at), 0) AS ride_length,
  DATENAME(WEEKDAY, started_at) AS week_day
FROM 
  Citibike_Analysis..[2021_04_tripdata]
WHERE
  ended_at <> started_at And ended_at > started_at

UNION ALL

SELECT ride_id, rideable_type, started_at, ended_at, member_casual, 
  DATEADD(SECOND, DATEDIFF(SECOND, started_at, ended_at), 0) AS ride_length,
  DATENAME(WEEKDAY, started_at) AS week_day
FROM 
  Citibike_Analysis..[2021_05_tripdata]
WHERE
  ended_at <> started_at And ended_at > started_at

UNION ALL

SELECT ride_id, rideable_type, started_at, ended_at, member_casual, 
  DATEADD(SECOND, DATEDIFF(SECOND, started_at, ended_at), 0) AS ride_length,
  DATENAME(WEEKDAY, started_at) AS week_day
FROM 
  Citibike_Analysis..[2021_06_tripdata]
WHERE
  ended_at <> started_at And ended_at > started_at

UNION ALL

SELECT ride_id, rideable_type, started_at, ended_at, member_casual, 
  DATEADD(SECOND, DATEDIFF(SECOND, started_at, ended_at), 0) AS ride_length,
  DATENAME(WEEKDAY, started_at) AS week_day
FROM 
  Citibike_Analysis..[2021_07_tripdata]
WHERE
  ended_at <> started_at And ended_at > started_at

UNION ALL

SELECT ride_id, rideable_type, started_at, ended_at, member_casual, 
  DATEADD(SECOND, DATEDIFF(SECOND, started_at, ended_at), 0) AS ride_length,
  DATENAME(WEEKDAY, started_at) AS week_day
FROM 
  Citibike_Analysis..[2021_08_tripdata]
WHERE
  ended_at <> started_at And ended_at > started_at

UNION ALL

SELECT ride_id, rideable_type, started_at, ended_at, member_casual, 
  DATEADD(SECOND, DATEDIFF(SECOND, started_at, ended_at), 0) AS ride_length,
  DATENAME(WEEKDAY, started_at) AS week_day
FROM 
  Citibike_Analysis..[2021_09_tripdata]
WHERE
  ended_at <> started_at And ended_at > started_at

UNION ALL

SELECT ride_id, rideable_type, started_at, ended_at, member_casual, 
  DATEADD(SECOND, DATEDIFF(SECOND, started_at, ended_at), 0) AS ride_length,
  DATENAME(WEEKDAY, started_at) AS week_day
FROM 
  Citibike_Analysis..[2021_10_tripdata]
WHERE
  ended_at <> started_at And ended_at > started_at

UNION ALL

SELECT ride_id, rideable_type, started_at, ended_at, member_casual, 
  DATEADD(SECOND, DATEDIFF(SECOND, started_at, ended_at), 0) AS ride_length,
  DATENAME(WEEKDAY, started_at) AS week_day
FROM 
  Citibike_Analysis..[2021_11_tripdata]
WHERE
  ended_at <> started_at And ended_at > started_at;



-- This will show the top 100 rows of the trips data - 12 months
SELECT TOP(100) *
FROM Citibike_Analysis..tripdata_2020_11_2021_11_clean;


-- Total 12 months trips data - Number of rows in it.
SELECT COUNT(*) AS Total_rows
FROM Citibike_Analysis..tripdata_2020_11_2021_11_clean;




-- Mean of trip_length
SELECT cast(cast(avg(cast(CAST(trip_length as datetime) as float)) as datetime) as time) AS mean_trip_length
FROM Citibike_Analysis..tripdata_2020_11_2021_11_clean;




-- Gives MAX of trip_length
SELECT MAX(trip_length) AS max_trip_length
FROM Citibike_Analysis..tripdata_2020_11_2021_11_clean;



-- To get which row has the max trip_length
SELECT *
FROM Citibike_Analysis..tripdata_2020_11_2021_11_clean
WHERE trip_length = (
  SELECT MAX(trip_length) 
  FROM Citibike_Analysis..tripdata_2020_11_2021_11_clean);
  



-- Gives the count of the days when trips took place

SELECT week_day, COUNT(*) AS count_days
FROM Citibike_Analysis..tripdata_2020_11_2021_11_clean 
GROUP BY week_day
ORDER BY count_days DESC;


