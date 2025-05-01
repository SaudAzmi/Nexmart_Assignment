-- Which other interesting insights did you find? Please give us a short explanation together with the SQL statement used to retrieve it.

-- Columns with the Most Missing Values per Manufacturer
SELECT
     manufacturername,
    'short_description' AS variable,
    ROUND(SUM(CASE WHEN `Short description` IS Null THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS missing_percentage
FROM clean_catalog
GROUP BY  manufacturername

UNION ALL

SELECT
    manufacturername,
    'short_description_2' AS variable,
    ROUND(SUM(CASE WHEN `Short description 2` IS Null  THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS missing_percentage
FROM clean_catalog
GROUP BY  manufacturername

UNION ALL

SELECT
    manufacturername,
    'long_description' AS variable,
    ROUND(SUM(CASE WHEN `Long description` IS Null  THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS missing_percentage
FROM clean_catalog
GROUP BY  manufacturername

UNION ALL

SELECT
    manufacturername,
    'technical_details' AS variable,
    ROUND(SUM(CASE WHEN `Technical details` IS Null  THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS missing_percentage
FROM clean_catalog
GROUP BY  manufacturername;
