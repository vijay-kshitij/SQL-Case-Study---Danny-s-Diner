-- How many Vegetarian and Meatlovers were ordered by each customer?

SELECT customer_id,
SUM(CASE WHEN pizza_id=1 THEN 1 ELSE 0 END) AS veg_count,
SUM(CASE WHEN pizza_id=2 THEN 1 ELSE 0 END) AS meat_count
FROM pizza_runner.customer_orders
GROUP BY customer_id
ORDER BY customer_id;
