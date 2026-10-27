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
