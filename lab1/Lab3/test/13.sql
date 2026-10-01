.headers on
SELECT s_name, COUNT(*) AS discounted_items 
FROM lineitem JOIN supplier ON l_suppkey = s_suppkey 
WHERE l_discount = 0.1 GROUP BY s_name;
