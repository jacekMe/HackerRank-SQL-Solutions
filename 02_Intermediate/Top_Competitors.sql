/*
Problem: Top Competitors
Link: https://www.hackerrank.com/challenges/full-score/problem
Difficulty: Intermediate
Score: 10/10

Description:
Julia just finished conducting a coding contest, and she needs your help assembling 
the leaderboard! Write a query to print the respective hacker_id and name of hackers 
who achieved full scores for more than one challenge. Order your output in descending 
order by the total number of challenges in which the hacker earned a full score. 
If more than one hacker received full scores in same number of challenges, 
then sort them by ascending hacker_id.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT h.hacker_id, h.name
FROM Hackers h
    JOIN Submissions s ON s.hacker_id = h.hacker_id
    JOIN Challenges ch ON ch.challenge_id = s.challenge_id
    JOIN Difficulty d ON d.difficulty_level = ch.difficulty_level
WHERE s.score = d.score
GROUP BY h.hacker_id, h.name
HAVING COUNT(h.hacker_id) > 1
ORDER BY COUNT(h.hacker_id) DESC, h.hacker_id ASC;

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Schema Navigation & Context:
    A common pitfall in database querying is blindly joining on columns with the same name.
    Here, joining 'Hackers' directly to 'Challenges' via 'hacker_id' finds the 'creators'
    of the challenges, not the 'solvers'. The correct path requires joining through the
    'Submissions' table. 
    Always understand the business logic behind the foreign keys.
*/
