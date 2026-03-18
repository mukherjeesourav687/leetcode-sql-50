-- Problem: 1193. Monthly Transactions I
-- Source: LeetCode SQL 50
-- Difficulty: Medium

SELECT 
    DATE_FORMAT(trans_date, '%Y-%m') AS month,
    country,
    COUNT(id) AS trans_count,
    SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY month, country;

-- Explanation:
-- We extract year and month from trans_date using DATE_FORMAT
-- Group data by month and country
-- COUNT(id) gives total number of transactions
-- SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) counts approved transactions
-- SUM(amount) gives total transaction amount
-- SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) gives total approved amount