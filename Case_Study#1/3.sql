-- 3. What was the first item from the menu purchased by each customer?

WITH temp_table AS (SELECT
  customer_id,
  product_name,
  RANK() OVER (
  PARTITION BY customer_id
  ORDER BY order_date) AS row_num
FROM dannys_diner.sales
JOIN dannys_diner.menu
ON sales.product_id = menu.product_id
)

SELECT DISTINCT customer_id, product_name
FROM temp_table
WHERE row_num = 1


-- Description of why can't we use just WHERE without using CTE.

-- SELECT user_id, spend, transaction_date,
-- ROW_NUMBER() OVER ( 
--    PARTITION BY user_id
--    ORDER BY transaction_date) AS row_num
-- FROM transactions
-- WHERE row_num = 3;

-- ERROR: column "row_num" does not exist.
-- The error is because the WHERE clause is trying to filter on the row_num alias, which is created in the SELECT statement 
-- as part of the window function. In SQL, the WHERE clause is processed before the SELECT clause, so it doesn't "see" the aliases 
-- defined in SELECT.
