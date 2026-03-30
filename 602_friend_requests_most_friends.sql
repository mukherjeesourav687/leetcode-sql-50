-- Problem: 602. Friend Requests II: Who Has the Most Friends
-- Source: LeetCode SQL 50
-- Difficulty: Medium

SELECT 
    id,
    COUNT(*) AS num
FROM (
    SELECT requester_id AS id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id FROM RequestAccepted
) all_friends
GROUP BY id
ORDER BY num DESC
LIMIT 1;


-- Explanation:
-- Each friendship is bidirectional, so we count both requester and accepter
-- UNION ALL combines all friend connections
-- Then we group by user id and count total friends
-- Finally, we return the user with the highest count