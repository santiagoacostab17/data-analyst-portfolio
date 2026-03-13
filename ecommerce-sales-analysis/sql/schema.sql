-- customers
CREATE TABLE customers (
    CustomerID INT PRIMARY KEY,
    Country VARCHAR(100)
);

-- products
CREATE TABLE products (
    StockCode VARCHAR(20) PRIMARY KEY,
    Description VARCHAR(255),
    UnitPrice DECIMAL(10,2)
);

-- orders
CREATE TABLE orders (
    InvoiceNo VARCHAR(20),
    CustomerID INT,
    StockCode VARCHAR(20),
    Quantity INT,
    InvoiceDate DATETIME,
    SalesAmount DECIMAL(12,2),
    ReturnsAmount DECIMAL(12,2),
    FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID),
    FOREIGN KEY (StockCode) REFERENCES products(StockCode)
);

-- opcional: KPIs globales
CREATE TABLE global_kpis (
    Metric VARCHAR(50),
    Value DECIMAL(12,2)
);

-- opcional: KPIs por país
CREATE TABLE country_kpis (
    Country VARCHAR(100),
    TotalRevenue DECIMAL(12,2),
    TotalReturns DECIMAL(12,2),
    AvgOrderValue DECIMAL(12,2),
    TotalOrders INT,
    UniqueCustomers INT
);
