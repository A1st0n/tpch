.headers on
SELECT p_name 
AS part
FROM lineitem


JOIN part

 ON l_partkey = p_partkey
WHERE l_shipdate > '1994-10-06'
  AND l_extendedprice*(1-l_discount) = (SELECT MAX(l_extendedprice*(1-l_discount))
                                        FROM lineitem WHERE l_shipdate > '1994-10-06');
