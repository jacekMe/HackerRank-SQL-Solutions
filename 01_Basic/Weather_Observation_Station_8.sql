/*
Problem: Weather Observation Station 8
Link: https://www.hackerrank.com/challenges/weather-observation-station-8/problem
Difficulty: Basic
Score: 10/10

Description:
Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters.
Your result cannot contain duplicates.

Environment: T-SQL
*/

SET NOCOUNT ON;

SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE '[AEIOU]%[aeiou]'
ORDER BY CITY


/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Combining Patterns:
    T-SQL allows combining wildcards.
    - '[AEIOU]' matches the first character against the set.
    - '%' matches any string of any length in the middle
    - '[aeiou]' matches the last character against the set.

    This single line replaces a complex combination of 10-25 lines of 'OR/AND' logic.

2. Business Value of Clean Code:
    Writing concise logic reduces the "Cognitive Load" for other developers reviewing this code.
    It explicitly states the business rule ("Starts and ends with vowel") rather than listing
    every possible permutation.
*/