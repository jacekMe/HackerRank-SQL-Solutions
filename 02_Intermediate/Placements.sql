/*
Problem: Placements
Link: https://www.hackerrank.com/challenges/placements/problem
Difficulty: Intermediate
Score: 10/10

Description:
Write a query to output the names of those students whose best friends got offered 
a higher salary than them. Names must be ordered by the salary amount offered to 
the best friends. It is guaranteed that no two students got same salary offer.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT S.Name
FROM Students S
    JOIN Friends F ON S.ID = F.ID
    JOIN Packages P1 ON S.ID = P1.ID
    JOIN Packages P2 ON F.Friend_ID = P2.ID
WHERE P2.Salary > P1.Salary
ORDER BY P2.Salary ASC;

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Multiple Instance Joining:
    This query is a classic example of traversing relationships. The 'Packages'
    table must be joined twice to serve two distinct business contexts in the 
    same row:
        - 'P1': The salary belonging to the primary Student
        - 'P2': The salary belonging to the Student's Friend
    Using clear table aliases ('P1', 'P2') is mandatory to prevent ambiguous 
    column errors and to successfully compare the two distinct contexts 
        'WHERE P2.Salary > P1.Salary'
 
*/