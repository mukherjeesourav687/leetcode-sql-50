-- Problem: 1070. Product Sales Analysis III
-- Source: LeetCode SQL 50
-- Difficulty: Medium

SELECT 
    product_id,
    year AS first_year,
    quantity,
    price
FROM Sales
WHERE (product_id, year) IN (
    SELECT 
        product_id,
        MIN(year)
    FROM Sales
    GROUP BY product_id
);

-- Explanation:
-- We find the first year each product was sold using MIN(year)
-- The subquery returns (product_id, first_year)
-- We filter rows where (product_id, year) matches the first year
-- This gives all sales records from the first year of each product