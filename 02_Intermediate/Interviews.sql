/*
Problem: Interviews
Link: https://www.hackerrank.com/challenges/interviews/problem
Difficulty: Intermediate
Score: 10/10

Description:
Samantha interviews many candidates from different colleges using coding challenges and contests. 
Write a query to print the contest_id, hacker_id, name, and the sums of total_submissions, 
total_accepted_submissions, total_views, and total_unique_views for each contest sorted by contest_id.
Exclude the contest from the result if all four sums are 0.

Note: A specific contest can be used to screen candidates at more than one college, but each college only holds 1 screening contest.

Environment: T-SQL
*/

SET NOCOUNT ON;

WITH ViewSums AS (
    SELECT challenge_id,
            SUM(total_views) AS TotalViews,
            SUM(total_unique_views) AS TotalUqViews
    FROM View_Stats
    GROUP BY challenge_id
),
SubmissionSums AS (
    SELECT challenge_id,
            SUM(total_submissions) AS TotalSubmissions,
            SUM(total_accepted_submissions) AS TotalAcceptedSubmissions
    FROM Submission_Stats
    GROUP BY challenge_id
)

SELECT C.contest_id, C.hacker_id, C.name,
        COALESCE(SUM(SS.TotalSubmissions), 0) AS TotalSubmissions,
        COALESCE(SUM(SS.TotalAcceptedSubmissions), 0) AS TotalAcceptedSubmissions,
        COALESCE(SUM(VS.TotalViews), 0) AS TotalViews,
        COALESCE(SUM(VS.TotalUqViews), 0) AS TotalUqViews
FROM Contests C
    JOIN Colleges Co ON C.contest_id = Co.contest_id
    JOIN Challenges Ch ON Co.college_id = Ch.college_id
    LEFT JOIN ViewSums VS ON Ch.challenge_id = VS.challenge_id
    LEFT JOIN SubmissionSums SS ON Ch.challenge_id = SS.challenge_id
GROUP BY C.contest_id, C.hacker_id, C.name
HAVING (COALESCE(SUM(SS.TotalSubmissions), 0) +
        COALESCE(SUM(SS.TotalAcceptedSubmissions), 0) +
        COALESCE(SUM(VS.TotalViews), 0) +
        COALESCE(SUM(VS.TotalUqViews), 0)) > 0
ORDER BY C.contest_id;

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. The "Cartesian Explosion" Trap:
    When a central table (Challenges) has two independent 1-to-many relationships 
    (View_Stats & Submission_Stats), joining them all simultaneously creates a 
    cross-product of the child rows. If Challenge A has 3 views and 2 submissions,
    a direct join creates 6 rows, massively inflating the 'SUM()'.

2. Pre-Aggregation Strategy:
    To solve the fan-out trap, we use CTEs to pre-aggregation the child tables up 
    to to 'challegne_id' level BEFORE joining them to the main hierarchy. This 
    ensures a 1-to-1 or 1-to-0 relationship during the join.

3. COALESCE & LEFT JOIN:
    'LEFT JOIN' is required because a challenge might lack views or submissions.
    'COALESCE(..., 0)' is critical to convert the resulting NULLs into 0s, allowing
    the mathematical addition in the 'HAVING' clause to function correctly (since
    'NULL + number = NULL').
*/