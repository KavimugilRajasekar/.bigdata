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
