# 🚀 SQL Portfolio (HackerRank SQL - 100% Completion)

Welcome to my SQL repository! This project contains my fully documented and optimized solutions to **every single SQL challenge** available on HackerRank.

## 🎯 Goal
I didn't just solve these puzzles to pass the tests; I treated each challenge as a real-world business requirement. This repository serves as my personal code lexicon, demonstrating mjy progression from basic data retrieval to advanced architectural querying.

## 🛠 Tech Stack & Concepts
* **Dialect:** T-SQL (Microsoft SQL Server)
* **Key Concepts:** CTEs (Common Table Expressions), Window Functions (`RANK`, `LEAD`/`LAG`), Aggregations, Subqueries.
* **Performance:** Execution plan analysis, Indexing strategies, SARGable queries.

## 📂 Repository Structure & Milestones
### 🟢 [01_Basic](./01_Basic)
*The foundation of data querying.*
* **Highlights:** SARGable `WHERE` clauses, Pattern Matching (`LIKE '[^AEIOU]%'`), De Morgan's Laws in SQL, Execution Plan Awareness, and Implicit vs. Explicit Aggregation Casts (`* 1.0`).

### 🟡 [02_Intermediate](./02_Intermediate)
*Data reshaping and analytical functions.*
* **Highlights:** Window Functions (`PERCENTILE_CONT`, `ROW_NUMBER()`), Pre-Aggregation to prevent Fan-out traps, Conditional Aggregation (`MAX(CASE...)`) as an ANSI-compliant Pivot, solving "Gaps and Islands" problems, and identifying Bidirectional Relationships.

### 🔴 [03_Advanced](./03_Advanced)
*Enterprise-grade logic and recursion.*
* **Highlights:** Recursive CTEs (Tree/Graph traversal), Complex Correlated Subqueries, overcoming `MAXRECURSION` limits, and Modular Query Design for contradictory data granularities.

## 💡 Engineering Mindset
Every `.sql` file in this repository includes an `ANALYSIS & OPTIMIZATION NOTES` block. I firmly believe that knowing *why* a query works (and how the database engine interprets it) is far more important than just getting a green checkmark. I focus heavily on:
* Readability and maintainability (Preferring CTEs over nested spaghetti subqueries).
* Performance optimization (Index Seek vs. Index Scan implications).
* Standardized formatting and table aliasing.

## 👨‍💻 Author
**Jacek Meres** - *SQL Developer & Data Analyst*
* [LinkedIn](https://www.linkedin.com/in/jacek-meres/)
* [Portfolio/CV](https://github.com/jacekMe)
