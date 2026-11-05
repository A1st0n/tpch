.headers on
SELECT COUNT(DISTINCT o_custkey) AS customer_cnt
FROM orders
WHERE o_orderkey IN (SELECT l_orderkey FROM lineitem)
  AND o_orderkey NOT IN (
    SELECT l_orderkey
    FROM lineitem
    JOIN supplier ON s_suppkey = l_suppkey
    JOIN nation ON n_nationkey = s_nationkey
    JOIN region ON r_regionkey = n_regionkey
    WHERE r_name <> 'AFRICA');
