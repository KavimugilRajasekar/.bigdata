# Exercise 7 --- HiveQL Queries, Partitioning, and Bucketing

## Aim
Implement advanced HiveQL queries including filtering, sorting, grouping, and joining. Further, optimize data retrieval by implementing Partitioning and Bucketing techniques and compare their performance.

## Environment
``` text
OS       : Ubuntu 24.04 LTS
Framework: Apache Hive
Language : HiveQL
Directory: ~/Desktop/lab/Hive_Optimizations
```

------------------------------------------------------------------------

## 1. Data Analysis with HiveQL (7a)
Basic data manipulation was performed using the `sales_raw` and `products` tables.

**Analytical Query:**
To find the top-performing categories with high-value transactions:
``` sql
SELECT p.category, SUM(s.amount) as total_revenue
FROM sales_raw s
JOIN products p ON s.prod_id = p.prod_id
WHERE s.amount > 100
GROUP BY p.category
ORDER BY total_revenue DESC;
```

------------------------------------------------------------------------

## 2. Data Optimization Techniques (7b)

### 2.1 Partitioning
Partitioning is used to divide the table into parts based on a column (e.g., `region`). This creates separate directories for each partition value.

**Implementation:**
``` sql
CREATE TABLE sales_partitioned (
    transaction_id INT,
    prod_id INT,
    cust_id INT,
    amount FLOAT,
    sale_date DATE
) PARTITIONED BY (region STRING, category STRING);
```

### 2.2 Bucketing
Bucketing (Clustering) organizes data into a fixed number of files (buckets) based on a hash of a column (e.g., `cust_id`).

