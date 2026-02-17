/*
Problem: Weather Observation Station 3
Link: https://www.hackerrank.com/challenges/weather-observation-station-3/problem
Difficulty: Basic
Score: 10/10

Description:
Query a list of CITY names from STATION for cities that have an even ID number. 
Print the results in any order, but exclude duplicates from the answer.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT DISTINCT CITY
FROM STATION
WHERE ID % 2 = 0;


/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Modulo Operator & SARGability:
    The condition 'ID % 2 = 0' is technically Non-SARBability because it performs an arithmetic operation
    on the column before filtering. The database engine must evaluate the expression for every row  (Scan)
    rather than seeking a specific value in the index.
    However, for checking parity (even/odd), this is the standard approach.

2. Bitwise Alternative (For High Performance contexts):
    An alternative is using bitwise operators: 'WHERE (ID & 1) = 0'.
    In some low-level environments, checking the last bit is computationally cheap than
    the division operation required by modulo, thoug modern SQL optimizers handle both efficiently.

3. DISTINCT vs GROUP BY:
    'SELECT DISTINCT' performs a sort or hash operation to remove duplicates.
    Ideally, if we knew the data model enforced unique cities for even IDs, we could skip it,
    but adhering to the requirements is key.
*/