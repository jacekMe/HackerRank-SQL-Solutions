/*
Problem: Weather Observation Station 5
Link: https://www.hackerrank.com/challenges/weather-observation-station-5/problem
Difficulty: Intermediate
Score: 10/10

Description:
Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths.
If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.

Environment: T-SQL
*/

/*
--- SOLUTION 1 ---
Thanks to the use of TOP 1 with a double ORDER BY clause, we handle both the length requirement and the 
alphabetical tiebreaker in a single pass query.
*/

SELECT TOP 1 CITY, LEN(CITY) AS NameLength 
FROM STATION 
ORDER BY LEN(CITY) ASC, CITY ASC;

SELECT TOP 1 CITY, LEN(CITY) AS NameLength 
FROM STATION 
ORDER BY LEN(CITY) DESC, CITY ASC;

/*
--- SOLUTION 2 ---
If the requirement strictly forced a single result set, we would use UNION ALL.
Note: We use UNION ALL instead of UNION because we know the two rows will be distinct (one is min, one is max)
so we save the cost of the engine checking for duplicates.

SELECT * FROM (
    SELECT TOP 1 CITY, LEN(CITY) as L FROM STATION ORDER BY LEN(CITY) ASC, CITY ASC
) AS Shortest
UNION ALL
SELECT * FROM (
    SELECT TOP 1 CITY, LEN(CITY) as L FROM STATION ORDER BY LEN(CITY) DESC, CITY ASC
) AS Longest;
*/


/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Sorting Cost vs. Subqueries:
    A common mistake is trying to use 'WHERE LEN(CITY) = (SELECT MIN(...))'. This approach fails on the 
    "alphabetical tiebreaker" rule because it returns ALL cities of the minimum length. Filtering those 
    duplicates requires comple logic. The 'ORDER BY LEN(CITY), CITY' approach handles the tiebreaker natively
    (O(n log n) complexity), which is efficient for this dataset size.

2. Dialect Specifies:
    - T-SQL uses 'LEN()' and 'TOP'
    - PostgreSQL would use 'LENGTH()' and 'LIMIT'
    Knowledge of these nuances is crucial when migrating code between environments.
*/