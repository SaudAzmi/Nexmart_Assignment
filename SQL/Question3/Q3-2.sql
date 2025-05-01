-- Which language has the biggest improvement potential in their data quality in absolute and relative numbers?

SELECT 
    language,
    COUNT(*) AS total_records,
    
    -- Count  fields are NULL or empty per record
    SUM(
        (`Short description` IS NULL OR `Short description` = '') +
        (`Short description 2` IS NULL OR `Short description 2` = '') +
        (`Long description` IS NULL OR `Long description` = '') +
        (`Technical details` IS NULL OR `Technical details` = '')
    
    ) AS total_bad_fields,
 -- Adding fields
    ROUND(
        SUM(
            (`Short description` IS NULL OR `Short description` = '') +
            (`Short description 2` IS NULL OR `Short description 2` = '') +
            (`Long description` IS NULL OR `Long description` = '') +
            (`Technical details` IS NULL OR `Technical details` = '')
        ) / (COUNT(*) * 4), 2
    ) AS relative_bad_quality 
 FROM clean_catalog
GROUP BY language
ORDER BY total_bad_fields DESC;
