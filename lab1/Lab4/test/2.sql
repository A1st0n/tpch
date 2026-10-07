.headers on
SELECT c_name, COUNT(*) AS order_cnt
FROM orders
JOIN customer ON o_custkey = c_custkey
JOIN nation ON c_nationkey = n_nationkey
WHERE n_name = 'MOZAMBIQUE'
  AND strftime('%Y', o_orderdate) = '1997'
GROUP BY c_name;
