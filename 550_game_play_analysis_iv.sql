-- Problem: 550. Game Play Analysis IV
-- Source: LeetCode SQL 50
-- Difficulty: Medium

SELECT 
    ROUND(
        COUNT(DISTINCT a.player_id) / 
        (SELECT COUNT(DISTINCT player_id) FROM Activity),
        2
    ) AS fraction
FROM Activity a
JOIN (
    SELECT 
        player_id,
        MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
) f
ON a.player_id = f.player_id
AND DATEDIFF(a.event_date, f.first_login) = 1;

-- Explanation:
-- First, we find each player's first login date using MIN(event_date)
-- Then we join it back with the Activity table
-- We check players who logged in exactly 1 day after their first login using DATEDIFF = 1
-- COUNT(DISTINCT a.player_id) gives number of returning players
-- Total players are counted using a subquery
-- We divide returning players by total players to get fraction
-- ROUND(..., 2) formats the result to 2 decimal places