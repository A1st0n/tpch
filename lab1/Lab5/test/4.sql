.headers on
SELECT COUNT(DISTINCT ps_suppkey) 
AS supp_cnt
FROM partsupp
JOIN part 
ON ps_partkey = p_partkey
WHERE p_type LIKE '%BRUSHED%'
  AND p_size IN (10, 20, 30, 40);
