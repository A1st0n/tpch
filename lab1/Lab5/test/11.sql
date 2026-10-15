.headers on
SELECT SUM(ps_supplycost) AS total_supply_cost
FROM lineitem
JOIN partsupp ON l_partkey = ps_partkey AND l_suppkey = ps_suppkey
JOIN part ON l_partkey = p_partkey
WHERE p_retailprice < 1500
  AND strftime('%Y', l_shipdate) = '1996'
  AND l_suppkey NOT IN (SELECT l_suppkey FROM lineitem
                        WHERE l_extendedprice < 1800 AND strftime('%Y', l_shipdate) = '1998');
