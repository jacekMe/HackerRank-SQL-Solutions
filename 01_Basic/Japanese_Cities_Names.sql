/*
Problem: Japanese Cities' Names
Link: https://www.hackerrank.com/challenges/japanese-cities-name/problem
Difficulty: Basic
Score: 10/10

Description:
Query the names of all the Japanese cities in the CITY table.
The COUNTRYCODE for Japan is JPN.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'JPN';

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. The Cost of "Key Lookup" (vs. Covering Index):
    If we have a standard index on just 'COUNTRYCODE', the engine finds the rows for 'JPN'
    quickly but must jump back to the main table (Clustered Index) to retrieve the 'NAME' 
    column. This operation is called a "Key Lookup" (or RID Lookup in heaps) and is 
    expensive for large datasets.

2. Optimization:
    As discussed in previous tasks, including 'NAME' in the index (INCLUDE clause) 
    eliminates this Lookup step, making the query purely index-based.
*/