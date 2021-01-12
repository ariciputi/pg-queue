WITH next_job AS (
    SELECT
        id
    FROM
        schedule
    WHERE
        next_run <= '2020-12-16T11:00+01'
    ORDER BY
        next_run,
        priority DESC
    FOR UPDATE
        SKIP LOCKED
    LIMIT 1)
UPDATE
    schedule
SET
    next_run = '2020-12-17T09:00+01'
WHERE
    id = (
        SELECT
            id
        FROM
            next_job)
RETURNING
    *;

SELECT
    *
FROM
    schedule
WHERE
    next_run <= '2020-12-16T11:00+01'
ORDER BY
    next_run,
    priority DESC
FOR UPDATE
    SKIP LOCKED
LIMIT 1;

UPDATE
    schedule
SET
    next_run = '2020-12-17T09:00+01'
WHERE
    id = (
        SELECT
            id
        FROM
            schedule
        WHERE
            next_run <= '2020-12-16T11:00+01'
        ORDER BY
            next_run,
            priority DESC
        FOR UPDATE
            SKIP LOCKED
        LIMIT 1)
RETURNING
    *;

SELECT
    *
FROM
    schedule
WHERE
    next_run <= '2020-12-16T11:00+01'
ORDER BY
    next_run,
    priority DESC
FOR UPDATE
    SKIP LOCKED
LIMIT 1;

INSERT INTO schedule (schedule, job_spec, next_run, priority)
    VALUES ('0 10 * * *', 'bar.sh', '2020-12-16T10:00+01', 3);

SELECT
    *
FROM
    schedule
WHERE
    next_run <= now()
ORDER BY
    next_run;

INSERT INTO schedule (schedule, job_spec, next_run, priority)
    VALUES ('0 9 * * *', 'bar.sh', '2020-12-16T09:00+01', 3);

INSERT INTO schedule (schedule, job_spec, next_run, priority)
    VALUES ('0 10 1 * *', 'baz.sh', '2020-01-01T10:00+01', 2);

INSERT INTO schedule (schedule, job_spec, next_run, priority)
    VALUES ('0 9 * * *', 'bar.sh', '2020-12-16T09:00+01', 1);

CREATE TABLE schedule (
    id serial,
    schedule text,
    job_spec text,
    next_run timestamp with time zone,
    priority integer
);

