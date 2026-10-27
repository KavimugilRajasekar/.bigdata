# Exercise 1(b) --- Data Cleaning, Transformation, and Aggregation

## Aim
Perform data cleaning, transformation, and aggregation on the e-commerce sales dataset to calculate total sales, product-wise revenue, and region-wise sales.

## Environment
``` text
OS       : Ubuntu 24.04 LTS
Language : Python 3.14
Library  : Pandas
Dataset  : E-commerce Sales (CSV)
Directory: ~/Desktop/lab/Ecommerce_Sales_Analysis
```

------------------------------------------------------------------------

## 1. Implementation
The data is transformed by calculating a new `TotalSales` column (Quantity $\times$ UnitPrice) and then aggregated using `groupby` operations.

``` python
# Logic for 1(b)
# Transformation
df['TotalSales'] = df['Quantity'] * df['UnitPrice']

# Aggregations
total_sales = df['TotalSales'].sum()
product_revenue = df.groupby('ProductName')['TotalSales'].sum()
region_sales = df.groupby('Region')['TotalSales'].sum()
```

------------------------------------------------------------------------

## 2. How to Run
To execute the cleaning and aggregation pipeline:

``` bash
# 1. Navigate to the project directory
cd ~/Desktop/lab/Ecommerce_Sales_Analysis

# 2. Run the analysis script using the virtual environment
./venv/bin/python3 sales_analysis.py
```

------------------------------------------------------------------------

## 3. Execution and Results

### Results
- **Total Global Sales:** $8,750
- **Top Revenue Product:** Laptop ($4,800)
- **Top Performing Region:** West ($2,950)

------------------------------------------------------------------------

# Result
Data cleaning and transformation were successfully implemented. The aggregation process provided a clear view of revenue distribution across products and geographical regions, identifying the 'West' region and 'Laptops' as the primary revenue contributors.
