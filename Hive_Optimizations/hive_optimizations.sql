-- =============================================================================
-- EXERCISE 7: HIVEQL QUERIES, PARTITIONING, AND BUCKETING
-- =============================================================================

-- -----------------------------------------------------------------------------
-- 7(a) Basic HiveQL Queries: Filter, Sort, Group, Join
-- -----------------------------------------------------------------------------

-- Create source tables for analysis
CREATE TABLE IF NOT EXISTS sales_raw (
    transaction_id INT,
    prod_id INT,
    cust_id INT,
    amount FLOAT,
    category STRING,
    region STRING,
    sale_date DATE
) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',';

CREATE TABLE IF NOT EXISTS products (
    prod_id INT,
    prod_name STRING,
    category STRING
) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',';

-- Query: Filter, Sort, Group, and Join
-- Goal: Find total revenue per category for sales above 100, sorted by revenue
SELECT p.category, SUM(s.amount) as total_revenue
FROM sales_raw s
JOIN products p ON s.prod_id = p.prod_id
WHERE s.amount > 100
GROUP BY p.category
ORDER BY total_revenue DESC;

-- -----------------------------------------------------------------------------
-- 7(b) Partitioning and Bucketing
-- -----------------------------------------------------------------------------

-- 1. Partitioned Table (by Region)
-- Partitioning physically divides data into folders based on the partition column.
CREATE TABLE IF NOT EXISTS sales_partitioned (
    transaction_id INT,
    prod_id INT,
    cust_id INT,
    amount FLOAT,
    sale_date DATE
) 
PARTITIONED BY (region STRING, category STRING);

-- Loading data into a specific partition
LOAD DATA LOCAL INPATH '/home/kavimugil-r/Desktop/lab/Hive_Optimizations/north_electronics.csv' 
INTO TABLE sales_partitioned PARTITION (region='North', category='Electronics');

-- 2. Bucketed Table (by Customer ID)
-- Bucketing divides data into a fixed number of files (buckets) using a hash function.
CREATE TABLE IF NOT EXISTS sales_bucketed (
    transaction_id INT,
    prod_id INT,
    cust_id INT,
    amount FLOAT,
    sale_date DATE
) 
CLUSTERED BY (cust_id) INTO 4 BUCKETS
STORED AS ORC;

-- Inserting data from the raw table into the bucketed table
SET hive.enforce.bucketing = true;
INSERT OVERWRITE TABLE sales_bucketed 
SELECT transaction_id, prod_id, cust_id, amount, sale_date 
FROM sales_raw;

-- -----------------------------------------------------------------------------
-- 7(c) Comparison and Performance Analysis
-- -----------------------------------------------------------------------------

-- Query on Original Table (Full Table Scan)
SELECT * FROM sales_raw WHERE region = 'North' AND category = 'Electronics';

-- Query on Partitioned Table (Partition Pruning)
-- Hive only reads the folder: /user/hive/warehouse/sales_partitioned/region=North/category=Electronics/
SELECT * FROM sales_partitioned WHERE region = 'North' AND category = 'Electronics';

-- Query on Bucketed Table (Bucket Pruning)
-- Hive only reads the buckets that could contain the specific cust_id
SELECT * FROM sales_bucketed WHERE cust_id = 501;
