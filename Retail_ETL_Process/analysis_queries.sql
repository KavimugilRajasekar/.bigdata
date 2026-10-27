-- 3(c) Analytical Queries for the ETL processed data

-- 1. Total Sales Revenue by Product Category
SELECT Category, SUM(TotalRevenue) as TotalRevenue
FROM fact_sales
GROUP BY Category
ORDER BY TotalRevenue DESC;

-- 2. Analyze Customer Demographics (Purchasing Power)
-- Identifying top spending customers
SELECT CustomerID, SUM(TotalRevenue) as CustomerSpend
FROM fact_sales
GROUP BY CustomerID
ORDER BY CustomerSpend DESC;

-- 3. Identify Sales Trends over Time
-- Grouping sales by date to see progression
SELECT Date, SUM(TotalRevenue) as DailyRevenue
FROM fact_sales
GROUP BY Date
ORDER BY Date ASC;
