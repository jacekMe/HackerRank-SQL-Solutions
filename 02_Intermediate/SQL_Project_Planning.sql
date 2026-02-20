/*
Problem: SQL Project Planning
Link: https://www.hackerrank.com/challenges/sql-projects/problem
Difficulty: Intermediate
Score: 10/10

Description:
Write a query to output the start and end dates of projects listed by the number of days 
it took to complete the project in ascending order. If there is more than one project that 
have the same number of completion days, then order by the start date of the project.

Environment: T-SQL
*/

SET NOCOUNT ON;

/*
    --- SOLUTION 1: The "Anti-Join" Approach ---
*/
SELECT StartDates.Start_Date, MIN(EndDates.End_Date) AS End_Date
FROM (  SELECT Start_Date
        FROM Projects
        WHERE Start_Date NOT IN (SELECT End_Date FROM Projects)
     ) AS StartDates
    CROSS JOIN
     (  SELECT End_Date
        FROM Projects
        WHERE End_Date NOT IN (SELECT Start_Date FROM Projects)
     ) AS EndDates
WHERE StartDates.Start_Date < EndDates.End_Date
GROUP BY StartDates.Start_Date
ORDER BY DATEDIFF(day, StartDates.Start_Date, MIN(EndDates.End_Date)) ASC,
         StartDates.Start_Date ASC;

/*
    --- SOLUTION 2: The "Old School" Approach ---
Using ROW_NUMBER() to create a grouping key.

WITH ProjectGroups AS (
    SELECT
        Task_ID,
        Start_Date,
        End_Date,
        DATEADD(day, -ROW_NUMBER() OVER(ORDER BY Start_Date), Start_Date) AS ProjectGroupID
    FROM Projects
)
SELECT 
    MIN(Start_Date) AS ProjectStart,
    MAX(End_Date)
FROM ProjectGroups
GROUP BY ProjectGroupID
ORDER BY
    DATEDIFF(day, MIN(Start_Date), MAX(End_Date)) ASC,
    MIN(Start_Date) ASC;
*/

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. The "Gaps and Islands" Pattern:
    This is a famous SQL pattern. The goal is to group contiguous sequences of data (Islands)
    and identify breaks between them (Gaps).

2. Date Math (T-SQL vs ANSI)
    In T-SQL, finding the difference between dates requires the 'DATEDIFF()' function. On other
    ANSI-compliant databases (like PostgreSQL, Oracle), you can often simply subtract dates:
    'ORDER BY (MIN(End_Date)-Start_Date) ASC'. 
*/