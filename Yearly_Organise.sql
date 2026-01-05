CREATE TABLE Revenue_By_Year AS
SELECT  
EXTRACT(YEAR FROM order_date) AS sales_year,
SUM(sales) AS total_sales
FROM SS_sales
GROUP BY 
sales_year
ORDER BY sales_year ASC;

