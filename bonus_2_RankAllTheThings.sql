-- BONUS #2 - Rank All The Things

WITH temp_table_1 AS (SELECT 
ROW_NUMBER() OVER(ORDER BY s.customer_id) AS unique_id,
s.customer_id, s.order_date,
m.product_name, m.price,
CASE
	WHEN join_date <= order_date THEN 'Y'
    ELSE 'N'
END AS member
FROM dannys_diner.sales s
LEFT JOIN dannys_diner.members c
ON s.customer_id = c.customer_id
                      
FULL JOIN dannys_diner.menu m
ON s.product_id = m.product_id

ORDER BY customer_id, order_date
),

temp_table_2 AS (SELECT unique_id,
RANK() OVER(PARTITION BY customer_id
                     ORDER BY order_date) AS ranking
FROM temp_table_1
WHERE member = 'Y'
)

SELECT temp_table_1.customer_id, temp_table_1.order_date,
temp_table_1.product_name, temp_table_1.price, 
temp_table_1.member, temp_table_2.ranking
FROM temp_table_1
LEFT JOIN temp_table_2
ON temp_table_1.unique_id = temp_table_2.unique_id