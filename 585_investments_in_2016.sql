-- Problem: 585. Investments in 2016
-- Source: LeetCode SQL 50
-- Difficulty: Medium

SELECT 
    ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance
WHERE tiv_2015 IN (
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
)
AND (lat, lon) IN (
    SELECT lat, lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
);


-- Explanation:
-- First, we select policies where tiv_2015 appears more than once
-- Then, we ensure the location (lat, lon) is unique
-- Finally, we sum tiv_2016 for those filtered records