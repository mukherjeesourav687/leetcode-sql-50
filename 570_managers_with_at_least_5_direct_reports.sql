-- Problem: 570. Managers with at Least 5 Direct Reports
-- Source: LeetCode SQL 50
-- Difficulty: Medium

SELECT e1.name
FROM Employee e1
JOIN Employee e2 
ON e1.id = e2.managerId
GROUP BY e1.id, e1.name
HAVING COUNT(e2.managerId) >= 5;


-- Explanation:
-- We join the Employee table with itself.
-- e1 represents the manager
-- e2 represents employees reporting to that manager
-- Then we group by manager and count the number of employees
-- HAVING ensures we only return managers with at least 5 direct reports