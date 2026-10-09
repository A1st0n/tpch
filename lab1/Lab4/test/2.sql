.headers on
SELECT c_name, COUNT(*) AS order_cnt
From orders
Join customer ON o_custkey = c_custkey
JOIN nation on c_nationkey = n_nationkey
WHERE n_name = 'MOZAMBIQUE'
  and strftime('%Y', o_orderdate) = '1997'
GROUP BY c_name;
