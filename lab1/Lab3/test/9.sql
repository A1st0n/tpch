.headers on
SELECT substr(l_receiptdate, 1, 7) AS year_month, COUNT(*) AS items 
FROM lineitem JOIN orders ON l_orderkey = o_orderkey 
JOIN customer ON o_custkey = c_custkey 
WHERE c_name = 'Customer#000000227' 
GROUP BY year_month;
