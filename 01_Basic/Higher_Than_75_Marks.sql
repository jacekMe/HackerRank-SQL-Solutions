/*
Problem: Higher Than 75 Marks
Link: https://www.hackerrank.com/challenges/more-than-75-marks/problem
Difficulty: Basic
Score: 10/10

Description:
Query the Name of any student in STUDENTS who scored higher than 75 Marks.
Order your output by the last three characters of each name. 
If two or more students both have names ending in the same last three characters 
(i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT Name
FROM STUDENTS
WHERE Marks > 75
ORDER BY RIGHT(NAME, 3), ID ASC;

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. String Functions in ORDER BY:
    Using 'RIGHT(Name, 3)' in the ORDER BY clause is the correct and most readable solution here.

2. Performance Implications (The "Sort Penalty"):
    Applying a function to a column during a sort operation prevents the database engine from using an index
    on that column to pre-sort the data. The engine must compute 'RIGHT(Name, 3)' for every filtered row in
    memory and the perform a physical sort operation (which is CPU and Memory intensive).

    Enterprise Optimization:
    If this was a frequent query on a table with millions of rows, a DBA would create a "Computed Column"
    (e.g., 'Last3Chars AS RIGHT(Name, 3)') and place an index on it to completely eliminate the sorting 
    cost at runtime.

*/