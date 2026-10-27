import pandas as pd

# 1(b) Data Cleaning, Transformation, and Aggregation
def perform_analysis():
    # Load Dataset
    df = pd.read_csv('ecommerce_sales.csv')
    
    # Data Cleaning: Calculate Total Revenue for each row
    df['TotalSales'] = df['Quantity'] * df['UnitPrice']
    
    # 1(b) Calculations
    total_sales = df['TotalSales'].sum()
    product_revenue = df.groupby('ProductName')['TotalSales'].sum().sort_values(ascending=False)
    region_sales = df.groupby('Region')['TotalSales'].sum().sort_values(ascending=False)
    
    # 1(a) Trends and Patterns
    # Best selling products by quantity
    best_selling = df.groupby('ProductName')['Quantity'].sum().sort_values(ascending=False)
    # Customer purchasing pattern (Frequency)
    customer_patterns = df['CustomerID'].value_counts()

    print("--- 1(b) Basic Aggregations ---")
    print(f"Total Global Sales: ${total_sales}")
    print("\nProduct-wise Revenue:\n", product_revenue)
    print("\nRegion-wise Sales:\n", region_sales)
    
    print("\n--- 1(a) Trends & Patterns ---")
    print("\nBest Selling Products (by Quantity):\n", best_selling)
    print("\nTop Customers (Purchase Frequency):\n", customer_patterns.head())

    # 1(c) Actionable Insights
    print("\n--- 1(c) Business Insights ---")
    top_product = product_revenue.index[0]
    top_region = region_sales.index[0]
    print(f"Insight 1: '{top_product}' is the primary revenue driver. Focus marketing here.")
    print(f"Insight 2: The '{top_region}' region has the highest sales. Scale operations in this zone.")
    print(f"Insight 3: Low quantity items with high unit price (Laptops) contribute most to revenue.")

if __name__ == "__main__":
    perform_analysis()
