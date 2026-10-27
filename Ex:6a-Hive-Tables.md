# Exercise 6 --- Hive Tables and Data Types

## Aim
Create Hive tables using both primitive and collection data types (ARRAY, MAP, and STRUCT), load sample datasets, and execute HiveQL queries to manipulate and retrieve data from these complex types.

## Environment
``` text
OS       : Ubuntu 24.04 LTS
Framework: Apache Hive
Language : HiveQL
Directory: ~/Desktop/lab/Hive_DataTypes
```

------------------------------------------------------------------------

## 1. Table Implementation (6a)
Hive provides complex data types to handle semi-structured data. In this exercise, we implemented two types of tables.

### 1.1 Primitive Table
A standard table using basic types: `INT`, `STRING`, `FLOAT`, and `DATE`.
``` sql
CREATE TABLE employee_primitive (
    emp_id INT,
    emp_name STRING,
    salary FLOAT,
    join_date DATE
) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',';
```

### 1.2 Complex Table
A table utilizing collection data types to store multiple values in a single column.
- **ARRAY**: Used for `skills` (list of skills).
- **MAP**: Used for `salary_details` (Key-Value pairs for base and bonus).
- **STRUCT**: Used for `address` (Grouped fields for city, zip, and state).

``` sql
CREATE TABLE employee_complex (
    emp_id INT,
    emp_name STRING,
    skills ARRAY<STRING>,
    salary_details MAP<STRING, FLOAT>,
    address STRUCT<city:STRING, zip:INT, state:STRING>
) ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY ',' 
  COLLECTION ITEMS TERMINATED BY '|' 
  MAP KEYS TERMINATED BY ':';
```

------------------------------------------------------------------------

