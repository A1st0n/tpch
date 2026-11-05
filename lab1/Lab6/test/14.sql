.headers on
WITH trade AS (
    SELECT s_nationkey AS sn, c_nationkey AS cn
    FROM lineitem
    JOIN supplier ON s_suppkey = l_suppkey
    JOIN orders ON o_orderkey = l_orderkey
    JOIN customer ON c_custkey = o_custkey
    WHERE strftime('%Y', l_shipdate) = '1997' AND s_nationkey <> c_nationkey)

SELECT n_name AS country,
       (SELECT COUNT(*) FROM trade WHERE sn = n_nationkey)
     - (SELECT COUNT(*) FROM trade WHERE cn = n_nationkey) AS economic_exchange
FROM nation;
