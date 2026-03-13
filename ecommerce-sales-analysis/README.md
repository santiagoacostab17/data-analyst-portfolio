# 📊 E-commerce Sales Analysis

Analyze historical online retail data to **boost sales**, **optimize operations**, and gain actionable insights into customer behavior and product performance.

---

## Project Overview

This project focuses on:

- Understanding customer purchasing patterns
- Identifying top-performing products
- Forecasting trends and seasonal demand
- Segmenting customers for targeted marketing campaigns

**Tools used:**  
`SQL (MySQL)` | `Python (data cleaning & analysis)` | `Power BI (dashboards)`

---

## Project Structure

| Folder             | Description |
|-------------------|-------------|
| `data/raw/`        | Original dataset (`online_retail.xlsx`) |
| `data/processed/`  | Cleaned CSV files (`customers.csv`, `products.csv`, `orders.csv`) |
| `scripts/`         | Data cleaning script (`prepare_clean_data.py`) |
| `sql/`             | SQL scripts (`schema.sql`, `load_data.sql`, `analysis_queries.sql`) |
| `dashboards/`      | Power BI dashboard |
| `reports/`         | PDF summarizing insights (`insights.md` / `insights.pdf`) |

---

## Database & SQL

1. Create the database and tables: `sql/schema.sql`  
2. Load cleaned CSVs: `sql/load_data.sql`  
3. Execute analysis queries: `sql/analysis_queries.sql`  

---

## Dashboards

Interactive dashboards are created using **Power BI** or **Tableau**, based on SQL queries.

**Key visualizations:**

- Total revenue by country  
- Top-selling products  
- Highest-value customers  
- Monthly sales trends  
- Average order value  
- Top countries by order volume  
- Most profitable products  
- Frequent customers  

**Interactive version:**  
[Explore Dashboards](YOUR_DASHBOARD_LINK_HERE)

---

## Insights

- The UK generates the highest revenue  
- Certain products dominate total sales volume  
- Some customers contribute disproportionately to total revenue  
- Sales peak in November and December  
- Average order value is a key metric for customer segmentation  

*(Full insights are available in `reports/insights.md` or `reports/insights.pdf`.)*
