/*
Problem: Weather Observation Station 12
Link: https://www.hackerrank.com/challenges/weather-observation-station-12/problem
Difficulty: Basic
Score: 10/10

Description:
Query the list of CITY names from STATION that do not start with vowels and do not end with vowels.
Your result cannot contain duplicates.

Environment: T-SQL
*/

/*
    --- SOLUTION 1 USING AND ---
*/
SET NOCOUNT ON;

SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT LIKE '[AEIOU]%' AND CITY NOT LIKE '%[aeiou]'
ORDER BY CITY;

/*
    --- SOLUTION 2 USING THE CARET '^' OPERATOR ---

SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE '[^AEIOU]%[^aeiou]'
ORDER BY CITY;
*/  

/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. Alternative Pattern Matching (The Caret '^' Operator):
    In T-SQL, you can negate a specific character class using the caret symbol '^' inside brackets.
    An alternative, highly concise way to write this is:

    WHERE CITY LIKE '[^AEIOU]%[^aeiou]'

    This transaltes to: 
    "Starts with any character EXECPT A,E,I,O,U followed by anything (%), ending with any character EXCEPT a,e,i,o,u."

*/