/*
Problem: Revising Aggregations - The Sum Function
Link: https://www.hackerrank.com/challenges/revising-aggregations-sum/problem
Difficulty: Basic
Score: 10/10

Description:
Query the total population of all cities in CITY where District is California.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT SUM(POPULATION)
FROM CITY
WHERE DISTRICT = 'California'

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. The Arithmetic Overflow Trap:
   While this query is perfectly correct for the given dataset, in Enterprise environments 
   with massive datasets, `SUM(INT_COLUMN)` can easily exceed the maximum limit of the INT 
   data type (2,147,483,647), resulting in an "Arithmetic Overflow Error".
   
   Senior Optimization: If an overflow is possible, cast the column inside the SUM to a larger 
   type beforehand: `SUM(CAST(POPULATION AS BIGINT))`.

*/