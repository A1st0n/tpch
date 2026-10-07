.headers on
SELECT sr.r_name AS supp_region, cr.r_name AS cust_region, MIN(o_totalprice) AS min_price
FROM orders
JOIN lineitem ON l_orderkey = o_orderkey
JOIN supplier ON l_suppkey = s_suppkey
JOIN nation sn ON s_nationkey = sn.n_nationkey
JOIN region sr ON sn.n_regionkey = sr.r_regionkey
JOIN customer ON o_custkey = c_custkey
JOIN nation cn ON c_nationkey = cn.n_nationkey
JOIN region cr ON cn.n_regionkey = cr.r_regionkey
GROUP BY sr.r_name, cr.r_name;
