.headers on
SELECT o_orderpriority AS priority, 

COUNT(*) AS item_cnt
FROM lineitem

JOIN orders 
ON l_orderkey = o_orderkey
WHERE strftime('%Y', o_orderdate) = '1998'
  AND l_receiptdate < l_commitdate
GROUP BY o_orderpriority;
