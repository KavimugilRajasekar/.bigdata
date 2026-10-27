-- =============================================================================
-- STAR SCHEMA DESIGN FOR RETAIL SALES
-- =============================================================================

-- -----------------------------------------------------------------------------
-- 2(a) DESIGN AND CREATE FACT AND DIMENSION TABLES
-- -----------------------------------------------------------------------------

-- Dimension Table: Products
CREATE TABLE Dim_Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Brand VARCHAR(50),
    UnitPrice DECIMAL(10, 2)
);

-- Dimension Table: Customers
CREATE TABLE Dim_Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Gender VARCHAR(10),
    AgeGroup VARCHAR(20),
    City VARCHAR(50),
    Country VARCHAR(50)
);

-- Dimension Table: Store/Geography
CREATE TABLE Dim_Store (
    StoreID INT PRIMARY KEY,
    StoreName VARCHAR(100),
    Region VARCHAR(50),
    City VARCHAR(50),
    Country VARCHAR(50)
);

-- Dimension Table: Time
CREATE TABLE Dim_Time (
    TimeKey INT PRIMARY KEY,
    FullDate DATE,
    Day INT,
    Month INT,
    Quarter INT,
    Year INT
);

-- Fact Table: Sales
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

-- -----------------------------------------------------------------------------
-- SAMPLE DATA INSERTION
-- -----------------------------------------------------------------------------

INSERT INTO Dim_Product VALUES 
(101, 'Laptop', 'Electronics', 'Dell', 1200.00),
(102, 'Smartphone', 'Electronics', 'Apple', 800.00),
(103, 'Desk Chair', 'Furniture', 'Ikea', 150.00),
(104, 'Coffee Maker', 'Appliances', 'Philips', 60.00);

INSERT INTO Dim_Customer VALUES 
(501, 'Alice', 'Female', '25-34', 'New York', 'USA'),
(502, 'Bob', 'Male', '35-44', 'London', 'UK'),
(503, 'Charlie', 'Male', '18-24', 'Mumbai', 'India'),
(504, 'Diana', 'Female', '45-54', 'Berlin', 'Germany');

INSERT INTO Dim_Store VALUES 
(1, 'NYC Store', 'North America', 'New York', 'USA'),
(2, 'LDN Store', 'Europe', 'London', 'UK'),
(3, 'BOM Store', 'Asia', 'Mumbai', 'India');

INSERT INTO Dim_Time VALUES 
(202301, '2023-01-15', 15, 1, 1, 2023),
(202302, '2023-02-20', 20, 2, 1, 2023),
(202303, '2023-03-10', 10, 3, 1, 2023);

INSERT INTO Fact_Sales VALUES 
(1, 101, 501, 1, 202301, 1, 1200.00),
(2, 102, 502, 2, 202302, 2, 1600.00),
(3, 103, 503, 3, 202303, 1, 150.00),
(4, 101, 504, 2, 202302, 1, 1200.00),
(5, 104, 501, 1, 202301, 2, 120.00);

-- -----------------------------------------------------------------------------
-- 2(b) ANALYSIS QUERIES
-- -----------------------------------------------------------------------------

-- 1. Total Sales Revenue by Product Category
SELECT p.Category, SUM(f.TotalRevenue) as TotalRevenue
FROM Fact_Sales f
JOIN Dim_Product p ON f.ProductID = p.ProductID
GROUP BY p.Category;

-- 2. Total Sales Revenue by Customer Demographics (Age Group)
SELECT c.AgeGroup, SUM(f.TotalRevenue) as TotalRevenue
FROM Fact_Sales f
JOIN Dim_Customer c ON f.CustomerID = c.CustomerID
GROUP BY c.AgeGroup;

-- 3. Total Sales Revenue by Geographical Region
SELECT s.Region, SUM(f.TotalRevenue) as TotalRevenue
FROM Fact_Sales f
JOIN Dim_Store s ON f.StoreID = s.StoreID
GROUP BY s.Region;

-- 4. Total Sales Revenue by Time Period (Year/Quarter)
SELECT t.Year, t.Quarter, SUM(f.TotalRevenue) as TotalRevenue
FROM Fact_Sales f
JOIN Dim_Time t ON f.TimeKey = t.TimeKey
GROUP BY t.Year, t.Quarter;
