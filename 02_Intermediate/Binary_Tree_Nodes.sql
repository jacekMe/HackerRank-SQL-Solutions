/*
Problem: Binary Tree Nodes
Link: https://www.hackerrank.com/challenges/binary-search-tree-1/problem
Difficulty: Intermediate
Score: 10/10

Description:
You are given a table, BST, containing two columns: N (Node) and P (Parent).
Find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:
- Root: If node is root node.
- Leaf: If node is leaf node.
- Inner: If node is neither root nor leaf node.

Environment: T-SQL
*/


SET NOCOUNT ON;

SELECT N, 
       CASE WHEN P IS NULL THEN 'Root' -- Identity Root: has no parent
            WHEN N IN (SELECT DISTINCT P FROM BST) THEN 'Inner' -- Identity Inner: it is a parent to someone else
            ELSE 'Leaf' -- Identity Leaf: Neither Root nor Inner
       END AS Name
FROM BST
ORDER BY N;


/*
--- ANALYSIS & OPTIMIZATION NOTES ---
1. The Logic Flow:
    We evaluate squentially:
    - If P is NULL -> It's definitely the ROOT.
    - If N is found in the column P -> It's a parent, so it's INNER (since we already ruled out Root).
    - If neither above -> It must be a LEAF.

2. The "NOT IN" Trap:
   Inocrrect way to try to define a Leaf using:
   'WHEN N NOT IN (SELECT P FROM BST) THEN 'Leaf'
   
   This FAILS and returns incorrect results. Why?
   Because the column 'P' contains a NULL value (for the Root).
   In SQL, 'value NOT IN (list_with_null)' evaluates to UNKNOWN, not TRUE.
   
   Correct way to use NOT IN:
   'WHEN N NOT IN (SELECT P FROM BST WHERE P IS NOT NULL)'
*/