/*Question 1) Which manufacturers have the biggest improvement potential in their data quality in absolute and relative numbers? */
SELECT 
    manufacturername,
    COUNT(*) AS total_records,
    ---- Total number of bad fields (NULL or empty descriptions)
    SUM(
        (`Short description` IS NULL OR `Short description` = '') +
        (`Short description 2` IS NULL OR `Short description 2` = '') +
        (`Long description` IS NULL OR `Long description` = '') +
        (`Technical details` IS NULL OR `Technical details` = '')
    
    ) AS total_bad_fields,
-- Relative bad quality = bad fields / total possible fields 
    ROUND(
        SUM(
            (`Short description` IS NULL OR `Short description` = '') +
            (`Short description 2` IS NULL OR `Short description 2` = '') +
            (`Long description` IS NULL OR `Long description` = '') +
            (`Technical details` IS NULL OR `Technical details` = '')
        ) / (COUNT(*) * 4), 2
    ) AS relative_bad_quality 
 FROM clean_catalog
GROUP BY manufacturername
ORDER BY total_bad_fields DESC;
