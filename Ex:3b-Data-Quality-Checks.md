# Exercise 3(b) --- Data Quality Checks and Preparation

## Aim
Perform comprehensive data quality checks to identify missing values, duplicate records, and inconsistent data, applying appropriate SQL and Python transformations to prepare the data for analysis.

## Environment
``` text
OS       : Ubuntu 24.04 LTS
Language : Python 3.14
Library  : Pandas
Directory: ~/Desktop/lab/Retail_ETL_Process
```

------------------------------------------------------------------------

## 1. Data Quality Framework
The following quality checks are implemented during the transformation phase of the ETL process:

### 1.1 Missing Value Analysis
- **Issue**: Missing values in the `amount` column can skew total revenue calculations.
- **Solution**: Identified missing values and applied **Median Imputation** to maintain the distribution without introducing outliers.

### 1.2 Duplicate Detection
- **Issue**: Duplicate transaction IDs lead to overcounting sales.
- **Solution**: Used `.duplicated()` to identify exact row copies and `.drop_duplicates()` to ensure uniqueness.

### 1.3 Consistency Checks
- **Transformation**: Standardized category names and ensured date formats are uniform for time-series analysis.

------------------------------------------------------------------------

## 2. How to Run
The quality checks are integrated into the `etl_process.py` script. Run it to see the cleaning logs:

``` bash
cd ~/Desktop/lab/Retail_ETL_Process
./venv/bin/python3 etl_process.py
```

**Expected Log Output:**
``` text
Found 1 missing values in 'amount'. Filling with median...
Found 1 duplicate records. Removing duplicates...
```

------------------------------------------------------------------------

# Result
The data quality audit was successfully performed. By resolving missing values and duplicates, the dataset's integrity was restored, providing a "Single Version of Truth" for the business analysts.
