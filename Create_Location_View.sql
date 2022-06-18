CREATE OR REPLACE VIEW countrydt AS 

WITH country_lookup AS (
	SELECT
  	DISTINCT ON (winery) country, winery
	FROM locationdt
	WHERE country IS NOT NULL
  )

SELECT 
country_lookup.country
,locationdt.winery
,locationdt.designation 
,locationdt.variety
,locationdt.province 
FROM
locationdt
	JOIN
	country_lookup
	ON
	locationdt.winery = country_lookup.winery;