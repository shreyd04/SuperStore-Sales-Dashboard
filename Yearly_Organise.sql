CREATE TABLE Revenue_By_Year AS
SELECT 
year,
--The "Ship Date Fallback" (The Finance Fix)
--EXTRACT(year FROM COALESCE(order_date , ship_date)) AS sales_year,
SUM(sales) AS total_sales
FROM SS_sales
GROUP BY 
year
ORDER BY year ASC;

DROP TABLE IF EXISTS Revenue_By_Year;

SELECT * FROM Revenue_By_Year;
SELECT
SUM(sales) AS total_revenue,
year
FROM temp_sales
GROUP BY year
ORDER BY year ASC;