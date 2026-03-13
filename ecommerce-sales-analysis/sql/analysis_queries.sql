-- analysis_queries.sql

-- Global KPIs
SELECT *
FROM global_kpis;

-- KPIs by Country
SELECT *
FROM country_kpis
ORDER BY TotalRevenue DESC;

-- Top 10 Products by Revenue
SELECT p.StockCode,
       p.Description,
       SUM(o.SalesAmount) AS TotalRevenue,
       SUM(o.Quantity) AS TotalQuantity
FROM orders o
JOIN products p ON o.StockCode = p.StockCode
GROUP BY p.StockCode, p.Description
ORDER BY TotalRevenue DESC
LIMIT 10;

-- Top 10 Customers by Revenue
SELECT c.CustomerID,
       c.Country,
       SUM(o.SalesAmount) AS TotalRevenue,
       COUNT(DISTINCT o.InvoiceNo) AS TotalOrders
FROM orders o
JOIN customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.Country
ORDER BY TotalRevenue DESC
LIMIT 10;

-- Monthly Sales Trends
SELECT DATE_FORMAT(InvoiceDate, '%Y-%m') AS Month,
       SUM(SalesAmount) AS MonthlyRevenue,
       COUNT(DISTINCT InvoiceNo) AS OrdersCount
FROM orders
GROUP BY Month
ORDER BY Month;

-- Revenue and Returns by Product
SELECT p.StockCode,
       p.Description,
       SUM(o.SalesAmount) AS TotalRevenue,
       SUM(o.ReturnsAmount) AS TotalReturns
FROM orders o
JOIN products p ON o.StockCode = p.StockCode
GROUP BY p.StockCode, p.Description
ORDER BY TotalRevenue DESC;

-- Revenue and Returns by Country
SELECT c.Country,
       SUM(o.SalesAmount) AS TotalRevenue,
       SUM(o.ReturnsAmount) AS TotalReturns
FROM orders o
JOIN customers c ON o.CustomerID = c.CustomerID
GROUP BY c.Country
ORDER BY TotalRevenue DESC;

-- Orders per Customer
SELECT CustomerID,
       COUNT(InvoiceNo) AS OrdersCount,
       SUM(SalesAmount) AS TotalSpent
FROM orders
GROUP BY CustomerID
ORDER BY TotalSpent DESC
LIMIT 20;
