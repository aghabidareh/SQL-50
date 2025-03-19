# Write your MySQL query statement below
SELECT P.product_id,
       CASE
           WHEN SUM(U.units) is null THEN 0
           ELSE ROUND(SUM(U.units * P.price) / SUM(U.units), 2)
       END AS average_price
FROM Prices AS P
LEFT JOIN UnitsSold AS U ON P.product_id = U.product_id and
u.purchase_date BETWEEN start_date AND end_date
GROUP BY P.product_id;
