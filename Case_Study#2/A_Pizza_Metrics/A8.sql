--How many pizzas were delivered that had both exclusions and extras?

WITH temp_table AS (SELECT pizza_id,
SUM(CASE 
	WHEN (exclusions NOT IN ('','null')
    AND extras NOT IN ('','null'))
    THEN 1 ELSE 0 END) AS extras_exclusions

FROM pizza_runner.customer_orders
JOIN pizza_runner.runner_orders
ON customer_orders.order_id = runner_orders.order_id 
WHERE (cancellation NOT IN ('Restaurant Cancellation',
                       'Customer Cancellation')
                       OR cancellation IS NULL)
GROUP BY pizza_id
ORDER BY pizza_id
)

SELECT SUM(extras_exclusions) AS total_with_both
FROM temp_table;