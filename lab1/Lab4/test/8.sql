.headers on
SELECT COUNT(DISTINCT o_clerk) AS clerk_cnt
FROM orders
JOIN lineitem ON l_orderkey = o_orderkey
JOIN supplier ON l_suppkey = s_suppkey
JOIN nation ON s_nationkey = n_nationkey
WHERE n_name = 'IRAQ';
