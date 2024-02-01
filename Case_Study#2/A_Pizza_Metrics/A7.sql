-- For each customer, how many delivered pizzas had at least 1 change and how many had no changes?

SELECT customer_id,
SUM(CASE 
	WHEN (exclusions NOT IN ('','null')
    OR extras NOT IN ('','null'))
    THEN 1 ELSE 0 END) AS changed_pizzas,
    
SUM(CASE 
	WHEN 
      ((exclusions IN ('','null') OR exclusions IS NULL)
      AND (extras IN ('','null', NULL) OR extras IS NULL))
    THEN 1 ELSE 0 END) AS unchanged_pizzas
    

FROM pizza_runner.customer_orders
JOIN pizza_runner.runner_orders
ON customer_orders.order_id = runner_orders.order_id 
WHERE (cancellation NOT IN ('Restaurant Cancellation',
                       'Customer Cancellation')
                       OR cancellation IS NULL)
GROUP BY customer_id
ORDER BY customer_id;