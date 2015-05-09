DROP TABLE IF EXISTS fraud CASCADE;
CREATE TABLE fraud (k INTEGER, is_fraud BOOLEAN,
    feature1 TEXT, feature2 TEXT, feature3 INTEGER, feature4 NUMERIC);

CREATE VIEW v_fraud AS
SELECT NOW()::DATE - k * '1 DAY'::INTERVAL tx_date, is_fraud, feature1, feature2, feature3, feature4
FROM fraud
;

DROP TABLE IF EXISTS tmp_fraud;
CREATE TEMPORARY TABLE tmp_fraud AS
SELECT mod(k,90) + 1 k, FALSE is_fraud,
    CASE
    WHEN f1 BETWEEN 50 AND 100 THEN 'A'
    WHEN f1 < 10 THEN 'B'
    WHEN f1 < 20 THEN 'C'
    ELSE 'D'
    END feature1,
    CASE
    WHEN f2 BETWEEN 50 AND 100 THEN 'X'
    WHEN f2 < 10 THEN 'Y'
    ELSE 'Z'
    END feature2,
    CASE WHEN f3 = 0 THEN 100 ELSE f3 END feature3,
    f4 feature4,
    r1
FROM
(
    SELECT k.* k,
        (RANDOM() * 100)::INTEGER f1,
        (RANDOM() * 100)::INTEGER f2,
        (RANDOM() * 100)::INTEGER f3,
        RANDOM() f4,
        RANDOM() r1
    FROM generate_series(1,90000) k
) l
;

INSERT INTO fraud
SELECT k,
    CASE
        WHEN r1 > 0.995 THEN TRUE
        WHEN feature1 = 'A' THEN FALSE
        WHEN feature1 = 'B' AND r1 < 0.01 THEN TRUE
        WHEN feature1 = 'C' AND r1 < 0.03 THEN TRUE
        WHEN feature1 = 'D' AND r1 < 0.01 THEN TRUE
        WHEN feature2 = 'X' THEN FALSE
        WHEN feature2 = 'Y' AND r1 < 0.05 THEN TRUE
        WHEN feature2 = 'Z' THEN FALSE
        WHEN feature3 < 60 THEN FALSE
        WHEN feature3 >= 60 AND ((feature3 - 60)/40.0)*r1 < 0.10 THEN TRUE
        WHEN (1 - feature4) * r1 < 0.10 THEN TRUE
        ELSE FALSE
        END is_fraud,
    feature1,
    feature2,
    feature3,
    feature4
FROM tmp_fraud
;
