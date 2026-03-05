/*
Problem: Draw The Triangle 2
Link: https://www.hackerrank.com/challenges/draw-the-triangle-2/problem
Difficulty: Advanced
Score: 10/10

Description:
P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):
* 
* * 
* * * 
* * * * 
* * * * *
Write a query to print the pattern P(20).

Environment: T-SQL
*/

SET NOCOUNT ON;

WITH star AS (
    SELECT 1 as n

    UNION ALL

    SELECT n + 1
    FROM star
    WHERE n < 20
)
SELECT REPLICATE(' *', n)
FROM star;

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Recursion Directionality:
    This query demonstrates how easily the direction of a recursive loop can be inverted.
    By changing the Anchor Member to '1' and the Recursive Member operator to '+1', we 
    generate an ascending sequence (1 to 20) instead of a descending one.
*/