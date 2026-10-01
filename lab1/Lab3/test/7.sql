.headers on
SELECT SUM(o_totalprice) 
AS total_price 
FROM orders
 JOIN customer ON o_custkey = c_custkey 
 JOIN nation ON c_nationkey = n_nationkey 
 JOIN region ON n_regionkey = r_regionkey 
WHERE r_name = 'AMERICA' AND o_orderdate LIKE '1995-%';
