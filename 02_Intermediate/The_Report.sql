/*
Problem: The Report
Link: https://www.hackerrank.com/challenges/the-report/problem
Difficulty: Intermediate
Score: 10/10

Description:
Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. 
Ketty doesn't want the NAMES of those students who received a grade lower than 8.
The report must be in descending order by grade -- i.e. higher grades are entered first.
If there is more than one student with the same grade (8-10) assigned to them, order those 
particular students by their name alphabetically. Finally, if the grade is lower than 8, 
use "NULL" as their name and list them by their grades in descending order. If there is more 
than one student with the same grade (1-7) assigned to them, order those particular students by 
their marks in ascending order.

Write a query to help Eve.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT CASE
        WHEN g.Grade < 8 THEN 'NULL'
        ELSE s.Name
        END AS Report, g.Grade, s.Marks
FROM Students s
    JOIN Grades g ON s.Marks BETWEEN g.Min_Mark AND g.Max_Mark
ORDER BY Grade DESC, Name ASC;

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Non-Equi Joins:
    Most joins are based on equality (A.id = B.id). This query demonstrates a "Non-Equi Joins"
    using the 'BETWEEN' operator (ON s.Marks BETWEEN g.Min_Mark AND g.Max_Mark).
    This is crucial for categorizing continuous data (like grades, tax brackets, or salary bands)
    without needing complex subqueries.
*/