DROP TABLE IF EXISTS application;
CREATE TABLE application
(
    country TEXT,
    first_name TEXT,
    last_name TEXT,
    email TEXT PRIMARY KEY,
    degree_max TEXT,
    major TEXT,
    insert_timestamp TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
)
;

CREATE OR REPLACE FUNCTION u_load_application
(
    v_country TEXT,
    v_first_name TEXT,
    v_last_name TEXT,
    v_email TEXT,
    v_degree_max TEXT,
    v_major TEXT,
    v_cohort TEXT
)
RETURNS INTEGER
LANGUAGE plpgsql AS $$
DECLARE
    v_new BOOLEAN;
    v_return INTEGER;

BEGIN

    SELECT COUNT(1) = 0 INTO v_new
    FROM application
    WHERE email = v_email
    ;

    IF v_new THEN
        v_return = 0;

        INSERT INTO application
        (
          country,
          first_name,
          last_name,
          email,
          degree_max,
          major,
          cohort
        )
        VALUES
        (
          v_country,
          v_first_name,
          v_last_name,
          v_email,
          v_degree_max,
          v_major,
          v_cohort
        )
        ;
    ELSE
        v_return = 1;

    END IF;

    RETURN v_return;

END;
$$;
