-- How many of each type of pizza was delivered?

SELECT pizza_id, COUNT(customer_orders.order_id) AS pizza_count
FROM pizza_runner.customer_orders
JOIN pizza_runner.runner_orders
ON customer_orders.order_id = runner_orders.order_id
WHERE cancellation IN ('Restaurant Cancellation',
                       'Customer Cancellation')
                       OR cancellation IS NULL
GROUP BY pizza_id
ORDER BY pizza_id;