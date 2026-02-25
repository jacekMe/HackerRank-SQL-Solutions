/*
Problem: Occupations
Link: https://www.hackerrank.com/challenges/occupations/problem
Difficulty: Intermediate
Score: 10/10

Description:
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically 
and displayed underneath its corresponding Occupation. The output should consist of four 
columns (Doctor, Professor, Singer, and Actor) in that specific order, with their 
respective names listed alphabetically under each column.

Note: Print NULL when there are no more names corresponding to an occupation.

Environment: T-SQL
*/

SET NOCOUNT ON;

WITH NumberedOccupations AS (
    SELECT Name, Occupation,
           ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) AS rn
    FROM OCCUPATIONS
)
SELECT
    MAX(CASE WHEN Occupation = 'Doctor' THEN Name END) AS Doctor,
    MAX(CASE WHEN Occupation = 'Professor' THEN Name END) AS Professor,
    MAX(CASE WHEN Occupation = 'Singer' THEN Name END) AS Singer,
    MAX(CASE WHEN Occupation = 'Actor' THEN Name END) AS Actor
FROM NumberedOccupations
GROUP BY rn
ORDER BY rn;

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Conditional Aggregation (The Universal Pivot):
    While T-SQL supports the strict 'PIVOT' relational operator, using 'MAX(CASE...)'
    paired with 'GROUP BY' is the ANSI-standard method for pivoting data. This is 
    crucial knowledge because databases like PostgreSQL, MySQL or Firebird do not 
    have a built-in 'PIVOT' operator.

2. The role of ROW_NUMBER() and MAX():
    Without 'ROW_NUMBER', grouping by occupation would collapse all doctors into a 
    single row. By assigning an index ('rn') to each person within their profession,
    we create a common key to group across different professions. The 'MAX()' function
    acts as a collapser: sine 'MAX()' ignores NULL values, it effectively merges the 
    scattered string values into a single consolidated row.

*/