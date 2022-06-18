CREATE TABLE IF NOT EXISTS winespd (
country TEXT,
description TEXT,
designation TEXT,
points INT8,
price INT8,
province TEXT,
region_1 TEXT,
variety TEXT,
winery TEXT
)


INSERT INTO winespd (country, description, designation, points, price, province, region_1, variety, winery)
SELECT DISTINCT
cdt.country
,wdr.description 
,COALESCE(wdr.designation, '')
,wdr.points  
,COALESCE(wdr.price,0) 
,COALESCE(wdr.province,'') 
,COALESCE(wdr.region_1,'')
,COALESCE(wdr.variety,'') 
,wdr.winery 
FROM winedataraw wdr
LEFT JOIN countrydt cdt ON wdr.winery = cdt.winery 
;

