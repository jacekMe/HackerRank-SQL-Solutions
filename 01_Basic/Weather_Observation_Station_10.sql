/*
Problem: Weather Observation Station 10
Link: https://www.hackerrank.com/challenges/weather-observation-station-10/problem
Difficulty: Basic
Score: 10/10

Description:
Query the list of CITY names from STATION that do not end with vowels.
Your result cannot contain duplicates.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT LIKE '%[aeiou]'
ORDER BY CITY


/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Pattern Matching:
    Successfully applied the inverse of the trailing wildcard pattern. Maintains high code
    readability by avoiding multiple 'NOT LIKE ... AND NOT LIKE ...' clauses.
*/