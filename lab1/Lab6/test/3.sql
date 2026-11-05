.headers on
SELECT DISTINCT p_name AS part
FROM part
JOIN lineitem ON l_partkey = p_partkey

JOIN orders ON o_orderkey = l_orderkey

JOIN customer ON c_custkey = o_custkey

JOIN nation ON n_nationkey = c_nationkey
JOIN region ON r_regionkey = n_regionkey

WHERE r_name = 'ASIA'
  AND p_partkey IN (
    SELECT ps_partkey
    FROM partsupp
    JOIN supplier ON s_suppkey = ps_suppkey
    JOIN nation ON n_nationkey = s_nationkey
    JOIN region ON r_regionkey = n_regionkey
    WHERE r_name = 'AFRICA'
    GROUP BY ps_partkey
    HAVING COUNT(*) = 3);
