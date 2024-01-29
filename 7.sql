-- 7. Which item was purchased just before the customer became a member?

WITH temp_table AS (SELECT s.customer_id,
s.order_date,
f.product_name,
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
SELECT customer_id,product_name
FROM temp_table
WHERE rank_order=1;