E-commerce Sales Analysis
📊 Project Overview

Analyze historical online retail data to boost sales and optimize operations. Key objectives: understand customer purchasing behavior, identify top-performing products, forecast trends and seasonal demand, and segment customers for targeted campaigns.

Tools: SQL (MySQL/SQLite), Python (data cleaning & analysis), Power BI (dashboards)

Project Structure

raw_data/ → Original Excel dataset (online_retails.xlsx)

clean_data/ → Cleaned CSVs for SQL (customers.csv, products.csv, orders.csv)

scripts/ → Python script for data cleaning (prepare_clean_data.py)

sql/ → SQL scripts for table creation and queries

Data Preparation

Clean missing CustomerIDs, convert data types, calculate TotalAmount, and flag returns. Normalize tables into customers, products, and orders. Run:
python scripts/prepare_clean_data.py

Database Design

customers: CustomerID (PK), Country
products: StockCode (PK), Description, UnitPrice
orders: InvoiceNo, CustomerID (FK), StockCode (FK), Quantity, InvoiceDate, TotalAmount, ReturnFlag

Sample Analysis

Top Products:
SELECT p.Description, SUM(o.TotalAmount) AS TotalSales FROM orders o JOIN products p ON o.StockCode = p.StockCode GROUP BY p.Description ORDER BY TotalSales DESC LIMIT 10;

Customer Revenue by Country:
SELECT c.Country, SUM(o.TotalAmount) AS Revenue FROM orders o JOIN customers c ON o.CustomerID = c.CustomerID GROUP BY c.Country ORDER BY Revenue DESC;

Monthly Sales Trends:
SELECT DATE_FORMAT(InvoiceDate, '%Y-%m') AS Month, SUM(TotalAmount) AS Sales FROM orders GROUP BY Month ORDER BY Month;

Key Insights

Identify high-value products & customers, forecast seasonal demand and optimize inventory, and monitor returns to reduce losses.

Data Source

[UCI Online Retail Dataset](https://archive.ics.uci.edu/dataset/352/online+retail)
