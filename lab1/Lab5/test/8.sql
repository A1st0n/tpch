.headers on
SELECT p_mfgr 
AS manufacturer

FROM partsupp

JOIN part 
ON ps_partkey = p_partkey
JOIN supplier 
ON ps_suppkey = s_suppkey
WHERE s_name = 'Supplier#000000084'
  AND ps_availqty = (SELECT MIN(ps_availqty) FROM partsupp
                     JOIN supplier ON ps_suppkey = s_suppkey
                     WHERE s_name = 'Supplier#000000084');
