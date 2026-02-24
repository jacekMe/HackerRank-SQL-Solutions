/*
Problem: The PADS
Link: https://www.hackerrank.com/challenges/the-pads/problem
Difficulty: Basic
Score: 10/10

Description:
Generate the following two result sets:

1. Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed 
    by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). 
    For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
2. Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences 
    in ascending order, and output them in the following format:

    There are a total of [occupation_count] [occupation]s.
    
    where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and
    [occupation] is the lowercase occupation name. If more than one Occupation has the same 
    [occupation_count], they should be ordered alphabetically.


Environment: T-SQL
*/

SET NOCOUNT ON;

/*
    --- Query 1: Detailed rows (String formatting) ---
*/

SELECT CONCAT(Name, '(', LEFT(Occupation, 1), ')')
FROM OCCUPATIONS
ORDER BY Name;

/*
    --- Query 2: Aggregated summary rows ---
*/

SELECT CONCAT('There are a total of ', COUNT(Occupation), ' ', LOWER(Occupation), 's.')
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY COUNT(Occupation), Occupation;

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Single vs Multiple Queries (Granularity):
    While it is technically possible to combine these two results into a single query 
    using 'UNION ALL', it is considered an anti-pattern. The two queries have different
    levels of granularity (row-level details vs. grouped aggregates). Returning them
    as separate datasets adheres to the 'Separation of Concerns' principle, allowing
    the front-end application to handle them appropriately.

2. CONCAT vs '+' Operator:
    Using the 'CONCAT()' function is best practice in modern T-SQL compared to the
    '+' operator. 'CONCAT()' automatically handles NULL values by converting them
    to empty strings, whereas 'String' + NULL would yield NULL, potentially 
    breaking the output.

*/