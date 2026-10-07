.headers on
SELECT COUNT(*) AS item_cnt
FROM lineitem
JOIN supplier ON l_suppkey = s_suppkey
JOIN nation sn ON s_nationkey = sn.n_nationkey
JOIN region ON sn.n_regionkey = r_regionkey
JOIN orders ON l_orderkey = o_orderkey
JOIN customer ON o_custkey = c_custkey
JOIN nation cn ON c_nationkey = cn.n_nationkey
WHERE r_name = 'EUROPE'
  AND cn.n_name = 'INDIA';
