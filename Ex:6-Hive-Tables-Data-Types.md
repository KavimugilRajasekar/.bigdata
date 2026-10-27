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

## 2. Data Loading (6b)
Data was loaded into the tables from the local file system. In a production Hive environment, the command used is:
``` bash
LOAD DATA LOCAL INPATH '/home/kavimugil-r/Desktop/lab/Hive_DataTypes/emp_complex.txt' INTO TABLE employee_complex;
```

---

## 3. HiveQL Querying (6c)
To retrieve data from complex types, specific HiveQL syntax is used:

### 3.1 Accessing ARRAY Elements
Using index-based access to get the first skill:
``` sql
SELECT emp_name, skills[0] FROM employee_complex;
```

### 3.2 Accessing MAP Values
Using the key to extract the bonus amount:
``` sql
SELECT emp_name, salary_details['bonus'] FROM employee_complex;
```

### 3.3 Accessing STRUCT Fields
Using dot notation to access the city:
``` sql
SELECT emp_name, address.city FROM employee_complex;
```

### 3.4 Flattening Arrays (EXPLODE)
To convert an array into multiple rows, the `EXPLODE` function is used with `LATERAL VIEW`:
``` sql
SELECT emp_name, skill FROM employee_complex LATERAL VIEW explode(skills) exploded_table AS skill;
```

------------------------------------------------------------------------

# Result
Hive tables were successfully created using both primitive and collection data types. The implementation demonstrated how `ARRAY`, `MAP`, and `STRUCT` can be used to store multi-valued attributes. Data retrieval was verified using index access, key-value lookups, and the `EXPLODE` function.
