/*
Problem: African Cities
Link: https://www.hackerrank.com/challenges/african-cities/problem
Difficulty: Basic
Score: 10/10

Description:
Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT CI.NAME
FROM CITY CI
    JOIN COUNTRY CO ON CI.COUNTRYCODE = CO.CODE
WHERE CO.CONTINENT = 'Africa';

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Join Performance & Indexes:
    In a normalized relational database, 'COUNTRYCODE' (Foreign Key in CITY) and 'CODE' (Primary Key in COUNTRY)
    would be indexed. The Query Optimizer efficiently leverages these indexes to perform a 'Nested Loops' or
    'Hash Match' join, making this operation extremely fast even on millions of rows.

*/