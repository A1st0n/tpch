.headers on
SELECT DISTINCT p_name 

AS part

FROM partsupp

JOIN part 

ON ps_partkey = p_partkey
JOIN supplier 
ON ps_suppkey = s_suppkey
JOIN nation 
ON s_nationkey = n_nationkey
WHERE n_name = 'ARGENTINA'
  AND ps_supplycost*ps_availqty IN (SELECT ps_supplycost*ps_availqty FROM partsupp
                                    ORDER BY ps_supplycost*ps_availqty DESC
                                    LIMIT (SELECT COUNT(*)/10 FROM partsupp));
