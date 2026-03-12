# 📊 E-commerce Sales Analysis

Analyze historical online retail data to **boost sales**, **optimize operations**, and gain actionable insights into customer behavior and product performance.

---

## 🔹 Project Overview

This project aims to:

- Understand customer purchasing patterns.
- Identify top-performing products.
- Forecast trends and seasonal demand.
- Segment customers for targeted marketing campaigns.

**Tools used:**  
`SQL (MySQL / SQLite)` | `Python (data cleaning & analysis)` | `Power BI (dashboards)`

---

## 📁 Project Structure

| Folder        | Description |
|---------------|-------------|
| `raw_data/`   | Original Excel dataset (`online_retails.xlsx`) |
| `clean_data/` | Cleaned CSV files for SQL (`customers.csv`, `products.csv`, `orders.csv`) |
| `scripts/`    | Python script for data cleaning (`prepare_clean_data.py`) |
| `sql/`        | SQL scripts for table creation and queries |

---

## 🛠 Data Preparation

- Remove rows with missing `CustomerID`.
- Convert data types for consistency.
- Calculate `TotalAmount` (`Quantity * UnitPrice`).
- Flag returned items with `ReturnFlag`.
- Normalize dataset into three tables: `customers`, `products`, and `orders`.

**Run the cleaning script:**  
```bash
python scripts/prepare_clean_data.py
