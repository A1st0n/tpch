.headers on
WITH spend AS (
    SELECT cr.r_name, SUM(l_extendedprice) AS total
    FROM lineitem
    JOIN orders ON o_orderkey = l_orderkey
    JOIN customer ON c_custkey = o_custkey
    JOIN nation cn ON cn.n_nationkey = c_nationkey
    JOIN region cr ON cr.r_regionkey = cn.n_regionkey
    JOIN supplier ON s_suppkey = l_suppkey
    JOIN nation sn ON sn.n_nationkey = s_nationkey
    WHERE sn.n_regionkey = cn.n_regionkey
    GROUP BY cr.r_name)
SELECT r_name AS region FROM spend WHERE total = (SELECT MAX(total) FROM spend);
