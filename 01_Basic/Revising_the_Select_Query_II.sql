/*
Problem: Revising the Select Query II
Link: https://www.hackerrank.com/challenges/revising-the-select-query-2/problem
Difficulty: Basic
Score: 10/10

Description:
Query the NAME field for all American cities in the CITY table with populations larger than 120000.
The CountryCode for America is USA.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'USA' AND POPULATION > 120000;
-- ORDER BY NAME; -- Optional: added for deterministic results if needed

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Indexing Strategy:
    To achieve optimal performance, we can create a "Covering Index" for this specific query.
    By indexing the columns used in the WHERE clause and including the column used in the SELECT clause,
    the database engine can fulfill the query entirely from the index without accessing the base table.
    Example:
    CREATE NONCLUSTERED INDEX IX_City_CountryCode_Population ON CITY(COUNTRYCODE, POPULATION) INCLUDE (NAME);

2. Performance:
    The query remains SARGable. No functions or calculations are applied to the filtered columns
    (COUNTRYCODE, POPULATION), allowing the database engine to utilize indexes efficiently (Index Seek).
*/