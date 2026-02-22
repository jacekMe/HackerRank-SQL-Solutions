/*
Problem: Weather Observation Station 14
Link: https://www.hackerrank.com/challenges/weather-observation-station-14/problem
Difficulty: Basic
Score: 10/10

Description:
Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345.
Truncate your answer to 4 decimal places.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT CAST(MAX(LAT_N) AS DECIMAL(10, 4))
FROM STATION
WHERE LAT_N < 137.2345;

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. MIN/MAX conditions:
    If we want to use the largest or smallest value, this is a simple aggregation.

*/