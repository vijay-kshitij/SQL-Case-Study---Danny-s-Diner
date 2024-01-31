-- How many unique customer orders were made?

SELECT COUNT(DISTINCT(customer_id)) AS unique_customers
FROM pizza_runner.customer_orders;