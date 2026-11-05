.headers on
-- exchange per country per year; columns are the change vs the previous year
WITH ex AS (
    SELECT n_name,
           SUM(CASE WHEN yr = '1996' THEN v ELSE 0 END) AS e96,
           SUM(CASE WHEN yr = '1997' THEN v ELSE 0 END) AS e97,
           SUM(CASE WHEN yr = '1998' THEN v ELSE 0 END) AS e98
    FROM (
        SELECT n_name, strftime('%Y', l_shipdate) AS yr,
               CASE WHEN s_nationkey = n_nationkey THEN 1 ELSE -1 END AS v
        FROM lineitem
        JOIN supplier ON s_suppkey = l_suppkey
        JOIN orders ON o_orderkey = l_orderkey
        JOIN customer ON c_custkey = o_custkey
        JOIN nation ON n_nationkey IN (s_nationkey, c_nationkey)
        WHERE s_nationkey <> c_nationkey)
    GROUP BY n_name)
SELECT n_name AS country, e97 - e96 AS '1997', e98 - e97 AS '1998'
FROM ex;
