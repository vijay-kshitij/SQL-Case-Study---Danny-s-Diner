--What was the difference between the longest and shortest delivery times for all orders?

SELECT
MAX(CAST((CASE
   WHEN duration = 'null' THEN NULL
   WHEN duration LIKE '%mins' THEN TRIM(duration, 'mins')
   WHEN duration LIKE '%minute' THEN TRIM(duration, 'minute')
   WHEN duration LIKE '%minutes' THEN TRIM(duration, 'minutes')
   ELSE duration END)AS FLOAT)) - 

MIN(CAST((CASE
   WHEN duration = 'null' THEN NULL
   WHEN duration LIKE '%mins' THEN TRIM(duration, 'mins')
   WHEN duration LIKE '%minute' THEN TRIM(duration, 'minute')
   WHEN duration LIKE '%minutes' THEN TRIM(duration, 'minutes')
   ELSE duration END)AS FLOAT)) AS duration_diff

FROM pizza_runner.runner_orders