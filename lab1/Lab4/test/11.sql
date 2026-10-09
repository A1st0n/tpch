.headers on
SELECT COUNT(DISTINCT o_orderkey) AS order_cnt
From orders
JOIN customer ON o_custkey = c_custkey
Join lineitem on l_orderkey = o_orderkey
JOIN supplier ON l_suppkey = s_suppkey
WHERE c_acctbal < 0
  AND s_acctbal > 0;
