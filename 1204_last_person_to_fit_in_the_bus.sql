-- Problem: 1204. Last Person to Fit in the Bus
-- Source: LeetCode SQL 50
-- Difficulty: Medium

SELECT person_name
FROM (
    SELECT 
        person_name,
        turn,
        SUM(weight) OVER (ORDER BY turn) AS total_weight
    FROM Queue
) t
WHERE total_weight <= 1000
ORDER BY turn DESC
LIMIT 1;

-- Explanation:
-- We calculate running total of weight using SUM() OVER (ORDER BY turn)
-- This simulates people boarding the bus in order
-- We keep only rows where total_weight <= 1000 (bus capacity)
-- ORDER BY turn DESC gives the last person who can fit
-- LIMIT 1 returns that person