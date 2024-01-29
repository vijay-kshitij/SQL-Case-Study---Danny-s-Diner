-- 9.  If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

WITH new_price_table AS (SELECT customer_id, 
product_name,
CASE
	WHEN product_name = 'sushi' THEN 200
    WHEN product_name = 'curry' THEN 150
	ELSE 120
    ELSE price
END AS new_price,
price 
FROM dannys_diner.sales
JOIN dannys_diner.menu
ON sales.product_id = menu.product_id
)
SELECT customer_id,
SUM(new_price) AS points
FROM new_price_table
GROUP BY customer_id
ORDER BY customer_id;