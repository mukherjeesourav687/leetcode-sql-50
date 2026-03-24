-- Problem: 1164. Product Price at a Given Date
-- Source: LeetCode SQL 50
-- Difficulty: Medium

SELECT product_id, new_price AS price
FROM Products
WHERE (product_id, change_date) IN (
    SELECT 
        product_id, 
        MAX(change_date)
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
)

UNION

SELECT DISTINCT product_id, 10 AS price
FROM Products
WHERE product_id NOT IN (
    SELECT product_id
    FROM Products
    WHERE change_date <= '2019-08-16'
);

-- Explanation:
-- First query finds the latest price before or on the given date
-- We use MAX(change_date) to get the most recent price change
-- Second query handles products with no price change before that date
-- These products keep the default price = 10
-- UNION combines both results