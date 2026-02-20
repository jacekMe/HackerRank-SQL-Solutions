/*
Problem: Employee Names
Link: https://www.hackerrank.com/challenges/name-of-employees/problem
Difficulty: Basic
Score: 10/10

Description:
Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT name
FROM Employee
ORDER BY name;

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Implicit Sorting:
    Omitting 'ASC' or 'DESC' defaults to Ascending order. It's concise, though explicitly writing 'ASC'
    is sometimes preferred in strict corporate coding standards for absolute clarity.

2. Collation Awareness:
    "Alphabetical order" in database isn't always as simple as A-Z. It depends heavily on the server's or database's
    "Collation" settings (e.g., SQL_Latin1_General_CP1_CI_AS).
    Collation dictates:
    - Case Sensitivity (CI vs CS): Does 'a' equal 'A'? Does 'Zebra' come before 'apple'?
    - Accent Sensitivity (AI vs AS): Does 'e' equal 'é'?
    A data analyst must be aware that the same query might sort differently on two servers with different collation setups.

*/