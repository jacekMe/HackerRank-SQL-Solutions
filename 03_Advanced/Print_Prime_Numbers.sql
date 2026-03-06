/*
Problem: Print Prime Numbers
Link: https://www.hackerrank.com/challenges/print-prime-numbers/problem
Difficulty: Advanced
Score: 10/10

Description:
Write a query to print all prime numbers less than or equal to . Print your result on a single line, 
and use the ampersand (&) character as your separator (instead of a space).

Environment: T-SQL
*/

SET NOCOUNT ON;

WITH Numbers AS (
    SELECT 2 AS n
    UNION ALL
    SELECT n + 1
    FROM Numbers
    WHERE n < 1000
)
SELECT STRING_AGG(CAST(N1.n AS VARCHAR(10)), '&') WITHIN GROUP (ORDER BY N1.n) AS PrimeNumbers
FROM Numbers N1
WHERE NOT EXISTS (
    SELECT 1
    FROM Numbers N2
    WHERE N2.n < N1.n AND N1.n % N2.n = 0
)
OPTION (MAXRECURSION 0);

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Set-Based Prime Calculation:
    SQL is designed for set-based operations, not procedural loops. To find primes, we translate
    the mathematical definition into set theory: "A number N1 is prime if there DOES NOT EXIST 
    a number N2 (where 1 < N2 < N1) such that N1 modulo N2 equals 0". The 'NOT EXISTS' correlated
    subquery elegantly handles this iterative check.

2. STRING_AGG:
    'STRING_AGG()' is the modern T-SQL function for concatenating rows into strings.

3. MAXRECURSION Limit:
    By default, SQL Server terminates a Recursive CTE after 100 iterations to prevent infinite
    loops. Since we need to generate up to 1000, we must append 'OPTION (MAXRECURSION 0)' - 
    which means unlimited or 'OPTION (MAXRECURSION 1000)'.
*/