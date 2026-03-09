/*
Problem: 15 Days of Learning SQL
Link: https://www.hackerrank.com/challenges/15-days-of-learning-sql/problem
Difficulty: Advanced
Score: 10/10

Description:
Julia conducted a 15 days of learning SQL contest. The start date of the contest was March 01, 
2016 and the end date was March 15, 2016.

Write a query to print total number of unique hackers who made at least 1 submission each day 
(starting on the first day of the contest), and find the hacker_id and name of the hacker who 
made maximum number of submissions each day. If more than one such hacker has a maximum number 
of submissions, print the lowest hacker_id. The query should print this information for each 
day of the contest, sorted by the date.

Environment: T-SQL
*/

SET NOCOUNT ON;

-- Step 1: Calculate the 'Daily Top Hacker'
WITH DailyHackerSubmissions AS (
    SELECT submission_date, hacker_id, COUNT(submission_date) AS daily_subs
    FROM Submissions
    GROUP BY submission_date, hacker_id
),
RankedDailyHackers AS (
    SELECT submission_date, hacker_id, 
        ROW_NUMBER() OVER (PARTITION BY submission_date ORDER BY daily_subs  DESC, hacker_id ASC) AS rn
    FROM DailyHackerSubmissions
),
TopHackerPerDay AS (
    SELECT submission_date, hacker_id
    FROM RankedDailyHackers
    WHERE rn = 1
),
-- Step 2: Calculate the 'Continuous Streak Hackers'
ContinuousHackers AS (
    SELECT S1.submission_date, COUNT(DISTINCT S1.hacker_id) AS continuous_hackers_count
    FROM Submissions S1
    WHERE (
        SELECT COUNT(DISTINCT S2.submission_date)
        FROM Submissions S2
        WHERE S2.hacker_id = S1.hacker_id
            AND S2.submission_date <= S1.submission_date
    ) = DATEDIFF(DAY, '2016-03-01', S1.submission_date) + 1
    GROUP BY S1.submission_date
)
-- Step 3: Combine both isolated logic sets into the final result
SELECT C.submission_date, C.continuous_hackers_count, T.hacker_id, H.name
FROM ContinuousHackers C
    JOIN TopHackerPerDay T ON C.submission_date = T.submission_date
    JOIN Hackers H ON T.hacker_id = H.hacker_id
ORDER BY C.submission_date ASC;


/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Modular Query Design (Separation of Logic):
    This problem perfectly illustrates why monolithic queries fail. The requirement asks for two
    completely different granularities: an aggregated continuous streak, and a localized daily maximum.
    By isolating these into separate CTEs ('TopHackerPerDay' & 'ContinuousHackers') ang joining them 
    only at the end, the code avoids Cartesian explosions and remains highly readable.

2. Analyzing "Streaks" using Correlated Subqueries:
    Calculating continuous activity (login streaks, submission streaks). The logic used here: 
    "If the distinct count of active days equals the calendar days elapsed, the streak is unbroken"
    is a highly efficient, setbased way to solve sequence problems without resorting to iterative
    loops or cursors.
*/