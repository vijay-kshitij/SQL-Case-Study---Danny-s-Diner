--What is the successful delivery percentage for each runner?

WITH total AS (SELECT runner_id, COUNT(*) AS total_count
FROM pizza_runner.runner_orders
GROUP BY runner_id
),
success AS (SELECT runner_id, COUNT(*) AS successful_count
FROM pizza_runner.runner_orders
WHERE pickup_time != 'null'
GROUP BY runner_id
)

SELECT total.runner_id, total_count, successful_count,
(CAST(successful_count AS FLOAT)/total_count)*100 AS success_rate
FROM total
JOIN success ON total.runner_id = success.runner_id
ORDER BY runner_id;