/*
Problem: New Companies
Link: https://www.hackerrank.com/challenges/the-company/problem
Difficulty: Intermediate
Score: 10/10

Description:
Print:
- the company_code,
- founder name,
- total number of lead managers,
- total number of senior managers,
- total number of managers,
- total number of employees.
Order your output by ascending company_code.

Note:
The tables may contain duplicate records.
The company_code is string, so the sorting should not be numeric.
For example, if the company_codes are C1, C2, and C10, then the ascending company_codes will be C1, C10, and C2.

Environment: T-SQL
*/


SET NOCOUNT ON;

/* --- SOLUTION 1: The "Chain Join" Approach ---
   Valid, but computationally expensive due to multiple joins creating a large intermediate dataset.
*/
/*
SELECT 
    C.company_code, 
    C.founder, 
    COUNT(DISTINCT LM.lead_manager_code),
    COUNT(DISTINCT SM.senior_manager_code),
    COUNT(DISTINCT M.manager_code), 
    COUNT(DISTINCT E.employee_code)
FROM Company C
    JOIN Lead_Manager LM ON LM.company_code = C.company_code
    JOIN Senior_Manager SM ON SM.company_code = C.company_code
    JOIN Manager M ON M.company_code = C.company_code
    JOIN Employee E ON E.company_code = C.company_code
GROUP BY C.company_code, C.founder
ORDER BY C.company_code;
*/

/* --- SOLUTION 2: The "Fact Table" Optimization --- */
SELECT C.company_code, C.founder, COUNT(DISTINCT E.lead_manager_code), 
        COUNT(DISTINCT E.senior_manager_code),
        COUNT(DISTINCT E.manager_code), COUNT(DISTINCT E.employee_code)
FROM Company C
    JOIN Employee E ON E.company_code = C.company_code
GROUP BY C.company_code, C.founder
ORDER BY C.company_code;


/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Redundant Joins & Optimization:
    There are two solutions. You can solve joined 5 tables.
    However, looking at the schema, the 'Employee' table acts as a 'Fact Table' containing Foreign Keys
    for all management levels ('lead_manager_code', 'senior_manager_code', etc.)
    Therefore we can skip the intermediate tables and join 'Company' directly to 'Employee'.
    This reduces query complexity from 4 JOINs to 1 JOIN, significantly improving performance on large datasets.

2. "Natural Sort" of Alphanumeric Data:
    The task asks to sort by 'company_code' (String: C1, C10, C2).
    Standard string sorting results in: C1, C10, C2.
    To achieve "Natural Sort" (C1, C2, C10), we would extract the numeric part:

    'ORDER BY CAST(REPLACE(company_code, "C", '') AS INT)'

    This removes the prefix and converts the remainder to an Integer for proper numerical sorting.
*/