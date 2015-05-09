DROP TABLE IF EXISTS funnel CASCADE;
CREATE TABLE funnel (k INTEGER, traffic_type TEXT, page TEXT, target TEXT, page_count INTEGER);

CREATE VIEW v_funnel AS
SELECT NOW()::DATE - k * '1 DAY'::INTERVAL tx_date, traffic_type, page, target, page_count
FROM funnel
;

INSERT INTO funnel
WITH tmp AS
(
    SELECT k, vc, p1::TEXT, p2::TEXT,
        CASE
        WHEN p2 = 'abandon' THEN NULL
        WHEN RANDOM() < 0.3 THEN 'confirmation page'
        ELSE 'abandon' END p3
    FROM
    (
        SELECT k, generate_series(1,visit_count) vc,
            'landing' p1,
            CASE
            WHEN RANDOM() > 0.6 THEN 'package A'
            WHEN RANDOM() < 0.4 THEN 'package B'
            ELSE 'abandon' END p2
        FROM
        (
            SELECT k.* k, (50 + RANDOM() * 100)::INTEGER visit_count
            FROM generate_series(1,30) k
        ) l
    ) f
)
SELECT k, 'http' traffic_type, p1 page, p2 target, COUNT(1) page_count
FROM tmp
GROUP BY k, p1, p2
  UNION ALL
SELECT k, 'http' traffic_type, p2 page, p3 target, COUNT(1) page_count
FROM tmp
WHERE p3 IS NOT NULL
GROUP BY k, p2, p3
;

INSERT INTO funnel
WITH tmp AS
(
    SELECT k, vc, p1::TEXT, p2::TEXT,
        CASE
        WHEN p2 = 'abandon' THEN NULL
        WHEN RANDOM() < 0.4 THEN 'confirmation page'
        ELSE 'abandon' END p3
    FROM
    (
        SELECT k, generate_series(1,visit_count) vc,
            'landing' p1,
            CASE
            WHEN RANDOM() > 0.6 THEN 'package A'
            WHEN RANDOM() < 0.4 THEN 'package B'
            ELSE 'abandon' END p2
        FROM
        (
            SELECT k.* k, (50 + RANDOM() * 100)::INTEGER visit_count
            FROM generate_series(1,7) k
        ) l
    ) f
)
SELECT k, 'mobile' traffic_type, p1 page, p2 target, COUNT(1) page_count
FROM tmp
GROUP BY k, p1, p2
  UNION ALL
SELECT k, 'mobile' traffic_type, p2 page, p3 target, COUNT(1) page_count
FROM tmp
WHERE p3 IS NOT NULL
GROUP BY k, p2, p3
;

INSERT INTO funnel
WITH tmp AS
(
    SELECT k, vc, p1::TEXT, p2::TEXT,
        CASE
        WHEN p2 = 'abandon' THEN NULL
        WHEN RANDOM() < 0.1 THEN 'confirmation page'
        ELSE 'abandon' END p3
    FROM
    (
        SELECT k, generate_series(1,visit_count) vc,
            'landing' p1,
            CASE
            WHEN RANDOM() > 0.6 THEN 'package A'
            WHEN RANDOM() < 0.4 THEN 'package B'
            ELSE 'abandon' END p2
        FROM
        (
            SELECT k.* k, (50 + RANDOM() * 100)::INTEGER visit_count
            FROM generate_series(8,30) k
        ) l
    ) f
)
SELECT k, 'mobile' traffic_type, p1 page, p2 target, COUNT(1) page_count
FROM tmp
GROUP BY k, p1, p2
  UNION ALL
SELECT k, 'mobile' traffic_type, p2 page, p3 target, COUNT(1) page_count
FROM tmp
WHERE p3 IS NOT NULL
GROUP BY k, p2, p3
;
