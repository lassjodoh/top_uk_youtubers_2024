/*

# Data Quality tests

1. Data need to 100 records of youtube channnels (row count test)	(Passed!!!)
2. The data needs 4 fields (column count test)	(Passed!!!)
3. The channel name column must be string format and the other columns must be numerical data types (data type checks)	(Passed!!!)
4. Each record must be unique in the data set (Run a duplicate count check)	(Passed!!!)

Row count - 100 
column count - 4

Data types

channel_name = VARCHAR
total_subscribers = INTEGER
total_views = INTEGER
total_videos = INTEGER

Duplicate Count = 0

*/


-- 1. Row count check

SELECT 
	COUNT(*) as no_of_rows 
FROM
	view_uk_youtubers_2024

-- 2. Column count check

SELECT 
	COUNT(*) as column_count
FROM 
	INFORMATION_SCHEMA.COLUMNS
WHERE 
	TABLE_NAME = 'view_uk_youtubers_2024'

-- 3. Data type check

SELECT 
	COLUMN_NAME,
	DATA_TYPE
FROM 
	INFORMATION_SCHEMA.COLUMNS
WHERE 
	TABLE_NAME = 'view_uk_youtubers_2024'


-- 4. Duplicate records check

SELECT 
	channel_name, 
	Count(*) as duplicate_count
FROM 
	view_uk_youtubers_2024
GROUP BY 
	channel_name
HAVING 
	count(*) > 1



