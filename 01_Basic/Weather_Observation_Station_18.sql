/*
Problem: Weather Observation Station 18
Link: https://www.hackerrank.com/challenges/weather-observation-station-18/problem
Difficulty: Basic
Score: 10/10

Description:
Query the Manhattan Distance between points 'P1' and 'P2' and round it to a scale of 4 decimal places.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT CAST((MAX(LAT_N) - MIN(LAT_N)) + (MAX(LONG_W) - MIN(LONG_W))) AS DECIMAL(10,4)
FROM STATION;

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Manhattan Distance:
    Formula: |x1 - x2| + |y1 - y2|. 
    Imagine you are standing in the center of NYC (Manhattan) at the intersection of streets
    arranged in a perfect grid. You want to get to another point. You cannot fly diagonally
    (in a straight line) over the buildings. You have to walk along the streets: first 'X' 
    blocks to the rights, then 'Y' blocks up.
*/