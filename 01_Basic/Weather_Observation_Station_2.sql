/*
Problem: Weather Observation Station 2
Link: https://www.hackerrank.com/challenges/weather-observation-station-2/problem
Difficulty: Basic
Score: 10/10

Description:
Query the following two values from the STATION table:

1. The sum of all values in LAT_N rounded to a scale of 2 decimal places.
2. The sum of all values in LONG_W rounded to a scale of 2 decimal places.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT  CAST(SUM(LAT_N) AS DECIMAL(10,2)) AS lat, 
        CAST(SUM(LONG_W) AS DECIMAL(10,2)) AS lon
FROM STATION;

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. DECIMAL(p, s) Definition:
    DECIMAL(10, 4) explicitly defines a numeric type with a total of 10 digits (precision),
    out of which 4 are placed after the decimal point (scale). This leave 6 digits for the 
    whole number portion.

*/