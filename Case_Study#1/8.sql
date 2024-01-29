-- 8. What is the total items and amount spent for each member before they became a member?

WITH temp_table AS (SELECT s.customer_id,
s.order_date,
f.product_name,
f.price,
DENSE_RANK() OVER(PARTITION BY s.customer_id
            ORDER BY s.order_date DESC) AS rank_order
FROM dannys_diner.sales AS s
FULL JOIN dannys_diner.members AS m
ON s.customer_id = m.customer_id
JOIN dannys_diner.menu AS f
ON s.product_id = f.product_id
WHERE s.order_date < m.join_date
ORDER BY order_date
)
SELECT customer_id, COUNT(product_name),SUM(price)
FROM temp_table
GROUP BY customer_id
ORDER BY customer_id;