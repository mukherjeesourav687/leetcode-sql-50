-- Problem: 550. Confirmation Rate
-- Source: LeetCode SQL 50
-- Difficulty: Medium

SELECT s.user_id,
ROUND(IFNULL(SUM(c.action = 'confirmed') / COUNT(c.action), 0), 2) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c
ON s.user_id = c.user_id
GROUP BY s.user_id;

-- Explanation:
-- We join the Signups table with Confirmations using LEFT JOIN
-- s represents all users
-- c represents confirmation actions of users
-- c.action = 'confirmed' returns 1 if confirmed, else 0
-- SUM(...) counts total confirmed actions
-- COUNT(c.action) counts total confirmation attempts
-- We divide to get confirmation rate
-- IFNULL ensures users with no confirmations return 0 instead of NULL
-- ROUND formats the result to 2 decimal places
