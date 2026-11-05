.headers on
SELECT COUNT(DISTINCT ps_suppkey) 
AS supplier_cnt
FROM partsupp
JOIN part ON p_partkey = ps_partkey
WHERE p_retailprice = (SELECT MIN(p_retailprice) FROM part);
