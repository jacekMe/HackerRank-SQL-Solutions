/*
Problem: Weather Observation Station 4
Link: https://www.hackerrank.com/challenges/weather-observation-station-4/problem
Difficulty: Basic
Score: 10/10

Description:
Find the difference between the total number of CITY entries in the table and the number of distinct CITY entries in the table.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT COUNT(CITY) - COUNT(DISTINCT CITY)
FROM STATION;



/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Aggregation Mechanics:
    - 'COUNT(CITY)' counts all non-NULL values in the CITY column.
    - 'COUNT(DISTINCT CITY)' requires the engine to first sort or hash the CITY column to identify unique values,
      making it significantly more expensive (resource-intensive) than a simple count.

2. NULL Handling:
    It is important to note that 'COUNT(ColumnName)' ignores NULLs, whereas 'COUNT(*)' counts rows regardless of content.
    In this specific problem, assuming CITY is mandatory, the result is the same, but explicit column counting is safer for logic.
*/