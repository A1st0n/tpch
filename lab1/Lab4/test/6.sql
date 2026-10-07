.headers on
SELECT s_name, o_orderpriority, COUNT(DISTINCT l_partkey) AS part_cnt
FROM lineitem
JOIN orders ON l_orderkey = o_orderkey
JOIN supplier ON l_suppkey = s_suppkey
JOIN nation ON s_nationkey = n_nationkey
WHERE n_name = 'ARGENTINA'
GROUP BY s_name, o_orderpriority;
