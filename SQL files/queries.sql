SELECT * FROM agi
WHERE total_agi > '500000';

SELECT * FROM homes
WHERE avg_listing < 300000;

SELECT * FROM agi
WHERE zip_code = 97132;

SELECT agi.zip_code, agi.state, agi.total_agi, homes.avg_listing
FROM agi
JOIN homes
ON agi.zip_code = homes.zip_code;

SELECT * FROM agi
WHERE zip_code = '10001';

CREATE VIEW high_income_low_housing AS
SELECT agi.zip_code, agi.state, agi.total_agi, homes.avg_listing
FROM agi
JOIN homes
ON agi.zip_code = homes.zip_code
WHERE agi.total_agi > 250000 AND homes.avg_listing < 250000;

CREATE VIEW low_income_high_housing AS
SELECT agi.zip_code, agi.state, agi.total_agi, homes.avg_listing
FROM agi
JOIN homes
ON agi.zip_code = homes.zip_code
WHERE agi.total_agi < 100000 AND homes.avg_listing > 500000;