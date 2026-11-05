.headers on
SELECT DISTINCT s_name AS supplier, c_name 

AS customer, o_totalprice AS price
FROM orders
JOIN customer ON c_custkey = o_custkey
JOIN lineitem ON l_orderkey = o_orderkey
JOIN supplier ON s_suppkey = l_suppkey

WHERE o_orderstatus = 'F'
  AND o_totalprice = (SELECT MAX(o_totalprice) FROM orders WHERE o_orderstatus = 'F');
