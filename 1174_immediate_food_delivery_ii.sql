-- Problem: 1174. Immediate Food Delivery II
-- Source: LeetCode SQL 50
-- Difficulty: Medium

SELECT 
    ROUND(
        100 * AVG(order_date = customer_pref_delivery_date),
        2
    ) AS immediate_percentage
FROM Delivery
WHERE (customer_id, order_date) IN (
    SELECT customer_id, MIN(order_date)
    FROM Delivery
    GROUP BY customer_id
);

-- Explanation:
-- We first find each customer's first order using MIN(order_date)
-- The subquery returns (customer_id, first order_date)
-- We filter only first orders using WHERE (customer_id, order_date)
-- order_date = customer_pref_delivery_date returns 1 if immediate, else 0
-- AVG(...) gives the ratio of immediate orders
-- Multiply by 100 to convert into percentage
-- ROUND(..., 2) formats the result to 2 decimal places