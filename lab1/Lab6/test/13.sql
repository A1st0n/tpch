.headers on
WITH cnt AS (
    SELECT n_name, COUNT(*) AS c
    FROM customer
    JOIN nation ON n_nationkey = c_nationkey
    GROUP BY n_name)
SELECT n_name AS country FROM cnt WHERE c = (SELECT MAX(c) FROM cnt);
