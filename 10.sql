-- 10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - 
-- how many points do customer A and B have at the end of January?

WITH new_price_table AS (SELECT sales.customer_id, 
product_name, join_date, order_date,
price,
CASE 
	WHEN order_date >= join_date THEN 20*price
	ELSE 10*price
END AS new_price
FROM dannys_diner.sales
JOIN dannys_diner.menu
ON sales.product_id = menu.product_id
JOIN dannys_diner.members
ON sales.customer_id = members.customer_id
)
SELECT customer_id,
SUM(new_price) AS points
FROM new_price_table
WHERE order_date < '2021-02-01'
GROUP BY customer_id
ORDER BY customer_id;