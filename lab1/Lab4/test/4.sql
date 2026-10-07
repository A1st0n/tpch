.headers on
SELECT s_name, COUNT(*) AS part_cnt
FROM partsupp
JOIN part ON ps_partkey = p_partkey
JOIN supplier ON ps_suppkey = s_suppkey
JOIN nation ON s_nationkey = n_nationkey
WHERE n_name = 'RUSSIA'
  AND p_container LIKE '%CAN%'
GROUP BY s_name;
