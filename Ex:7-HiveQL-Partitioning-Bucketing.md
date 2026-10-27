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

**Implementation:**
``` sql
CREATE TABLE sales_bucketed (
    transaction_id INT,
    prod_id INT,
    cust_id INT,
    amount FLOAT,
    sale_date DATE
) CLUSTERED BY (cust_id) INTO 4 BUCKETS
STORED AS ORC;
```

------------------------------------------------------------------------

## 3. Performance Comparison (7c)

| Technique | Mechanism | Behavior | Performance Impact |
| :--- | :--- | :--- | :--- |
| **Original Table** | Full Table Scan | Reads every single row in the table. | Slowest for large datasets. |
| **Partitioning** | Partition Pruning | Reads only the specific folder matching the filter. | Drastically reduces I/O for filtered queries. |
| **Bucketing** | Bucket Pruning | Reads only the specific hash-bucket containing the ID. | Optimizes joins and point-lookups. |

**Conclusion:**
Partitioning is best for low-cardinality columns (like Region), while Bucketing is ideal for high-cardinality columns (like CustomerID) to optimize joins and avoid data skew.

------------------------------------------------------------------------

# Result
The HiveQL queries for filtering and joining were successfully implemented. The implementation of Partitioning and Bucketing demonstrated a significant reduction in data scanning, proving that optimized table structures are essential for scalable big data retrieval.
