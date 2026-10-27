import pandas as pd
import sqlite3
import os

SOURCE_CSV = 'raw_retail_sales.csv'
WAREHOUSE_DB = 'retail_warehouse.db'

def create_source_data():
    data = {
        'TransactionID': [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11],
        'Date': ['2023-01-01', '2023-01-02', '2023-01-02', '2023-01-03', '2023-01-04', 
                 '2023-01-05', '2023-01-06', '2023-01-07', '2023-01-08', '2023-01-09', '2023-01-02'],
        'CustomerID': [101, 102, 103, 101, 104, 105, 102, 106, 103, 107, 103],
        'ProductID': ['P1', 'P2', 'P3', 'P1', 'P4', 'P5', 'P1', 'P6', 'P2', 'P7', 'P3'],
        'Category': ['Electronics', 'Electronics', 'Furniture', 'Electronics', 'Furniture', 
                     'Furniture', 'Electronics', 'Furniture', 'Electronics', 'Electronics', 'Furniture'],
        'Quantity': [1, 2, 1, 1, 1, 1, 1, 2, 3, 1, 1],
        'UnitPrice': [1200, 25, 45, 1200, 150, 200, 1200, 30, 25, 800, 45],
        'Region': ['North', 'South', 'East', 'North', 'West', 'South', 'South', 'East', 'East', 'West', 'East']
    }
    df = pd.DataFrame(data)
    df.loc[4, 'Region'] = None 
    df.to_csv(SOURCE_CSV, index=False)

def run_etl():
    df = pd.read_csv(SOURCE_CSV)
    
    # 3(b) Quality Checks
    # Handle duplicates
    df = df.drop_duplicates()
    # Handle missing
    df = df.fillna('Unknown')
    # Transformation
    df['TotalRevenue'] = df['Quantity'] * df['UnitPrice']
    
    # Load into SQLite
    conn = sqlite3.connect(WAREHOUSE_DB)
    df.to_sql('fact_sales', conn, if_exists='replace', index=False)
    conn.close()

if __name__ == "__main__":
    create_source_data()
    run_etl()
