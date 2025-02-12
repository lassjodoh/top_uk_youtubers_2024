/*


# Data cleaning steps

1. Remove unnecessary columns by only selecting the ones we need
2. Extract the Youtube channel names from the first columns
3. Rename the column names


*/


--SELECT 
--	NOMBRE, 
--	total_subscribers,
--	total_views,
--	total_videos
--FROM
--	top_uk_youtubers_2024


-- CHARINDEX

-- SELECT CHARINDEX('@', NOMBRE), NOMBRE FROM top_uk_youtubers_2024


CREATE VIEW view_uk_youtubers_2024 AS

SELECT 
	CAST(SUBSTRING(NOMBRE, 1, CHARINDEX('@', NOMBRE) -1) AS VARCHAR(100)) AS channel_name,
	total_subscribers,
	total_views,
	total_videos	
FROM 
	top_uk_youtubers_2024