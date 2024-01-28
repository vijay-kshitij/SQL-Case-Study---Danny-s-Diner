-- 3. What was the first item from the menu purchased by each customer?

WITH temp_table AS (SELECT
  customer_id,
  product_name,
  RANK() OVER (
  PARTITION BY customer_id
  ORDER BY order_date) AS row_num
FROM dannys_diner.sales
JOIN dannys_diner.menu
ON sales.product_id = menu.product_id
)

SELECT DISTINCT customer_id, product_name
FROM temp_table
WHERE row_num = 1

