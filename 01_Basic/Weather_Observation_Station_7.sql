/*
Problem: Weather Observation Station 7
Link: https://www.hackerrank.com/challenges/weather-observation-station-7/problem
Difficulty: Basic
Score: 10/10

Description:
Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION.
Your result cannot contain duplicates.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE '%[aeiou]'
ORDER BY CITY


/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Trailing Wildcards & Performance
    Unlike the previous task (Starts With), checking for 'Ends With' (using '%' at the start of the string)
    is generally NON-SARGable for standard B-Tree indexes. The database usually has to scan the entire 
    index/table because standard indexes are sorted from left to right (like a dictionary).

    However, the syntax 'LIKE '%[aeiou]'' is preferred over multiple 'OR' statemets striclty for code 
    readability and maintainability.
*/