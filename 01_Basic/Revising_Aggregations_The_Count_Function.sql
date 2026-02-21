/*
Problem: Revising Aggregations - The Count Function
Link: https://www.hackerrank.com/challenges/revising-aggregations-the-count-function/problem
Difficulty: Basic
Score: 10/10

Description:
Query a count of the number of cities in CITY having a Population larger than 100 000.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT COUNT(*)
FROM CITY
WHERE POPULATION > 100000;

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. COUNT(*) vs COUNT(Column_Name):
   - `COUNT(*)` counts all rows that meet the WHERE criteria, regardless of NULL values. 
     It is generally highly optimized by the SQL engine.
   - `COUNT(ID)` or `COUNT(NAME)` counts only the rows where that specific column is NOT NULL.
   Always use `COUNT(*)` unless you explicitly want to ignore NULLs in a specific column, 
   as it communicates intent clearly.

*/