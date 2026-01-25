SELECT
category,
country,
profit,
sales
FROM SS_sales
WHERE category = 'Furniture' AND year = '2014'
ORDER BY profit DESC;

SELECT
product_name,
country,
profit,
sales,
discount,
sales - profit AS COGS
FROM SS_sales
ORDER BY profit DESC
LIMIT 20;

SELECT 
year,
COUNT(order_id) AS total_orders,
customer_name
FROM SS_sales
GROUP BY customer_name, order_id, year
ORDER BY total_orders DESC
LIMIT 20;

SELECT
COUNT(customer_name) AS total_customers,
product_name,
sales
FROM SS_sales
GROUP BY customer_name, product_name, sales
ORDER BY sales DESC;
