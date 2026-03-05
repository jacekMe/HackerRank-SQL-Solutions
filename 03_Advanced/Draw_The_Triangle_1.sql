/*
Problem: Draw The Triangle 1
Link: https://www.hackerrank.com/challenges/draw-the-triangle-1/problem
Difficulty: Advanced
Score: 10/10

Description:
P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):
* * * * *
* * * * 
* * *
* * 
*
Write a query to print the pattern P(20).

Environment: T-SQL
*/

SET NOCOUNT ON;

WITH star AS (
    SELECT 20 as n
    UNION ALL
    SELECT n - 1
    FROM star
    WHERE n > 1
)
SELECT REPLICATE(' *', n)
FROM star;

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Recursive CTE Anatomy:
    A Recursive Common Table Expression is the SQL equivalent of a 'WHILE' loop.
    It consists of an Anchor Member (the initial seed value) and a Recursive Member
    that references the CTE itself. The 'WHERE' clause in the recursive member is 
    crucial - it acts as the termination condition to prevent infinite loops.

2. The REPLICATE Function:
    'REPLICATE(string, integer)' is a highly optimized T-SQL function used to repeat
    a specific string a given number of times. It perfectly pairs with a tally/numbers
    table or a recursive sequence to generate visual petterns or padded strings.
*/