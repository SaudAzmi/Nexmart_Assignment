-- ----Average Product Weight by Manufacturer-----
SELECT Manufacturername, AVG(`Weight kg`) AS average_weight
FROM clean_catalog
GROUP BY Manufacturername
ORDER BY average_weight DESC;
