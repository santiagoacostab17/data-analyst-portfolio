# prepare_clean_data.py
import pandas as pd
import os

# -----------------------------
# 1️⃣ Read Excel file
# -----------------------------
input_file = 'raw_data/online_retails.xlsx'  # <- update with your file path if needed
df = pd.read_excel(input_file)

# -----------------------------
# 2️⃣ Data Cleaning and Transformation
# -----------------------------
# Remove rows without CustomerID
df = df.dropna(subset=['CustomerID'])

# Ensure correct data types
df['CustomerID'] = df['CustomerID'].astype(int)
df['Quantity'] = df['Quantity'].astype(int)
df['UnitPrice'] = df['UnitPrice'].astype(float)
df['InvoiceDate'] = pd.to_datetime(df['InvoiceDate'])

# Create TotalAmount column
df['TotalAmount'] = df['Quantity'] * df['UnitPrice']

# Create ReturnFlag for negative quantities
df['ReturnFlag'] = df['Quantity'] < 0

# -----------------------------
# 3️⃣ Create output folder
# -----------------------------
output_folder = 'clean_data'
os.makedirs(output_folder, exist_ok=True)

# -----------------------------
# 4️⃣ Normalize tables and save CSVs
# -----------------------------
# Customers table
customers = df[['CustomerID', 'Country']].drop_duplicates()
customers.to_csv(os.path.join(output_folder, 'customers.csv'), index=False)

# Products table
products = df[['StockCode', 'Description', 'UnitPrice']].drop_duplicates()
products.to_csv(os.path.join(output_folder, 'products.csv'), index=False)

# Orders table
orders = df[['InvoiceNo', 'CustomerID', 'StockCode', 'Quantity', 'InvoiceDate', 'TotalAmount', 'ReturnFlag']]
orders.to_csv(os.path.join(output_folder, 'orders.csv'), index=False)

# -----------------------------
# 5️⃣ Summary
# -----------------------------
print(f"✅ Clean and SQL-ready CSV files saved in '{output_folder}'")
print(f"Customers: {customers.shape[0]} rows")
print(f"Products: {products.shape[0]} rows")
print(f"Orders: {orders.shape[0]} rows")