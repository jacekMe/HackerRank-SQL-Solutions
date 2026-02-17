/*
Problem: Weather Observation Station 1
Link: https://www.hackerrank.com/challenges/weather-observation-station-1/problem
Difficulty: Basic
Score: 10/10

Description:
Query a list of CITY and STATE from the STATION table.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT CITY, STATE
FROM STATION;


/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Column Selection:
    Explicitly selecting 'CITY, STATE' instead of 'SELECT *' reduces I/O and network overhead.
    This is a fundamental optimization practice ("Projection").
*/