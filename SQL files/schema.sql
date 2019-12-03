DROP TABLE IF EXISTS agi;

CREATE TABLE agi (
zip_code VARCHAR PRIMARY KEY,
state VARCHAR,
total_agi FLOAT
);

DROP TABLE IF EXISTS homes;

CREATE TABLE homes (
zip_code VARCHAR PRIMARY KEY,
state VARCHAR,
"avg_listing" FLOAT
);