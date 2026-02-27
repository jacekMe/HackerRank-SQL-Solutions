/*
Problem: Symmetric Pairs
Link: https://www.hackerrank.com/challenges/symmetric-pairs/problem
Difficulty: Intermediate
Score: 10/10

Description:
Two pairs (X1, Y1) and (X2, Y2) are symmetric if X1 = Y2 and X2 = Y1.
Write a query to output all such symmetric pairs in ascending order by the value of X. 
List the rows such that X1 <= Y1.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT F1.X, F1.Y
FROM Functions F1
    JOIN Functions F2 ON F1.X = F2.Y AND F1.Y = F2.X
WHERE F1.X <= F1.Y
GROUP BY F1.X, F1.Y
HAVING COUNT(*) > 1 OR F1.X < F1.Y
ORDER BY F1.X ASC;

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Real-World Application (Bidirectional Relationships):
    This seemingly abstract mathematical represents a common business pattern.
    Examples include finding "Mutual Friends" in social networks (A follows B, B follows A),
    identifying "Round Trips" in logistics (City A to B, and City B to A), or spotting 
    potential chargebacks/reversals in financial transactions.

2. The "Mirror" Edge Case (Why GROUP BY & HAVING are required):
    A basic Self-Join easily finds pairs like (20,21) matching with (21,20). However,
    it fails on identical pairs like (20,20). Without grouping, the Self-Join will join
    a single (20,20) row with ITSELF, incorrectly identifying it as a pair.

    The logic 'HAVING COUNT(*) > 1 OR F1.X < F1.Y' elegantly solve this:
        - 'F1.X < F1.Y': handles standard pair (we only keep the one where X is smaller).
        - 'COUNT(*) > 1': handles the (20,20) edge case. It ensures that identical pairs
        are only output if they physically exist more than once in the original dataset.
 
*/