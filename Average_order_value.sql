CREATE TABLE Average_Order_Value AS
SELECT
year,
category,
COUNT(DISTINCT order_id) AS total_orders,
SUM(sales) AS total_revenue,
SUM(discount) AS total_discount,
SUM(profit) AS total_profit,
SUM(sales) - SUM(profit) AS COGS,
CASE
    WHEN COUNT(DISTINCT order_id) = 0 THEN 0
    ELSE SUM(sales) / COUNT(DISTINCT order_id)
END AS average_order_value
FROM SS_sales
GROUP BY year, category
ORDER BY year ASC;

--2014 AOV

SELECT
year,
SUM(average_order_value) AS overall_average_order_value
FROM Average_Order_Value
WHERE year = '2014'
GROUP BY year;


