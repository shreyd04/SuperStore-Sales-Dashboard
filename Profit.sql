CREATE TABLE Category_Profit AS
SELECT 
    category,
    SUM(sales) AS total_sales,
    SUM(
        CASE 
            WHEN category = 'Furniture' THEN sales * 0.21
            WHEN category = 'Office Supplies' THEN sales * 0.60
            ELSE sales * 0.19 
        END
    ) AS calculated_profit,
    EXTRACT(YEAR FROM order_date) AS sales_year
FROM SS_sales
GROUP BY category , sales_year
ORDER BY sales_year ASC;
DROP TABLE IF EXISTS Category_Profit;
 SELECT * FROM Category_Profit;

SELECT
   category,
   product_name,
   EXTRACT(YEAR FROM order_date) AS sales_year,
   CASE
   WHEN category = 'Furniture' THEN 0.21 * SS_sales.sales
   WHEN category = 'Office Supplies' THEN 0.60 * SS_sales.sales
   ELSE 0.19 * SS_sales.sales
   END AS profit
   FROM SS_sales
   ORDER BY sales_year ASC;
   
SELECT
category,
   product_name,
   EXTRACT(YEAR FROM order_date) AS sales_year
   FROM SS_sales
   WHERE product_name = 'Hon Racetrack Conference Tables'