/*
Problem: Revising Aggregations - Averages
Link: https://www.hackerrank.com/challenges/revising-aggregations-the-average-function/problem
Difficulty: Basic
Score: 10/10

Description:
Query the average population of all cities in CITY where District is California.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT CAST(AVG(POPULATION * 1.0) AS DECIMAL(10, 3))
FROM CITY
WHERE DISTRICT = 'California'

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. The "Integer Math" Trap:
   When applying `AVG()` to a column of type INT, the SQL engine performs Integer Division. 
   It truncates any decimal remainders before you even have a chance to format the output.
   For example, wrapping the result in a CAST: `CAST(AVG(POPULATION) AS DECIMAL(10,3))` 
   will result in '113000.000' because the decimal data was already lost during the AVG calculation.

2. The Fix (Implicit Conversion):
   To calculate a precise average, the data type *inside* the function must be a float or decimal. 
   Multiplying by `1.0` (`AVG(POPULATION * 1.0)`) implicitly converts the integer values to decimals 
   BEFORE the average is calculated, ensuring a mathematically precise result (e.g., 113000.667).

*/