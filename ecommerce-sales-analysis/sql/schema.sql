-- ======================================
-- Schema for Ecommerce Sales Analysis
-- ======================================

-- 1️⃣ Create database
CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

-- ---------------------
-- Customers table
-- ---------------------
CREATE TABLE IF NOT EXISTS customers (
    CustomerID INT PRIMARY KEY,
    Country VARCHAR(100) NOT NULL
);

-- ---------------------
-- Products table
-- ---------------------
CREATE TABLE IF NOT EXISTS products (
    StockCode VARCHAR(20) PRIMARY KEY,
    Description TEXT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL
);

-- ---------------------
-- Orders table
-- ---------------------
CREATE TABLE IF NOT EXISTS orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    InvoiceNo VARCHAR(20) NOT NULL,
    CustomerID INT NOT NULL,
    StockCode VARCHAR(20) NOT NULL,
    Quantity INT NOT NULL,
    InvoiceDate DATETIME NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL,
    ReturnFlag BOOLEAN DEFAULT 0,

    -- Foreign Keys
    FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID),
    FOREIGN KEY (StockCode) REFERENCES products(StockCode)
);