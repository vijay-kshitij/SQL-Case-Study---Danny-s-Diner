--What was the total volume of pizzas ordered for each hour of the day?

SELECT 
    DATE(order_time) AS order_date,
    EXTRACT(HOUR FROM order_time) AS order_hour,
    COUNT(*) AS total_pizzas
FROM 
    pizza_runner.customer_orders
GROUP BY 
    order_date, order_hour
ORDER BY 
    order_date, order_hour;