-- 2. How many days has each customer visited the restaurant?

SELECT
  sales.customer_id,
  COUNT(DISTINCT(order_date))
FROM dannys_diner.sales
GROUP BY sales.customer_id;
