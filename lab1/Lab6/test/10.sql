.headers on
WITH spend AS (
    SELECT n_name, SUM(o_totalprice) AS total
    FROM orders
    JOIN customer ON c_custkey = o_custkey
    JOIN nation ON n_nationkey = c_nationkey
    GROUP BY n_name)
SELECT n_name AS country FROM spend WHERE total = (SELECT MAX(total) FROM spend);
