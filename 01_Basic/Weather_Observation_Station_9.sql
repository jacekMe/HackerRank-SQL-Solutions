/*
Problem: Weather Observation Station 9
Link: https://www.hackerrank.com/challenges/weather-observation-station-9/problem
Difficulty: Basic
Score: 10/10

Description:
Query the list of CITY names from STATION that do not start with vowels.
Your result cannot contain duplicates.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT LIKE '[AEIOU]%'
ORDER BY CITY


/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. The Cost of Negation (NOT LIKE):
    While the syntax is perfectly optimized using T-SQL Pattern Matching '[]', using the 'NOT' operator
    generally makes a query NON-SARGable. To find everything that "does not" match a pattern, the SQL 
    optimizer typically cannot use an Index Seek and must resort to an Index Scan or Table Scan, 
    evaluating every row.
*/