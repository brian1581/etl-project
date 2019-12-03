SELECT agi.zip_code, agi.state, agi.total_agi, homes.avg_listing
FROM agi
JOIN homes
ON agi.zip_code = homes.zip_code;