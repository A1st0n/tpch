.headers on
SELECT sr.r_name AS supp_region, cr.r_name AS cust_region,
  strftime('%Y', l_shipdate) AS year, SUM(l_extendedprice*(1-l_discount)) AS revenue
FROM lineitem
JOIN supplier ON l_suppkey = s_suppkey
JOIN nation sn ON s_nationkey = sn.n_nationkey
JOIN region sr ON sn.n_regionkey = sr.r_regionkey
JOIN orders ON l_orderkey = o_orderkey
JOIN customer ON o_custkey = c_custkey
JOIN nation cn ON c_nationkey = cn.n_nationkey
JOIN region cr ON cn.n_regionkey = cr.r_regionkey
WHERE strftime('%Y', l_shipdate) IN ('1996', '1997')
GROUP BY supp_region, cust_region, year;
