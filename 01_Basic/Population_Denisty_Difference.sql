/*
Problem: Population Density Difference
Link: https://www.hackerrank.com/challenges/population-density-difference/problem
Difficulty: Basic
Score: 10/10

Description:
Query the difference between the maximum and minimum populations in CITY.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT MAX(POPULATION) - MIN(POPULATION) AS DifferenceMaxMin
FROM CITY;

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Mathematical Operations on Aggregates:
    You can perform arithmetic operations directly between aggregate functions in
    the SELECT clause. This is computationally efficient because the engine resolves
    the aggregates first, then simply subtracts the two resulting scalar values.

2. Index MIN/MAX Optimization:
    If there is a B-Tree index on the 'POPULATION' column, the SQL Server Optimizer
    can use a technique called 'Index Min/Max Optimization'. Because a B-Tree is 
    already sorted, the engine doesn't scan the table. It simply jumps to the very
    first leaf node to get the 'MIN' and the very last leaf node to get the 'MAX'.

*/