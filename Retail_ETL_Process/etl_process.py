import pandas as pd
import sqlite3
import os

def run_etl():
    print("--- Starting ETL Process ---")
    
    # 1. EXTRACT
    print("[1/3] Extracting data from source...")
    # Simulating a source database by creating a raw CSV
    source_data = {
        'transaction_id': [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
        'cust_id': [501, 502, 503, 501, 504, 502, 501, 501, 503, 501],
        'prod_id': [101, 102, 103, 101, 104, 102, 101, 101, 103, 101],
        'amount': [1200, 800, 150, 1200, 60, 800, 1200, None, 150, 1200], # Added None for cleaning check
        'date': ['2023-01-01', '2023-01-02', '2023-01-03', '2023-01-01', '2023-01-04', '2023-01-05', '2023-01-06', '2023-01-07', '2023-01-08', '2023-01-09'],
        'category': ['Electronics', 'Electronics', 'Furniture', 'Electronics', 'Appliances', 'Electronics', 'Electronics', 'Electronics', 'Furniture', 'Electronics'],
        'region': ['North', 'South', 'East', 'North', 'West', 'South', 'North', 'North', 'East', 'North']
    }
    df_source = pd.DataFrame(source_data)
    
    # Introduce a duplicate record for 3(b)
    df_source = pd.concat([df_source, df_source.iloc[[0]]], ignore_index=True)
    
    # 2. TRANSFORM (3b - Data Quality Checks)
    print("[2/3] Transforming data and performing quality checks...")
    
    # Check for missing values
    missing_count = df_source['amount'].isnull().sum()
    print(f"Found {missing_count} missing values in 'amount'. Filling with median...")
    df_source['amount'] = df_source['amount'].fillna(df_source['amount'].median())
    
    # Check for duplicates
    duplicate_count = df_source.duplicated().sum()
    print(f"Found {duplicate_count} duplicate records. Removing duplicates...")
    df_source = df_source.drop_duplicates()
    
    # Aggregation: Calculate total revenue by category
    category_revenue = df_source.groupby('category')['amount'].sum().reset_index()
    
    # 3. LOAD
    print("[3/3] Loading data into Data Warehouse (SQLite)...")
    conn = sqlite3.connect('retail_dw.db')
    
    # Load cleaned transactions
    df_source.to_sql('Fact_Sales_Cleaned', conn, if_exists='replace', index=False)
    
    # Load aggregated category revenue
    category_revenue.to_sql('Dim_Category_Revenue', conn, if_exists='replace', index=False)
    
    conn.close()
    print("\n--- ETL Process Completed Successfully ---")

if __name__ == "__main__":
    run_etl()
