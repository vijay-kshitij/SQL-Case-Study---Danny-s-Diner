-- BONUS #1 - JOIN ALL THE THINGS

SELECT s.customer_id, s.order_date,
m.product_name, m.price,
CASE
	WHEN join_date <= order_date THEN 'Y'
    ELSE 'N'
END AS member
FROM dannys_diner.sales s
JOIN dannys_diner.menu m
ON s.product_id = m.product_id

LEFT JOIN dannys_diner.members c
ON s.customer_id = c.customer_id

ORDER BY customer_id, order_date;
