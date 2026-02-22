/*
Problem: Weather Observation Station 13
Link: https://www.hackerrank.com/challenges/weather-observation-station-13/problem
Difficulty: Basic
Score: 10/10

Description:
Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345.
Truncate your answer to 4 decimal places.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT CAST(SUM(LAT_N) AS DECIMAL(10,4))
FROM STATION
WHERE LAT_N > 38.7880 AND LAT_N < 137.2345;


/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. '< >' vs BETWEEN:
    The prompt asks for "greather than 38.7880 and less than 137.2345".
    The 'BETWEEN' operator in SQL is INCLUSIVE (it means '>=' and '<=').
    To be strictly mathematically correct according to the prompt, we 
    must use > and <.

*/