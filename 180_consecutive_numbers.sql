-- Problem: 180. Consecutive Numbers
-- Source: LeetCode SQL 50
-- Difficulty: Medium

SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT 
        num,
        id - ROW_NUMBER() OVER (PARTITION BY num ORDER BY id) AS grp
    FROM Logs
) t
GROUP BY num, grp
HAVING COUNT(*) >= 3;

-- Explanation:
-- ROW_NUMBER() assigns a sequence number for each num
-- Subtracting ROW_NUMBER() from id creates groups for consecutive numbers
-- Same consecutive numbers will have the same grp value
-- We group by num and grp to identify consecutive sequences
-- HAVING COUNT(*) >= 3 ensures at least 3 consecutive occurrences
-- DISTINCT returns unique numbers