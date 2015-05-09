--==============================================================================
-- Generate raw table
--==============================================================================
DROP TABLE IF EXISTS tx;
CREATE TABLE tx AS
WITH RECURSIVE t(n) AS (
    SELECT 1, 365*RANDOM() rnd_date, RANDOM() rnd_country, RANDOM() rnd_fraud
    UNION ALL
    SELECT n+1, 365*RANDOM(), RANDOM(), RANDOM()
    FROM t
    WHERE n < 1000000
)
SELECT now() - rnd_date*'1 DAY'::INTERVAL tx_timestamp,
        CASE
            WHEN rnd_country >= 0.50 THEN 1
            WHEN rnd_country <  0.10 THEN 2
            WHEN rnd_country <  0.20 THEN 3
            WHEN rnd_country <  0.30 THEN 4
            WHEN rnd_country <  0.40 THEN 5
            ELSE 6 END country_id,
        CASE
            WHEN rnd_country >= 0.50 AND rnd_fraud < 0.10 THEN TRUE
            WHEN rnd_country <  0.10 AND rnd_fraud < 0.25 THEN TRUE
            WHEN rnd_country <  0.20 AND rnd_fraud < 0.10 THEN TRUE
            WHEN rnd_country <  0.30 AND rnd_fraud < 0.10 THEN TRUE
            WHEN rnd_country <  0.40 AND rnd_fraud < 0.25 THEN TRUE
            ELSE FALSE END fraud
FROM t;
