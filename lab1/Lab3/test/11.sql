.headers on
SELECT COUNT(*) AS order_cnt
FROM orders JOIN customer ON o_custkey = c_custkey JOIN nation ON c_nationkey = n_nationkey 
WHERE n_name = 'ROMANIA' AND o_orderpriority = '1-URGENT' AND substr(o_orderdate, 1, 4) BETWEEN '1993' AND '1997';
