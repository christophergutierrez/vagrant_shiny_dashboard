CREATE TEMPORARY TABLE tmp_country
(
    country_code CHAR(2),
    lat NUMERIC,
    lng NUMERIC,
    country_name TEXT
)
;
COPY tmp_country FROM
'/vagrant/git_home/vagrant_shiny_dashboard/vagrant_init/database/country.csv'
DELIMITER ',' CSV;

DROP TABLE IF EXISTS country;
CREATE TABLE country
(
    country_id INTEGER PRIMARY KEY,
    country_name TEXT,
    country_code CHAR(2),
    lat NUMERIC,
    lng NUMERIC
)
;
INSERT INTO country
SELECT
    rank() OVER (ORDER BY country_name) country_id,
    country_name,
    country_code,
    lat,
    lng
FROM tmp_country
ORDER BY country_name
;

