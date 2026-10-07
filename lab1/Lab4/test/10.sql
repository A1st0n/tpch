.headers on
SELECT p_type, MIN(l_discount) AS min_disc, MAX(l_discount) AS max_disc
FROM lineitem
JOIN part ON l_partkey = p_partkey
WHERE p_type LIKE '%MEDIUM%' OR p_type LIKE '%TIN%'
GROUP BY p_type;
