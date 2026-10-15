.headers on
SELECT SUM(CASE WHEN sn.n_name = 'GERMANY' THEN l_extendedprice*(1-l_discount) ELSE 0 END)
       / SUM(l_extendedprice*(1-l_discount)) AS GERMANY_in_ASIA_in_1995
FROM lineitem
JOIN orders ON l_orderkey = o_orderkey
JOIN customer ON o_custkey = c_custkey
JOIN nation cn ON c_nationkey = cn.n_nationkey
JOIN region cr ON cn.n_regionkey = cr.r_regionkey
JOIN supplier ON l_suppkey = s_suppkey
JOIN nation sn ON s_nationkey = sn.n_nationkey
WHERE cr.r_name = 'ASIA'
  AND strftime('%Y', l_shipdate) = '1995';
