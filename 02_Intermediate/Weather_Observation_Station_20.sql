/*
Problem: Weather Observation Station 20
Link: https://www.hackerrank.com/challenges/weather-observation-station-20/problem
Difficulty: Intermediate
Score: 10/10

Description:
A median is defined as a number separating the higher half of a data set from the lower half.
Query the median of the Northern Latitudes (LAT_N)

Environment: T-SQL
*/

SET NOCOUNT ON;

/*
    --- SOLUTION 1: Modern T-SQL with PERCENTILE_CONT ---
This is the most direct way to calculate a median in SQL Server 2012+.
Note:
Since it's a Window Function (OVER clause), it returns the median for every row.
We use TOP 1 (which is cheaper than DISTINCT) to return just a single value.
*/
SELECT TOP 1 CAST(PERCENTILE_CONT(0.5) 
        WITHIN GROUP (ORDER BY LAT_N) 
        OVER () AS DECIMAL(10, 4)) AS Median
FROM STATION

/*
    --- SOLUTION 2: The "Old School" Approach ---
Other solution this task.
We use ROW_NUMBER() to physically find the middle row(s).
Integer division trick:
- If TotalRows = 5: (5+1)/2 = 3 and (5+2)/2 = 3. We average row 3
- If TotalRows = 4: (4+1)/2 = 2 and (4+2)/2 = 3. We average rows 2 and 3.
*/
/*
WITH OrderedStation AS (
    SELECT LAT_N,
        ROW_NUMBER() OVER (ORDER BY LAT_N) AS RowNum,
        COUNT(*) OVER () AS TotalRows
    FROM STATION
)
SELECT CAST(AVG(LAT_N) AS DECIMAL(10,4)) AS Median
FROM OrderedStation
WHERE RowNum IN ((TotalRows + 1)/2, (TotalRows + 2) / 2);
*/

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Window Functions vs Aggregate Functions:
    'PERCENTILE_CONT' is a distribution function that operates within a window ('OVER()').
    Unlike 'AVG()' or 'SUM()', it does not collapse the result set. Using 'TOP 1' is generally
    more performant than 'DISTINCT' because it avoids the overhead of sorting/hashing the entire
    result set just to remove duplicates.

2. PERCENTILE_CONT vs PERCENTILE_DISC:
    - 'PERCENTILE_CONT' (Continuous): Interpolates the exact median value if the middle falls
    between two rows (e.g., avg of the two middle values)
    - 'PERCENTILE_DISC' (Discrete): Will strictly return an existing value from the dataset
    (the first one that satisfies the cumulative distribution).
*/