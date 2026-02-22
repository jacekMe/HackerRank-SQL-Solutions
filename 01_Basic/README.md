# Basic SQL Challenges

| Task Name | Solution Link | Key Concepts |
| :--- | :--- | :--- |
| Revising the Select Query I | [Solution](./Revising_the_Select_Query_I.sql) | `WHERE`, `Filtering`, SARGable Queries |
| Revising the Select Query II | [Solution](./Revising_the_Select_Query_II.sql) | **Covering Index**, Index Seek |
| Select All | [Solution](./Select_All.sql) | Anti-Pattern `SELECT *`, Network Overhead |
| Select By ID | [Solution](./Select_By_ID.sql) | **Clustered Index Seek**, Primary Key Performance |
| Japanese Cities' Attributes | [Solution](./Japanese_Cities_Attributes.sql) | **Cardinality**, Selectivity, Optimizer Statistics |
| Japanese Cities' Names | [Solution](./Japanese_Cities_Names.sql) | **Key Lookup** costs, Heap vs Index |
| Weather Observation Station 1 | [Solution](./Weather_Observation_Station_1.sql) | Column Projection, Data Retrieval |
| Weather Observation Station 3 | [Solution](./Weather_Observation_Station_3.sql) | Modulo Operator (`%`), **Bitwise Optimization**, `DISTINCT` |
| Weather Observation Station 4 | [Solution](./Weather_Observation_Station_4.sql) | `COUNT` vs `COUNT(DISTINCT)`, **NULL Handling** in Aggregations |
| Weather Observation Station 6 | [Solution](./Weather_Observation_Station_6.sql) | **Pattern Matching** `[]`, Maintainability, SARGability |
| Weather Observation Station 7 | [Solution](./Weather_Observation_Station_7.sql) | Trailing Wildcards, Clean Code |
| Weather Observation Station 8 | [Solution](./Weather_Observation_Station_8.sql) | **Complex Pattern Combination**, Reducing Technical Debt |
| Weather Observation Station 9 | [Solution](./Weather_Observation_Station_9.sql) | Negation (`NOT LIKE`), **Index Scan** vs Seek |
| Weather Observation Station 10 | [Solution](./Weather_Observation_Station_10.sql) | Trailing Negation |
| Weather Observation Station 11 | [Solution](./Weather_Observation_Station_11.sql) | Boolean Logic Optimization, **De Morgan's Laws** |
| Weather Observation Station 12 | [Solution](./Weather_Observation_Station_12.sql) | Negation `AND`, The Caret `[^...]` operator |
| Higher Than 75 Marks | [Solution](./Higher_Than_75_Marks.sql) | `ORDER BY` Functions, **Sort Penalty**, Computed Columns |
| Employee Names | [Solution](./Employee_Names.sql) | Implicit Sorting, **Collation Settings** (CI/CS) |
| Revising Aggregations - The Count Function | [Solution](./Revising_Aggregations_The_Count_Function.sql) | `COUNT(*)` vs `COUNT(Col)` |
| Revising Aggregations - The Sum Function | [Solution](./Revising_Aggregations_The_Sum_Function.sql) | `SUM()`, **Arithmetic Overflow** prevention |
| Revising Aggregations - Averages | [Solution](./Revising_Aggregations_Averages.sql) | `AVG()`, **Integer Division Trap**, Implicti Conversion `* 1.0` |
| Average Population | [Solution](./Average_Population.sql) | `FLOOR()`, Implicit vs Explicit behavior |
| Japan Population | [Solution](./Japan_Population.sql) | `WHERE` before `SELECT` |
| Population Denisty Difference | [Solution](./Population_Denisty_Difference.sql) | `MAX() - MIN()`, **Index Min/Max Optimization** (B-Tree) |
| The Blunder | [Solution](./The_Blunder.sql) | `CEILING()`, `REPLACE()`, Distributed Math Aggregation |
| Top Earners | [Solution](./Top_Earners.sql) | **Grouping by Expressions**, `TOP ` optimization |
| Weather Observation Station 2 | [Solution](./Weather_Observation_Station_2.sql) | `DECIMAL(p, s)` Precision & Scale |