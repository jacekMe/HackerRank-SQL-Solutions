/*
Problem: Japanese Cities' Attributes
Link: https://www.hackerrank.com/challenges/japanese-cities-attributes/problem
Difficulty: Basic
Score: 10/10

Description:
Query all attributes of every Japanese city in the CITY table.
The COUNTRYCODE for Japan is JPN.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT *
FROM CITY
WHERE COUNTRYCODE = 'JPN';

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Cardinality & Selectivity:
    The efficiency of an index on 'COUNTRYCODE' depends heavily on data distribution.
    - High Selectivity (Few 'JPN' rows): 
        If 'JPN' constitutes a small percentage of rows (e.g. < 5%),
        the optimizer will likely choose an "Index Seek" + "Key Lookup".
    - Low Selectivity (Many 'JPN' rows):
        If a significant portion of the table is 'JPN', the optimizer might ignore 
        the non-clustered index and perform a "Clustered Index Scan" (Table Scan)
        to avoid the overhead of random I/O lookups.

    This demonstrates why maintaining up-to-date STATISTICS is crucial for the 
    Query Optimizer.
*/