--What was the average speed for each runner for each delivery and do you notice any trend for these values?

WITH updated_values AS (SELECT order_id, runner_id,
CAST((CASE
	WHEN distance = 'null' THEN NULL
    WHEN distance LIKE '%km%' THEN TRIM(distance, '%km%')
    ELSE distance 
END) AS FLOAT) AS updated_distance,

CAST((CASE
   WHEN duration = 'null' THEN NULL
   WHEN duration LIKE '%mins' THEN TRIM(duration, 'mins')
   WHEN duration LIKE '%minute' THEN TRIM(duration, 'minute')
   WHEN duration LIKE '%minutes' THEN TRIM(duration, 'minutes')
   ELSE duration END)AS FLOAT) AS updated_duration

FROM pizza_runner.runner_orders
)

SELECT order_id, runner_id,
(updated_distance/updated_duration)*60 AS avg_speed
FROM updated_values
WHERE updated_distance/updated_duration IS NOT NULL
;