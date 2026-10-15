.headers on
SELECT MAX(l_discount) AS max_small_disc
FROM lineitem
JOIN orders ON l_orderkey = o_orderkey
WHERE o_orderdate LIKE '1996-02-%'
  AND l_discount < (SELECT AVG(l_discount) FROM lineitem);
