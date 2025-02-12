/* 
# 1. Define variables
# 2. Create a CTE that rounds the average views per video
# 3. Select the columns you need and create calculated columns from existing ones
# 4. Filter results by YouTube channels
# 5. Sort results by net profits (from highest to lowest)
*/


DECLARE @conversionRate FLOAT = 0.02; -- the conversion rate at 2%
DECLARE @productCost MONEY  = 5.0; -- the product cost at $5
DECLARE @campaignCost MONEY = 50000.0; -- the campaign cost at $50,000




With ChannelData AS (
	SELECT 
		channel_name,
		total_subscribers,
		total_views,
		total_videos,
		ROUND(CAST(total_views AS FLOAT) / total_videos, -4) AS rounded_avg_views_per_video 
	FROM 
		youtube_db.dbo.view_uk_youtubers_2024

)


SELECT 
	channel_name,
	rounded_avg_views_per_video,
	(rounded_avg_views_per_video * @conversionRate) AS potential_units_sold_per_video,
	(rounded_avg_views_per_video * @conversionRate * @productCost) AS potential_revenue_per_video,
	((rounded_avg_views_per_video * @conversionRate * @productCost) - @campaignCost) AS net_profit

FROM 
	ChannelData 

ORDER BY 
    total_subscribers DESC, net_profit DESC

OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY;


