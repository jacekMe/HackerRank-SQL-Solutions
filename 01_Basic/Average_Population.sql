/*
Problem: Average Population
Link: https://www.hackerrank.com/challenges/average-population/problem
Difficulty: Basic
Score: 10/10

Description:
Query the average population for all cities in CITY, rounded down to the nearest integer.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT FLOOR(AVG(POPULATION))
FROM CITY;

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Implicit vs. Explicit Behavior:
   Because POPULATION is an INT, 'AVG(POPULATION)' naturally truncates the decimal portion.
   However, relying on implicit data type truncation is a bad practice. If the schema ever changes
   POPULATION to a FLOAT/DECIMAL, the query will break the business requirement.

   Using explicit 'FLOOR(AVG(... * 1.0))' self-documents the code, making the intent ("round down")
   clear to other developers.

*/