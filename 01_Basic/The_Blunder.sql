/*
Problem: The Blunder
Link: https://www.hackerrank.com/challenges/the-blunder/problem
Difficulty: Basic
Score: 10/10

Description:
Write a query calculating the amount of error (i.e.: actual - miscalculated average monthly salaries), and round it up to the next integer.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT CEILING(AVG(Salary * 1.0 - CAST(REPLACE(Salary, 0, '') AS INT))) AS ErrorAvgSalary
FROM EMPLOYEES;

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Mathematical Distribution in Aggregates:
    Instead of calculating 'AVG(actual) - AVG(miscalculated)' we can optimize the formula
    mathematically to 'AVG(actual - miscalculated)'. This reduces the aggregation passes 
    the engine need to make.

2. CEILING() vs ROUND():
    The requirement strictly states "round UP to the next integer". 'ROUNG()' mathematically
    round to the nearest whole number (up or down). 'CEILING()' strictly forces any decimal 
    to the next highest integer.

*/