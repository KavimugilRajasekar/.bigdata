# Exercise 3(a) --- ETL Process for Retail Sales

## Aim
Develop an ETL (Extract, Transform, Load) process to extract retail sales data from a source database, transform it for quality and consistency, and load it into a target data warehouse.

## Environment
``` text
OS       : Ubuntu 24.04 LTS
Language : Python 3.14
Library  : Pandas, SQLite3
Directory: ~/Desktop/lab/Retail_ETL_Process
```

------------------------------------------------------------------------

## 1. ETL Pipeline Design
The ETL process is designed as a sequential pipeline:

1. **Extract**: Pulls raw transaction data from a source (simulated as a raw dataframe/CSV).
2. **Transform**: Performs data cleaning, handles missing values, removes duplicates, and applies business logic (aggregations).
3. **Load**: Writes the processed and cleaned data into a structured SQLite database (`retail_dw.db`) acting as the Data Warehouse.

------------------------------------------------------------------------

## 2. How to Run
To execute the ETL pipeline:

``` bash
# 1. Navigate to the ETL directory
cd ~/Desktop/lab/Retail_ETL_Process

# 2. Run the ETL script using the virtual environment
./venv/bin/python3 etl_process.py
```

------------------------------------------------------------------------

## 3. Implementation (Python)
``` python
# Extract
df_source = pd.read_csv('source_sales.csv')

# Transform
df_source = df_source.drop_duplicates()
df_source['amount'] = df_source['amount'].fillna(df_source['amount'].median())

# Load
conn = sqlite3.connect('retail_dw.db')
df_source.to_sql('Fact_Sales_Cleaned', conn, if_exists='replace')
```

------------------------------------------------------------------------

# Result
An end-to-end ETL process was successfully developed. Raw retail data was extracted, cleaned of duplicates and nulls, and loaded into a professional Data Warehouse structure, ensuring that downstream analysis is based on high-quality data.
