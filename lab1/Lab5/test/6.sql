.headers on
WITH t AS (
  SELECT s_name, p_size, ps_supplycost
  FROM partsupp
  JOIN part ON ps_partkey = p_partkey
  JOIN supplier ON ps_suppkey = s_suppkey
  JOIN nation ON s_nationkey = n_nationkey
  JOIN region ON n_regionkey = r_regionkey
  WHERE p_type LIKE '%NICKEL%' AND r_name = 'AFRICA'
)
SELECT DISTINCT t.s_name AS supplier, t.p_size AS part_size, t.ps_supplycost AS max_cost
FROM t
JOIN (SELECT p_size, MAX(ps_supplycost) 

AS mx FROM t GROUP BY p_size) m
  ON t.p_size = m.p_size AND t.ps_supplycost = m.mx
ORDER BY t.p_size;
