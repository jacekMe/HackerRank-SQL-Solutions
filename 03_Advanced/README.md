# Advanced SQL Challenges

This section contains solutions to the most complex SQL challenges, focusing on graph traversal, recursion, and edge-case analytical problems.

| Task Name | Solution Link | Key Concepts |
| :--- | :--- | :--- |
| Draw The Triangle 1 | [Solution](./Draw_The_Triangle_1.sql) | **Recursive CTEs**, Anchor/Recursive Members, String Replications |
| Draw The Triangle 2 | [Solution](./Draw_The_Triangle_2.sql) | Ascending Recursion |
| Print Prime Numbers | [Solution](./Print_Prime_Numbers.sql) | Set-based Math (`NOT EXISTS`), `STRING_AGG`, **`MAXRECURSION` limit bypass** |
| 15 Days of Learning SQL | [Solution](./15_Days_Of_Learning_SQL.sql) | **Modular Query Design**, Streak Analytics, Complex CTEs |

---

## 🏆 Section Summary: What I've Mastered in "Advanced"

The Advanced section pushed my SQL knowledge to the limit, transforming me from someone who writes queries to someone who engineers data architectures.
Key concepts conquered:
* **Recursive CTEs:** Mastering the equivalent of "While Loops" in SQL to generate sequences, hierarchical structures, and bypass `MAXRECURSION` limits.
* **Modular Code Architecture:** Solving enterprise-grade, contradictory logic requirements (like simultaneous streaks and daily maxes) by building isolated, readable CTE blocks and avoiding Cartesian Explosions.
* **Set-Based Mathematics:** Translating pure math (like finding Prime Numbers) into set-theory queries using Correlated Subqueries and `NOT EXISTS`.