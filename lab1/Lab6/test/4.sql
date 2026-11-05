.headers on
WITH sales AS (
    SELECT n_name, SUM(l_extendedprice) AS total
    FROM lineitem
    JOIN supplier ON s_suppkey = l_suppkey
    JOIN nation ON n_nationkey = s_nationkey
    WHERE strftime('%Y', l_shipdate) = '1994'
    GROUP BY n_name)
SELECT n_name AS country FROM sales WHERE total = (SELECT MIN(total) FROM sales);
