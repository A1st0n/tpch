.headers on
SELECT r_name, COUNT(*) AS order_cnt FROM orders JOIN customer ON o_custkey = c_custkey 
JOIN nation ON c_nationkey = n_nationkey JOIN region ON n_regionkey = r_regionkey 
WHERE o_orderstatus = 'F' GROUP BY r_name;
