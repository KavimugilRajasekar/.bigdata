-- =============================================================================
-- EXERCISE 6: HIVE TABLES AND DATA TYPES
-- =============================================================================

-- -----------------------------------------------------------------------------
-- 6(a) Create Hive tables using primitive and collection data types
-- -----------------------------------------------------------------------------

-- 1. Table using Primitive Data Types
CREATE TABLE IF NOT EXISTS employee_primitive (
    emp_id INT,
    emp_name STRING,
    salary FLOAT,
    join_date DATE
) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY ',';

-- 2. Table using Collection Data Types (ARRAY, MAP, STRUCT)
CREATE TABLE IF NOT EXISTS employee_complex (
    emp_id INT,
    emp_name STRING,
    skills ARRAY<STRING>,          -- Collection: ARRAY
    salary_details MAP<STRING, FLOAT>, -- Collection: MAP
    address STRUCT<city:STRING, zip:INT, state:STRING> -- Collection: STRUCT
) 
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ',' 
COLLECTION ITEMS TERMINATED BY '|' 
MAP KEYS TERMINATED BY ':';

-- -----------------------------------------------------------------------------
-- 6(b) Load the sample dataset into Hive tables
-- -----------------------------------------------------------------------------

-- Creating a local sample file for the complex table
-- Format: id, name, skill1|skill2, key1:val1|key2:val2, city:zip:state
-- Note: In real Hive, we use LOAD DATA LOCAL INPATH
-- LOAD DATA LOCAL INPATH '/home/kavimugil-r/Desktop/lab/Hive_DataTypes/emp_complex.txt' INTO TABLE employee_complex;

-- Simulated Data Insertion
INSERT INTO TABLE employee_primitive VALUES 
(101, 'Alice', 75000.0, '2022-01-10'),
(102, 'Bob', 82000.0, '2021-06-15');

INSERT INTO TABLE employee_complex VALUES 
(101, 'Alice', array('Java', 'Scala', 'Hive'), map('base', 60000.0, 'bonus', 15000.0), named_struct('New York', 10001, 'NY')),
(102, 'Bob', array('Python', 'Spark', 'SQL'), map('base', 70000.0, 'bonus', 12000.0), named_struct('London', 2000, 'UK'));

-- -----------------------------------------------------------------------------
-- 6(c) HiveQL Queries to access records and collection types
-- -----------------------------------------------------------------------------

-- Query 1: Accessing a specific index in an ARRAY
SELECT emp_name, skills[0] as primary_skill 
FROM employee_complex 
WHERE emp_id = 101;

-- Query 2: Accessing a value in a MAP using a key
SELECT emp_name, salary_details['bonus'] as bonus_amount 
FROM employee_complex 
WHERE emp_id = 102;

-- Query 3: Accessing a field in a STRUCT
SELECT emp_name, address.city as city_location 
FROM employee_complex 
WHERE emp_id = 101;

-- Query 4: Using EXPLODE to flatten an ARRAY
SELECT emp_name, skill 
FROM employee_complex 
LATERAL VIEW explode(skills) exploded_table AS skill;
