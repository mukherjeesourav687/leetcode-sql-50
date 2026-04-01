-- Problem: 176. Second Highest Salary
-- Source: LeetCode SQL 50
-- Difficulty: Medium

SELECT (
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1
) AS SecondHighestSalary;

-- Explanation:
-- DISTINCT ensures we consider unique salary values
-- ORDER BY salary DESC sorts salaries from highest to lowest
-- LIMIT 1 OFFSET 1 skips the highest salary and selects the second highest
-- If there is no second highest salary, the query automatically returns NULL
-- This approach is simple, efficient, and commonly used in interviews