-- analysis_queries.sql

-- 1️⃣ Total Revenue, Total Returns, Avg Order Value, Total Orders, Unique Customers (Global)
SELECT *
FROM global_kpis;

-- 2️⃣ KPIs por País
SELECT *
FROM country_kpis
ORDER BY TotalRevenue DESC;

-- 3️⃣ Top 10 Products by SalesAmount
SELECT p.StockCode, p.Description, SUM(o.SalesAmount) AS TotalRevenue, SUM(o.Quantity) AS TotalQuantity
FROM orders o
JOIN products p ON o.StockCode = p.StockCode
GROUP BY p.StockCode, p.Description
ORDER BY TotalRevenue DESC
LIMIT 10;

-- 4️⃣ Top 10 Customers by SalesAmount
SELECT c.CustomerID, c.Country, SUM(o.SalesAmount) AS TotalRevenue, COUNT(DISTINCT o.InvoiceNo) AS TotalOrders
FROM orders o
JOIN customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.Country
ORDER BY TotalRevenue DESC
LIMIT 10;

-- 5️⃣ Monthly Sales Trends
SELECT DATE_FORMAT(InvoiceDate, '%Y-%m') AS Month, SUM(SalesAmount) AS MonthlyRevenue, COUNT(DISTINCT InvoiceNo) AS OrdersCount
FROM orders
GROUP BY Month
ORDER BY Month;

-- 6️⃣ Revenue and Returns by Product (for dashboards with Returns)
SELECT p.StockCode, p.Description, SUM(o.SalesAmount) AS TotalRevenue, SUM(o.ReturnsAmount) AS TotalReturns
FROM orders o
JOIN products p ON o.StockCode = p.StockCode
GROUP BY p.StockCode, p.Description
ORDER BY TotalRevenue DESC;

-- 7️⃣ Revenue by Country
SELECT c.Country, SUM(o.SalesAmount) AS TotalRevenue, SUM(o.ReturnsAmount) AS TotalReturns
FROM orders o
JOIN customers c ON o.CustomerID = c.CustomerID
GROUP BY c.Country
ORDER BY TotalRevenue DESC;

-- 8️⃣ Orders per Customer (frequency analysis)
SELECT CustomerID, COUNT(InvoiceNo) AS OrdersCount, SUM(SalesAmount) AS TotalSpent
FROM orders
GROUP BY CustomerID
ORDER BY TotalSpent DESC
LIMIT 20;
