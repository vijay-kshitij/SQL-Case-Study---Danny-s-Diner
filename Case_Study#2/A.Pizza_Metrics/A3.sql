-- How many successful orders were delivered by each runner?

SELECT COUNT(*) AS successful_orders
FROM pizza_runner.runner_orders
WHERE cancellation NOT IN ('Restaurant Cancellation','Customer Cancellation') OR cancellation IS NULL;