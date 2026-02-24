/*
Problem: Population Census
Link: https://www.hackerrank.com/challenges/asian-population/problem
Difficulty: Basic
Score: 10/10

Description:
Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT SUM(CI.POPULATION)
FROM CITY CI
    JOIN COUNTRY CO ON CI.COUNTRYCODE = CO.CODE
WHERE CO.CONTINENT = 'Asia';

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. INNER JOIN as a Filter:
    An 'INNER JOIN' intrinsically acts as a filter. It ensures that only cities with a valid,
    matching 'COUNTRYCODE' in the 'COUNTRY' table are included in the aggregation.

2. Table Aliasing:
    Using short table aliases ('CI', 'CO') is a standard. It improves readability, especially
    when tables share identical column names, preventing 'Ambiguous Column Name' errors.

*/