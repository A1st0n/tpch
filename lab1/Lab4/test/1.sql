.headers on
SELECT n_name, COUNT(*) AS order_cnt
FROM orders
join customer ON o_custkey = c_custkey
JOIN nation ON c_nationkey = n_nationkey
JOIN region ON n_regionkey = r_regionkey
WHERE r_name = 'MIDDLE EAST'
GROUP BY n_name;
