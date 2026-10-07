.headers on
SELECT n_name, COUNT(DISTINCT o_orderkey) AS order_cnt
FROM orders
JOIN lineitem ON l_orderkey = o_orderkey
JOIN supplier ON l_suppkey = s_suppkey
JOIN nation ON s_nationkey = n_nationkey
JOIN region ON n_regionkey = r_regionkey
WHERE r_name = 'AMERICA'
  AND o_orderstatus = 'F'
  AND strftime('%Y', o_orderdate) = '1994'
GROUP BY n_name
HAVING COUNT(DISTINCT o_orderkey) > 250;
