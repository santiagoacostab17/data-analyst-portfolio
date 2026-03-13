-- customers
LOAD DATA LOCAL INFILE 'clean_data/customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(CustomerID, Country);

-- products
LOAD DATA LOCAL INFILE 'clean_data/products.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(StockCode, Description, UnitPrice);

-- orders
LOAD DATA LOCAL INFILE 'clean_data/orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(InvoiceNo, CustomerID, StockCode, Quantity, InvoiceDate, SalesAmount, ReturnsAmount);

-- global_kpis
LOAD DATA LOCAL INFILE 'clean_data/global_kpis.csv'
INTO TABLE global_kpis
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Metric, Value);

-- country_kpis
LOAD DATA LOCAL INFILE 'clean_data/country_kpis.csv'
INTO TABLE country_kpis
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Country, TotalRevenue, TotalReturns, AvgOrderValue, TotalOrders, UniqueCustomers);
