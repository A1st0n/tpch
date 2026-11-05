.headers on
SELECT COUNT(*) AS supplier_cnt
FROM (
    SELECT l_suppkey
    FROM lineitem
    JOIN orders ON o_orderkey = l_orderkey
    JOIN customer ON c_custkey = o_custkey
    JOIN nation ON n_nationkey = c_nationkey
    WHERE n_name IN ('EGYPT', 'JORDAN')
    GROUP BY l_suppkey
    HAVING COUNT(DISTINCT o_orderkey) < 50);
