-- 4. What is the most purchased item on the menu and how many times was it purchased by all customers?

WITH temp_table AS (SELECT product_name, COUNT(customer_id) AS count_product
FROM dannys_diner.sales
JOIN dannys_diner.menu
ON sales.product_id = menu.product_id
GROUP BY product_name
)

SELECT product_name
FROM temp_table
ORDER BY count_product DESC
LIMIT 1;
