/*
Problem: Challenges
Link: https://www.hackerrank.com/challenges/challenges/problem
Difficulty: Intermediate
Score: 10/10

Description:
Julia asked her students to create some coding challenges. Write a query to print the hacker_id, 
name, and the total number of challenges created by each student. Sort your results by the 
total number of challenges in descending order. If more than one student created the same number 
of challenges, then sort the result by hacker_id. If more than one student created the same number 
of challenges and the count is less than the maximum number of challenges created, then exclude 
those students from the result.

Environment: T-SQL
*/

SET NOCOUNT ON;

WITH TotalChallenges AS (
    SELECT hacker_id, COUNT(*) AS Total
    FROM Challenges
    GROUP BY hacker_id
),
TotalFreq AS (
    SELECT Total, COUNT(*) AS Freq
    FROM TotalChallenges
    GROUP BY Total
)
SELECT h.hacker_id, h.name, tc.Total
FROM Hackers h
    JOIN TotalChallenges tc ON tc.hacker_id = h.hacker_id
    JOIN TotalFreq tf ON tf.Total = tc.Total
WHERE tc.Total = (SELECT MAX(Total) FROM TotalChallenges)
    OR tf.Freq = 1
ORDER BY tc.Total DESC, h.hacker_id;

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. CTEs for Complex Filtering:
    While this could be solved with nested subqueries, using multiple Common Table Expressions (CTEs)
    is more readable and better approach. It breaks down complex business logic into smaller, 
    modular and maintainable steps.
*/
