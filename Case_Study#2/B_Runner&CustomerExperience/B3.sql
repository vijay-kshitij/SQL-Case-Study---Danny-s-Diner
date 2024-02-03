--Is there any relationship between the number of pizzas and how long the order takes to prepare?         

SELECT customer_orders.order_id, COUNT(*) AS pizza_count,
AVG((EXTRACT(epoch FROM CAST(pickup_time AS TIMESTAMP)) - EXTRACT(epoch FROM order_time))/60) AS avg_minutes

FROM pizza_runner.customer_orders
JOIN pizza_runner.runner_orders
ON customer_orders.order_id = runner_orders.order_id
WHERE cancellation NOT IN ('Restaurant Cancellation',
                           'Customer Cancellation')
                   OR cancellation IS NULL
GROUP BY customer_orders.order_id
ORDER BY pizza_count DESC, avg_minutes DESC;
