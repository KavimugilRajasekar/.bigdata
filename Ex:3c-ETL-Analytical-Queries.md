# Exercise 3(c) --- ETL Analytical Queries

## Aim
Write and execute SQL queries on the processed data warehouse to calculate total sales revenue by product category, analyze customer demographics, and identify sales trends over time.

## Environment
``` text
Database : SQLite (retail_dw.db)
Schema   : Processed ETL Schema
Directory: ~/Desktop/lab/Retail_ETL_Process
```

------------------------------------------------------------------------

## 1. Implementation (SQL Queries)
Once the ETL process has loaded the cleaned data into `retail_dw.db`, the following queries are used for analysis:

### 1.1 Total Sales Revenue by Product Category
``` sql
SELECT category, SUM(amount) as TotalRevenue
FROM Fact_Sales_Cleaned
GROUP BY category;
```

### 1.2 Customer Demographics Analysis (Revenue by Customer)
``` sql
SELECT cust_id, SUM(amount) as CustomerSpend
FROM Fact_Sales_Cleaned
GROUP BY cust_id
ORDER BY CustomerSpend DESC;
```

### 1.3 Sales Trends Over Time
``` sql
SELECT date, SUM(amount) as DailyRevenue
FROM Fact_Sales_Cleaned
GROUP BY date
ORDER BY date ASC;
```

------------------------------------------------------------------------

## 2. How to Run
To execute these queries against the Data Warehouse:

``` bash
# 1. Navigate to the ETL directory
cd ~/Desktop/lab/Retail_ETL_Process

# 2. Run the queries using the sqlite3 CLI
sqlite3 retail_dw.db "SELECT category, SUM(amount) as TotalRevenue FROM Fact_Sales_Cleaned GROUP BY category;"
```

------------------------------------------------------------------------

# Result
The processed data warehouse was successfully queried. The results provided a clear breakdown of revenue by category and customer, and mapped the sales trend over time, confirming that the ETL process correctly prepared the data for business intelligence.
