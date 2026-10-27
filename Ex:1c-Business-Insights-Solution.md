# Exercise 1(c) --- Big Data Solution for Business Insights

## Aim
Design and implement a big data solution to analyze sales performance, identify business trends, and generate actionable insights to improve business decisions.

## Environment
``` text
OS       : Ubuntu 24.04 LTS
Language : Python 3.14
Library  : Pandas
Dataset  : E-commerce Sales (CSV)
Directory: ~/Desktop/lab/Ecommerce_Sales_Analysis
```

------------------------------------------------------------------------

## 1. Solution Design
The solution follows a three-tier pipeline:
1. **Ingestion**: Loading raw CSV transaction data.
2. **Processing**: Calculating derived metrics (Revenue) and aggregating by dimensions (Product, Region).
3. **Insight Generation**: Applying business logic to the aggregated data to derive strategic recommendations.

------------------------------------------------------------------------

## 2. How to Run
To generate the business insights from the data:

``` bash
# 1. Navigate to the project directory
cd ~/Desktop/lab/Ecommerce_Sales_Analysis

# 2. Run the analysis script using the virtual environment
./venv/bin/python3 sales_analysis.py
```

------------------------------------------------------------------------

## 3. Implementation & Insights
The script identifies the top-performing dimensions and translates them into business actions.

``` python
# Logic for 1(c)
top_product = product_revenue.index[0]
top_region = region_sales.index[0]
# Insight: 'Laptop' is primary driver -> Focus marketing here.
# Insight: 'West' region highest sales -> Scale operations here.
```

### Final Actionable Insights
- **Inventory Insight**: Laptops drive the majority of the revenue; priority should be given to high-end electronic stock.
- **Market Insight**: The West region shows the highest demand; expanding logistics in the West would optimize delivery.
- **Customer Insight**: A small group of loyal customers (C101-C103) suggest a potential for a loyalty program.

------------------------------------------------------------------------

# Result
A complete big data analysis solution was implemented. By transforming raw transaction data into structured aggregates, the system generated actionable insights regarding product focus and regional expansion.
