/*
Problem: Revising the Select Query I
Link: https://www.hackerrank.com/challenges/revising-the-select-query/problem
Difficulty: Basic
Score: 10/10

Description:
Query all columns for all American cities in the CITY table with populations larger than 100000.
The CountryCode for America is USA.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT *
FROM CITY
WHERE COUNTRYCODE = 'USA' AND POPULATION > 100000;
-- ORDER BY ID; -- Optional: added for deterministic results if needed

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Indexing Strategy:
    In a real-world scenario with millions of rows, to optimize this query,
    a composite non-clustered index on (COUNTRYCODE, POPULATION) would be beneficial.
    Example:
    CREATE INDEX IX_City_Country_Pop ON CITY(COUNTRYCODE, POPULATION) INCLUDE (NAME, DISTRICT);

2. Performance:
    The query is SARGable (Search ARGument ABLE) because we are not applying functions
    to the columns in the WHERE clause.
*/