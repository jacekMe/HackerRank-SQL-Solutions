/*
Problem: Select By ID
Link: https://www.hackerrank.com/challenges/select-by-id/problem
Difficulty: Basic
Score: 10/10

Description:
Query all columns for a city in CITY with the ID 1661.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT *
FROM CITY
WHERE ID = 1661

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Clustered Index Seek:
    Assuming the 'ID' column is the Primary Key of the CITY table (which is standard practice),
    SQL Server will automatically create a Clustered Index on it. The execution plan for this
    query will show a "Clustered Index Seek". This is the most efficient data retrieval
    operation possible (O(log n) time complexity) because the data pages are physically
    sorted by this ID.

2. SARGability:
    The query is fully SARGable. The condition `ID = 1661` uses a direct equality operator
    on a clean column without applying any functions, allowing the engine to leverage the index.

3. The SELECT * Nuance:
    While `SELECT *` is generally an anti-pattern (as noted in previous exercises due to network/memory
    overhead), from a pure I/O perspective, when performing a Clustered Index Seek, retrieving all columns
    does not incur extra logical reads. The leaf node of a Clustered Index contains the entire data row.
    However, explicitly defining required columns remains the best practice for application stability.
*/