-- ======================================
-- Analysis Queries for Ecommerce Sales
-- ======================================

USE ecommerce;

-- 1️⃣ Total revenue by country
SELECT 
    c.Country,
    SUM(o.TotalAmount) AS TotalRevenue,
    COUNT(DISTINCT o.CustomerID) AS UniqueCustomers
FROM orders o
JOIN customers c ON o.CustomerID = c.CustomerID
GROUP BY c.Country
ORDER BY TotalRevenue DESC;

-- 2️⃣ Top 10 best-selling products by quantity
SELECT 
    p.Description,
    SUM(o.Quantity) AS TotalQuantity,
    SUM(o.TotalAmount) AS TotalRevenue
FROM orders o
JOIN products p ON o.StockCode = p.StockCode
GROUP BY p.Description
ORDER BY TotalQuantity DESC
LIMIT 10;

-- 3️⃣ Highest-value customers by total spend
SELECT 
    c.CustomerID,
    SUM(o.TotalAmount) AS TotalSpent,
    COUNT(DISTINCT o.InvoiceNo) AS TotalOrders
FROM orders o
JOIN customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID
ORDER BY TotalSpent DESC
LIMIT 10;

-- 4️⃣ Monthly sales
SELECT 
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS Month,
    SUM(TotalAmount) AS MonthlyRevenue,
    COUNT(DISTINCT CustomerID) AS UniqueCustomers
FROM orders
GROUP BY Month
ORDER BY Month;

-- 5️⃣ Average order value
SELECT 
    AVG(TotalAmount) AS AvgOrderValue
FROM orders;

-- 6️⃣ Top 5 countries by number of orders
SELECT 
    c.Country,
    COUNT(o.InvoiceNo) AS TotalOrders
FROM orders o
JOIN customers c ON o.CustomerID = c.CustomerID
GROUP BY c.Country
ORDER BY TotalOrders DESC
LIMIT 5;

-- 7️⃣ Most profitable products
SELECT 
    p.Description,
    SUM(o.TotalAmount) AS TotalRevenue
FROM orders o
JOIN products p ON o.StockCode = p.StockCode
GROUP BY p.Description
ORDER BY TotalRevenue DESC
LIMIT 10;

-- 8️⃣ Top 10 customers by number of orders
SELECT 
    c.CustomerID,
    COUNT(o.InvoiceNo) AS TotalOrders,
    SUM(o.TotalAmount) AS TotalSpent
FROM orders o
JOIN customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID
ORDER BY TotalOrders DESC
LIMIT 10;