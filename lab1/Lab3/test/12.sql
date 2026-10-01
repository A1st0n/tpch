.headers on
SELECT substr(o_orderdate, 1, 4) AS year, COUNT(*) AS item_cnt 
FROM lineitem JOIN orders ON l_orderkey = o_orderkey JOIN supplier ON l_suppkey = s_suppkey 
JOIN nation ON s_nationkey = n_nationkey 
WHERE o_orderpriority = '3-MEDIUM' AND n_name IN ('ARGENTINA', 'BRAZIL') GROUP BY year;
