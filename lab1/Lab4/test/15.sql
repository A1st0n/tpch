.headers on
SELECT r_name, s_name, s_acctbal
FROM supplier
JOIN nation ON s_nationkey = n_nationkey
JOIN region ON n_regionkey = r_regionkey
WHERE s_acctbal = (
  SELECT MAX(s2.s_acctbal)
  FROM supplier s2
  JOIN nation n2 ON s2.s_nationkey = n2.n_nationkey
  WHERE n2.n_regionkey = r_regionkey
);
