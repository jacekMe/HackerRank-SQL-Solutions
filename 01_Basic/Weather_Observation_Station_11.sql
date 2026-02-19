/*
Problem: Weather Observation Station 11
Link: https://www.hackerrank.com/challenges/weather-observation-station-11/problem
Difficulty: Basic
Score: 10/10

Description:
Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels.
Your result cannot contain duplicates.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT LIKE '[AEIOU]%[aeiou]'
ORDER BY CITY


/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Applied Logic (De Morgan's Laws):
    The problem requests an 'OR' condition: "not start with vowels OR not end with vowels".
    You can write this verbosely as:

    `WHERE CITY NOT LIKE '[AEIOU]%' OR CITY NOT LIKE '%[aeiou]'`

    However, according to De Morgan's laws in boolean logic: 

    NOT (A AND B) == (NOT A) OR (NOT B).

    The query `NOT LIKE '[AEIOU]%[aeiou]'` efficiently negates the "starts AND ends with a vowel"
    condition, perfectly satisfying the requirement in a single, highly readable line of code.

*/