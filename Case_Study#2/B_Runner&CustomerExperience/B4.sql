--What was the average distance travelled for each customer?

SELECT customer_id,
AVG(CAST((CASE
	WHEN distance = 'null' THEN NULL
    WHEN distance LIKE '%km%' THEN TRIM(distance, '%km%')
    ELSE distance 
END) AS FLOAT)) AS avg_distance
FROM pizza_runner.customer_orders
JOIN pizza_runner.runner_orders
ON customer_orders.order_id = runner_orders.order_id

GROUP BY customer_id
ORDER BY customer_id