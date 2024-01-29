-- 5. Which item was the most popular for each customer?

WITH CustomerOrders AS (
    SELECT 
        s.customer_id, 
        m.product_name,
        COUNT(*) AS order_count
    FROM 
        dannys_diner.sales s
    JOIN 
        dannys_diner.menu m ON s.product_id = m.product_id
    GROUP BY 
        s.customer_id, m.product_name
),
RankedOrders AS (
    SELECT 
        customer_id, 
        product_name, 
        order_count,
        RANK() OVER (PARTITION BY customer_id ORDER BY order_count DESC) AS rank
    FROM 
        CustomerOrders
)
SELECT customer_id, 
       product_name 
FROM RankedOrders
WHERE rank = 1;
