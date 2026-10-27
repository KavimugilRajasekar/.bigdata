# Exercise 1(a) --- Sales Trends and Pattern Identification

## Aim
Using the given e-commerce sales dataset, analyze sales transactions using big data technologies to identify sales trends, best-selling products, and customer purchasing patterns.

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
The analysis is performed using a Python script that groups data by product and customer to find volume trends and purchase frequency.

``` python
# Logic for 1(a)
# Best selling products by quantity
best_selling = df.groupby('ProductName')['Quantity'].sum().sort_values(ascending=False)
# Customer purchasing pattern (Frequency)
customer_patterns = df['CustomerID'].value_counts()
```

------------------------------------------------------------------------

## 2. How to Run
To execute this analysis, run the following commands in your terminal:

``` bash
# 1. Navigate to the project directory
cd ~/Desktop/lab/Ecommerce_Sales_Analysis

# 2. Run the analysis script using the virtual environment
./venv/bin/python3 sales_analysis.py
```

------------------------------------------------------------------------

## 3. Execution and Results

### Results
**Best Selling Products (by Quantity):**
- Mouse: 6 units
- Laptop: 4 units
- Chair: 3 units

**Customer Purchasing Patterns (Top Frequency):**
- Customer C101: 3 orders
- Customer C102: 3 orders
- Customer C103: 3 orders

------------------------------------------------------------------------

# Result
The sales transactions were successfully analyzed. The trends reveal that while high-value items generate revenue, low-cost accessories like the 'Mouse' are the most frequently sold products. Top customers were identified based on order frequency.
