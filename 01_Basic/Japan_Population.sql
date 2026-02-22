/*
Problem: Japan Population
Link: https://www.hackerrank.com/challenges/japan-population/problem
Difficulty: Basic
Score: 10/10

Description:
Query the sum of the populations for all Japanese cities in CITY.
The COUNTRYCODE for Japan is JPN.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT SUM(POPULATION)
FROM CITY
WHERE COUNTRYCODE = 'JPN';

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Logical Query Processing Order:
    It's important to understand how the SQL engine processes this query.
    The 'WHERE' clause is evaluated BEFORE the 'SELECT' clause.
    Therefore, the engine first filters the dataset to only include rows where 
    COUNTRYCODE = 'JPN', and only then performs the 'SUM()' aggregation on that
    much smaller subset.

2. Index Utilization:
    Because the 'WHERE' clause is SARGable, an index on 'COUNTRYCODE' would allow
    the engine to perform an Index Seek, making the subsequent aggregation 
    extremely fast.

*/