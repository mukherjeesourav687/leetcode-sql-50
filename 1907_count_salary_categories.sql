-- Problem: 1907. Count Salary Categories
-- Source: LeetCode SQL 50
-- Difficulty: Medium

SELECT 'Low Salary' AS category,
SUM(CASE WHEN income < 20000 THEN 1 ELSE 0 END) AS accounts_count
FROM Accounts

UNION ALL

SELECT 'Average Salary',
SUM(CASE WHEN income BETWEEN 20000 AND 50000 THEN 1 ELSE 0 END)
FROM Accounts

UNION ALL

SELECT 'High Salary',
SUM(CASE WHEN income > 50000 THEN 1 ELSE 0 END)
FROM Accounts;

-- Explanation:
-- We categorize salaries into three groups using CASE statements
-- Low: income < 20000
-- Average: income between 20000 and 50000
-- High: income > 50000
-- SUM(...) counts number of accounts in each category
-- UNION ALL combines all categories into one result