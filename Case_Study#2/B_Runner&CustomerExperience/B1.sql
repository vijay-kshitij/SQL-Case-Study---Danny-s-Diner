--How many runners signed up for each 1 week period? (i.e. week starts 2021-01-01)

SELECT 
    EXTRACT('week' FROM registration_date + INTERVAL '3 day') AS week,
    COUNT(runner_id) AS runner_count 
FROM 
    pizza_runner.runners
GROUP BY 
    week
ORDER BY 
    week;