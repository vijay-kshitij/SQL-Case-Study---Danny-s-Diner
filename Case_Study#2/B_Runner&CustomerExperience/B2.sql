--What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pickup the order?

SELECT runner_id,
AVG((EXTRACT(epoch FROM CAST(pickup_time AS TIMESTAMP)) - EXTRACT(epoch FROM order_time))/60) AS avg_minutes

FROM pizza_runner.customer_orders
JOIN pizza_runner.runner_orders
ON customer_orders.order_id = runner_orders.order_id
WHERE cancellation NOT IN ('Restaurant Cancellation',
                           'Customer Cancellation')
                   OR cancellation IS NULL
GROUP BY runner_id
ORDER BY runner_id;