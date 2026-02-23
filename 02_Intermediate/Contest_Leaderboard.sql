/*
Problem: Contest Leaderboard
Link: https://www.hackerrank.com/challenges/contest-leaderboard/problem
Difficulty: Intermediate
Score: 10/10

Description:
You did such a great job helping Julia with her last coding contest challenge that she wants you to work on this one, too!
The total score of a hacker is the sum of their maximum scores for all of the challenges. Write a query to print the hacker_id, 
name, and total score of the hackers ordered by the descending score. If more than one hacker achieved the same total score, 
then sort the result by ascending hacker_id. Exclude all hackers with a total score of  from your result.

Environment: T-SQL
*/

SET NOCOUNT ON;

WITH MaxScore AS (
    SELECT hacker_id, challenge_id, MAX(score) AS Score
    FROM Submissions
    GROUP BY hacker_id, challenge_id
)
SELECT h.hacker_id, h.name, SUM(ms.Score) TotalScore
FROM Hackers h
    JOIN MaxScore ms ON ms.hacker_id = h.hacker_id
GROUP BY h.hacker_id, h.name
HAVING SUM(ms.Score) > 0
ORDER BY TotalScore DESC, h.hacker_id;

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Pre-Aggregation Strategy:
    The problem requires taking the MAX score per challenge, and then SUMming those maximums.
    This requires a two-step aggregation. Using a CTE to handle the pre-aggregation 
    (MAX(score)) before joining back to the main dataset to perform the final aggregation
    (SUM()) ensures accurate results.
*/