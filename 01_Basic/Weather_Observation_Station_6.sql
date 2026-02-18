/*
Problem: Weather Observation Station 6
Link: https://www.hackerrank.com/challenges/weather-observation-station-6/problem
Difficulty: Basic
Score: 10/10

Description:
Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION.
Your result cannot contain duplicates.

Environment: T-SQL
*/

SET NOCOUNT ON;

/*
Instead of using multiple OR conditions (e.g., LIKE 'A%' OR LIKE 'E%'),
I use T-SQL's bracket wildcard []
*/

SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE '[AEIOU]%'
ORDER BY CITY


/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Syntax Efficiency (Maintainability):
    Using '[AEIOU]%' reduces code verbosity significantly compared to 5 separate 'OR' clauses.
    Clean code is easier to read, debug and maintain.

2. SARGability (Crucial for Performance):
    The query 'LIKE '[AEIOU]%' is SARGable! The SQL Server Query Optimizer can convert this 
    pattern into a series of Range Scans (e.g., seeking from 'A' to 'Azz...', then 'E' to 'Ezz..').
*/