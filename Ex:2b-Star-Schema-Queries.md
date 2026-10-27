# Exercise 2(b) --- Star Schema Analytical Queries

## Aim
Write and execute SQL queries on the implemented retail star schema to calculate total sales revenue based on product categories, customer demographics, geographical regions, and time periods.

## Environment
``` text
Database : Relational DB (SQL)
Schema   : Star Schema (Implemented in Ex 2a)
Directory: ~/Desktop/lab/Retail_Star_Schema
```

------------------------------------------------------------------------

## 1. Analytical Queries Implementation
To extract business intelligence, we perform joins between the `Fact_Sales` table and the respective dimension tables.

``` sql
-- Total Revenue by Product Category
SELECT p.Category, SUM(f.TotalRevenue) as TotalRevenue
FROM Fact_Sales f
JOIN Dim_Product p ON f.ProductID = p.ProductID
GROUP BY p.Category;
```

------------------------------------------------------------------------

## 2. How to Run
To execute these analytical queries against the database created in Ex 2a:

``` bash
# 1. Navigate to the schema directory
cd ~/Desktop/lab/Retail_Star_Schema

# 2. Run the queries using the sqlite3 CLI
sqlite3 retail_sales.db < retail_star_schema.sql
```
*(Note: The `retail_star_schema.sql` file contains both the table creation and the analysis queries at the end).*

------------------------------------------------------------------------

## 3. Execution Results
Based on the sample data:
- **Top Category**: Electronics ($4,000)
- **Top Region**: Europe ($2,800)

------------------------------------------------------------------------

# Result
The analytical queries were successfully implemented and executed. The star schema design enabled efficient aggregation of sales revenue across multiple business dimensions.
