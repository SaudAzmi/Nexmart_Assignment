/*What product variable/column (description or property) usually contains data of good quality per manufacturer? And what is the % of good quality records per variable/column and manufacturer? */

SELECT
     manufacturername,
    'short_description' ,
    ROUND(SUM(CASE WHEN `Short description` IS NOT NULL THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS good_quality_pct
FROM clean_catalog
GROUP BY  manufacturername

UNION ALL

SELECT
    manufacturername,
    'short_description_2' AS variable,
    ROUND(SUM(CASE WHEN `Short description 2` IS NOT NULL  THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS good_quality_pct
FROM clean_catalog
GROUP BY  manufacturername

UNION ALL

SELECT
    manufacturername,
    'long_description' AS variable,
    ROUND(SUM(CASE WHEN `Long description` IS NOT NULL  THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS good_quality_pct
FROM clean_catalog
GROUP BY  manufacturername

UNION ALL

SELECT
    manufacturername,
    'technical_details' AS variable,
    ROUND(SUM(CASE WHEN `Technical details` IS NOT NULL  THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS good_quality_pct
FROM clean_catalog
GROUP BY  manufacturername;



