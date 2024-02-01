--What was the volume of orders for each day of the week?

SELECT 
    EXTRACT(DAY FROM order_time) AS order_day,
    COUNT(DISTINCT(order_id)) AS total_pizzas
FROM 
    pizza_runner.customer_orders
GROUP BY 
    order_day
ORDER BY 
    order_day;