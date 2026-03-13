-- ======================================
-- Load CSV data into Ecommerce database
-- ======================================

USE ecommerce;

-- ---------------------
-- Load Customers
-- ---------------------
LOAD DATA LOCAL INFILE 'data/processed/customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(CustomerID, Country);

-- ---------------------
-- Load Products
-- ---------------------
LOAD DATA LOCAL INFILE 'data/processed/products.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(StockCode, Description, UnitPrice);

-- ---------------------
-- Load Orders
-- ---------------------
LOAD DATA LOCAL INFILE 'data/processed/orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(InvoiceNo, CustomerID, StockCode, Quantity, InvoiceDate, TotalAmount, ReturnFlag);