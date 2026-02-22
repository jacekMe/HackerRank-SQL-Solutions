/*
Problem: Weather Observation Station 15
Link: https://www.hackerrank.com/challenges/weather-observation-station-15/problem
Difficulty: Basic
Score: 10/10

Description:
Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345.
Round your answer to 4 decimal places.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT TOP 1 CAST(LONG_W AS DECIMAL(10,4))
FROM STATION
WHERE LAT_N < 137.2345
ORDER BY LAT_N DESC;

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Subquery vs TOP/ORDER BY:
    Using a subquery ('WHERE LAT_N = (SELECT MAX()') forces the engine to potentially
    evaluate the table twice if there is no optimal index.
    Using 'TOP 1' combined with 'ORDER BY LAT_N DESC' allows the engine to scan the
    index backwards, grab the first matching row, and stop immediately. 
    This is higly efficient.

*/