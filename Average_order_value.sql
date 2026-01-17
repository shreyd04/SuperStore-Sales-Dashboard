SELECT
year,
category,
COUNT(DISTINCT order_id) AS total_orders,
SUM(sales) AS total_revenue,
SUM(discount) AS total_discount,
CASE
    WHEN COUNT(DISTINCT order_id) = 0 THEN 0
    ELSE SUM(sales) / COUNT(DISTINCT order_id)
END AS average_order_value
FROM SS_sales
GROUP BY year, category
ORDER BY year ASC;
