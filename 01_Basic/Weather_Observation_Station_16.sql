/*
Problem: Weather Observation Station 16
Link: https://www.hackerrank.com/challenges/weather-observation-station-16/problem
Difficulty: Basic
Score: 10/10

Description:
Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780. 
Round your answer to 4 decimal places.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT CAST(MIN(LAT_N) AS DECIMAL(10,4))
FROM STATION
WHERE LAT_N > 38.7780;

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. MIN/MAX conditions:
    If we want to use the largest or smallest value, this is a simple aggregation.

*/