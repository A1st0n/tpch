.headers on
SELECT DISTINCT n_name 
FROM orders JOIN customer ON o_custkey = c_custkey 
JOIN nation ON c_nationkey = n_nationkey WHERE o_orderdate LIKE '1994-12-%' ORDER BY n_name;
