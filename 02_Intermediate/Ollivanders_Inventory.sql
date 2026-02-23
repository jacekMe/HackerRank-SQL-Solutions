/*
Problem: Ollivander's Inventory
Link: https://www.hackerrank.com/challenges/harry-potter-and-wands/problem
Difficulty: Intermediate
Score: 10/10

Description:
Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.
Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to 
buy each non-evil wand of high power and age. Write a query to print the id, age, coins_needed, and power 
of the wands that Ron's interested in, sorted in order of descending power. If more than one wand has same 
power, sort the result in order of descending age.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT w.id, wp.age, w.coins_needed, w.[power]
FROM Wands w
    JOIN Wands_Property wp ON wp.code = w.code
WHERE wp.is_evil = 0 AND
    w.coins_needed = (
        SELECT MIN(w1.coins_needed)
        FROM Wands w1
            JOIN Wands_Property wp1 ON wp1.code = w1.code
        WHERE wp.age = wp1.age AND w.[power] = w1.[power]
    )
ORDER BY w.[power] DESC, wp.age DESC;

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Correlated Subqueries:
    The 'WHERE w.coins_needed = (SELECT MIN(...)...)' block is a Correlated Subquery. Unlike a normal
    subquery that runs once, a correlated subquery executes once for 'every row' processed by the
    outer query. It filters the dataset to strictly return the minimum price for the specific 'age'
    and 'power' currently being evaluated.
*/
