/*
Problem: Select All
Link: https://www.hackerrank.com/challenges/select-all-sql/problem
Difficulty: Basic
Score: 10/10

Description:
Query all columns (attributes) for every row in the CITY table.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT *
FROM CITY

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. The "SELECT *" Anti-Pattern:
    While HackerRank explicitly asks for 'SELECT *' to pass this challenge, in a real-world
    production environment, using 'SELECT *' is considered an anti-pattern

2. Why to avoid "SELECT *" in commercial applications:
    - Network Traffic: It retrieves all columns, even those not needed by the application,
      wasting memory and network bandwith.
    - Application Stability: If the table schema changes (e.g. a new column is added), 
      it can break frontend applications or APIs expecting a fixed column structure.
    - Performance limitations: It prevents the database engine from using "Covering Indexes",
      forcing a full Table Scan or Clustered Index Scan.

   Best Practice: Always explicitly list the required columns (e.g. SELECT ID, NAME, DISTRICT FROM CITY). 
*/