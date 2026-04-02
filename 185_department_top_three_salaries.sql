-- Problem: 185. Department Top Three Salaries
-- Source: LeetCode SQL 50
-- Difficulty: Hard

SELECT Department, Employee, Salary
FROM (
    SELECT
        d.name AS Department,
        e.name AS Employee,
        e.salary AS Salary,
        DENSE_RANK() OVER (
            PARTITION BY e.departmentId
            ORDER BY e.salary DESC
        ) AS rnk
    FROM Employee e
    JOIN Department d
        ON e.departmentId = d.id
) t
WHERE rnk <= 3;

-- Explanation:
-- DENSE_RANK() assigns ranks within each department based on salary (highest first)
-- PARTITION BY departmentId ensures ranking is done per department
-- ORDER BY salary DESC ranks highest salaries first
-- We filter rnk <= 3 to get top 3 salaries per department
-- JOIN is used to get department names along with employee details