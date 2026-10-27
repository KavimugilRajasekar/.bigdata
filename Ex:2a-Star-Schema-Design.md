# Exercise 2(a) --- Star Schema Design for Retail Sales

## Aim
Design a star schema for a data warehouse to manage retail sales data and implement the fact and dimension tables in a relational database.

## Environment
``` text
Database : SQLite / MySQL / PostgreSQL
Schema   : Star Schema
Tables   : 1 Fact Table, 4 Dimension Tables
Directory: ~/Desktop/lab/Retail_Star_Schema
```

------------------------------------------------------------------------

## 1. Star Schema Design
A **Star Schema** consists of a central fact table connected to multiple dimension tables.

### Dimension Tables
- **Dim_Product**: Product details.
- **Dim_Customer**: Customer demographics.
- **Dim_Store**: Store location.
- **Dim_Time**: Date hierarchies.

### Fact Table
- **Fact_Sales**: Quantitative metrics and foreign keys.

------------------------------------------------------------------------

## 2. How to Run
To implement the schema in a SQL database (example using SQLite):

``` bash
# 1. Navigate to the schema directory
cd ~/Desktop/lab/Retail_Star_Schema

# 2. Run the SQL script using sqlite3 (or your preferred SQL client)
sqlite3 retail_sales.db < retail_star_schema.sql
```

------------------------------------------------------------------------

## 3. Implementation (SQL)
``` sql
-- Sales Fact Table
CREATE TABLE Fact_Sales (
    SalesID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    StoreID INT,
    TimeKey INT,
    Quantity INT,
    TotalRevenue DECIMAL(15, 2),
    FOREIGN KEY (ProductID) REFERENCES Dim_Product(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Dim_Customer(CustomerID),
    FOREIGN KEY (StoreID) REFERENCES Dim_Store(StoreID),
    FOREIGN KEY (TimeKey) REFERENCES Dim_Time(TimeKey)
);
```

------------------------------------------------------------------------

# Result
A professional Star Schema for retail sales was successfully designed and implemented. The structure ensures high query performance for analytical workloads (OLAP).
