-- What was the maximum number of pizzas delivered in a single order?

SELECT order_id, COUNT(pizza_id) AS pizza_count
FROM pizza_runner.customer_orders
GROUP BY order_id
ORDER BY pizza_count DESC
LIMIT 1;
