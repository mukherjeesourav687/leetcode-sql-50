-- Problem: 626. Exchange Seats
-- Source: LeetCode SQL 50
-- Difficulty: Medium

SELECT 
    CASE
        WHEN id % 2 = 1 AND id != (SELECT MAX(id) FROM Seat) THEN id + 1
        WHEN id % 2 = 0 THEN id - 1
        ELSE id
    END AS id,
    student
FROM Seat
ORDER BY id;

-- Explanation:
-- We swap every pair of consecutive ids
-- If id is odd → swap with next (id + 1)
-- If id is even → swap with previous (id - 1)
-- If last id is odd (no pair), it remains unchanged
-- CASE handles all conditions
-- ORDER BY ensures correct final order