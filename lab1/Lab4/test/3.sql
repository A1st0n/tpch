.headers on
Select c_name, SUM(o_totalprice) AS total_price
FROM orders
join customer ON o_custkey = c_custkey
JOIN nation ON c_nationkey = n_nationkey
where n_name = 'GERMANY'
  AND strftime('%Y', o_orderdate) = '1992'
GROUP BY c_name;
