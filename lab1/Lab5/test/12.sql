.headers on
SELECT o_orderpriority AS priority, COUNT(DISTINCT o_orderkey) AS order_cnt
FROM orders
JOIN lineitem ON o_orderkey = l_orderkey
WHERE strftime('%Y', o_orderdate) = '1995'
  AND l_receiptdate > l_commitdate
GROUP BY o_orderpriority;
