-- Problem: 1341. Movie Rating
-- Source: LeetCode SQL 50
-- Difficulty: Medium

(
    SELECT u.name AS results
    FROM Users u
    JOIN MovieRating mr
    ON u.user_id = mr.user_id
    GROUP BY u.user_id, u.name
    ORDER BY COUNT(*) DESC, u.name ASC
    LIMIT 1
)

UNION ALL

(
    SELECT m.title AS results
    FROM Movies m
    JOIN MovieRating mr
    ON m.movie_id = mr.movie_id
    WHERE mr.created_at >= '2020-02-01'
    AND mr.created_at < '2020-03-01'
    GROUP BY m.movie_id, m.title
    ORDER BY AVG(mr.rating) DESC, m.title ASC
    LIMIT 1
);

-- Explanation:
-- First query finds the user who rated the most movies
-- ORDER BY COUNT(*) DESC gives highest activity
-- Second query finds the highest rated movie in Feb 2020
-- AVG(rating) is used for ranking movies
-- UNION ALL combines both results