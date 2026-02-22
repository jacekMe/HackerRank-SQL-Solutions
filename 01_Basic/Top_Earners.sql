/*
Problem: Top Earners
Link: https://www.hackerrank.com/challenges/earnings-of-employees/problem
Difficulty: Basic
Score: 10/10

Description:
Write a query calculating the amount of error (i.e.: actual - miscalculated average monthly salaries), and round it up to the next integer.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT TOP 1 (months * salary) AS earnings, COUNT(*)
FROM Employee
GROUP BY (months * salary)
ORDER BY earnings DESC;

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Grouping by Expressions (The Hidden Bug):
    A mistake you can make is grouping by base 'salary'. If Employee A (10 months, $10k salary)
    and Employee B (5 months, $20k salary) both earn $100k total, grouping by 'salary' splits 
    them into different buckets. You MUST 'GROUP BY (months * salary)' to bucket them correctly.

2. TOP 1 vs HAVING/CTE:
    While you could use a subquery/CTE to find the MAX(earnings) and then fileter 
    'HAVING earning = MAX()', sorting the aggregated buckets by earning DESC and 
    taking 'TOP 1' is significantly more concise and highly optimized in T-SQL. 

*/