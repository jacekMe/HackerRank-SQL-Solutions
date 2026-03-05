# Intermediate SQL Challenges

This section focuses on more complex queries involving Aggregations, Joins, and handling specific sorting criteria (tie-breakers).

| Task Name | Solution Link | Key Concepts |
| :--- | :--- | :--- |
| Weather Observation Station 5 | [Solution](./Weather_Observation_Station_5.sql) | `TOP`, `LEN`, `UNION ALL`, Sorting with tiebreakers |
| Binary Tree Nodes | [Solution](./Binary_Tree_Nodes.sql) | `CASE`, `IN` vs `NOT IN` trap, Handling **NULLs** in Subqueries |
| New Companies | [Solution](./New_Companies.sql) | `COUNT(DISTINCT)`, **Redundant Joins**, **Natural Sort** (Alphanumeric) |
| Weather Observation Station 20 | [Solution](./Weather_Observation_Station_20.sql) | **Window Functions**, `PERCENTILE_CONT`, Median Calculation, `TOP 1` vs `DISTINCT` |
| SQL Project Planning | [Solution](./SQL_Project_Planning.sql) | **Gaps and Island**, Anti-Join, Date Math, Window Functions |
| The Report | [Solution](./The_Report.sql) | **Non-Equi Joins** (`BETWEEN`), `CASE` expressions |
| Top Competitors | [Solution](./Top_Competitors.sql) | Multi-Table Joins, Schema Navigation |
| Ollivander's Inventory | [Solution](./Ollivanders_Inventory.sql) | **Correlated Subqueries**, Contextual Minimus |
| Challenges | [Solution](./Challenges.sql) | **Advanced CTEs**, Multi-step filtering |
| Contest Leaderboard | [Solution](./Contest_Leaderboard.sql) | Pre-Aggregation, `HAVING` clause |
| Occupations | [Solution](./Occupations.sql) | **Conditional Aggregation**, Cross-DB Pivoting, `ROW_NUMBER()` |
| Placements | [Solution](./Placements.sql) | **Multiple Instance Joins**, Relationship mapping (Self-Join logic) |
| Symmetric Pairs | [Solution](./Symmetric_Pairs.sql) | Self-Joins, **Bidirectional Relationships**, Edge Cases in Logic |
| Interviews | [Solution](./Interviews.sql) | **Cartesian Explosion prevention**, CTE Pre-Aggregation, `COALESCE` |

---

## 🏆 Section Summary: What I've Mastered in "Intermediate"

The Intermediate section transitioned my focus from simple data retrieval to complex data shaping, analytics, and architectural querying. Key milestones achieved:

* **Advanced Joins & Hierarchies:** Mastered Non-Equi Joins (`BETWEEN` in joins), Self-Joins fro graph-like relationships, and identified/prevented the dreaded "Cartesian Explosion" (Fan-out trap) using pre-aggregation techniques.
* **Window Functions:** Successfully implemented `ROW_NUMBER()` for indexing groups and `PERCENTILE_CONT()` for continuous median calculations, understanding how they differ from standard `GROUP BY` aggregates.
* **Data Reshaping (Pivoting):** Learned the ANSI-standard "Conditional Aggregation" technique (`MAX(CASE...)`) to pivot rows into columns dynamically without relying on proprietary database operators.
* **Common Table Expressions (CTEs):** Shifted from nested, hard-to-read subqueries to modular, top-to-bottom CTEs, significantly improving code readability and maintainability.
* **Complex Logic & Patterns:** Handled bidirectional relationships and solved the famous "Gaps and Islands" problem using both Anti-Joins and Window Function offsets.

**Next Step:** Tackling the ultimate `03_Advanced` section to master Recursive CTEs and complex optimization puzzles!