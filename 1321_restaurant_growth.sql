-- Problem: 1321. Restaurant Growth
-- Source: LeetCode SQL 50
-- Difficulty: Medium

SELECT 
    visited_on,
    SUM(amount) OVER (
        ORDER BY visited_on
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ) AS amount,
    ROUND(
        AVG(amount) OVER (
            ORDER BY visited_on
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ), 2
    ) AS average_amount
FROM (
    SELECT 
        visited_on, 
        SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
) t
ORDER BY visited_on
LIMIT 18446744073709551615 OFFSET 6;


-- Explanation:
-- First, we aggregate total amount per day
-- Then we apply a window function over a 7-day range (current day + previous 6 days)
-- SUM gives total revenue for 7 days
-- AVG gives average daily revenue for that 7-day window
-- OFFSET 6 ensures we start from the 7th day (when full window is available)