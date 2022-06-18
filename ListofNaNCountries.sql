
SELECT DISTINCT country, winery
FROM locationdt loc
WHERE loc.winery IN 
				(SELECT DISTINCT winery
				FROM locationdt
				WHERE locationdt.country IS NULL)
AND loc.country IS NOT NULL 
;