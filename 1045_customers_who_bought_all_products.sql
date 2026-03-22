-- Problem: 1045. Customers Who Bought All Products
-- Source: LeetCode SQL 50
-- Difficulty: Medium

SELECT 
    customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (
    SELECT COUNT(*) FROM Product
);

-- Explanation:
-- We group data by customer_id
-- COUNT(DISTINCT product_key) gives number of unique products bought by each customer
-- The subquery counts total number of products available
-- If both counts are equal, it means the customer bought all products