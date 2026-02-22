/*
Problem: Weather Observation Station 19
Link: https://www.hackerrank.com/challenges/weather-observation-station-19/problem
Difficulty: Basic
Score: 10/10

Description:
Query the Euclidean Distance between points 'P1' and 'P2' and format your answer to display 4 decimal digits.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT CAST(SQRT(POWER(MAX(LAT_N) - MIN(LAT_N), 2) + POWER(MAX(LONG_W) - MIN(LONG_W), 2)) AS DECIMAL(10,4))
FROM STATION;


/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Euclidean Distance:
    Formula: SQRT((x1 - x2)^2 + (y1 - y2)^2).
    This is the distance “in a straight line” (as the crow flies).
    It follows directly from the Pythagorean theorem (a² + b² = c²).

*/