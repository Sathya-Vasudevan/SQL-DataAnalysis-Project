# Zepto Inventory Data Analysis

**Project Overview**  
This is a complete, real-world data analyst portfolio project based on an e-commerce inventory dataset scraped from Zepto — one of India’s fastest-growing quick-commerce startups. This project simulates real analyst workflows, from raw data exploration to business-focused data analysis.

---

## ✅ Project Objectives
1. Load and clean the Zepto inventory dataset (handling nulls, zero values, converting paise → ₹).  
2. Conduct exploratory data analysis (EDA) using SQL.  
3. Answer nine key business‑focused insights via SQL queries.  
4. Summarize findings with visualizations (optional) and narrative.  

---
## 📁 Dataset Overview

The dataset was sourced from Kaggle and was originally scraped from Zepto’s official product listings. It mimics what you’d typically encounter in a real-world e-commerce inventory system.

Each row represents a unique SKU (Stock Keeping Unit) for a product. Duplicate product names exist because the same product may appear multiple times in different package sizes, weights, discounts, or categories to improve visibility – exactly how real catalog data looks.

🧾 Columns:

sku_id: Unique identifier for each product entry (Synthetic Primary Key)

name: Product name as it appears on the app

category: Product category like Fruits, Snacks, Beverages, etc.

mrp: Maximum Retail Price (originally in paise, converted to ₹)

discountPercent: Discount applied on MRP

discountedSellingPrice: Final price after discount (also converted to ₹)

availableQuantity: Units available in inventory

weightInGms: Product weight in grams

outOfStock: Boolean flag indicating stock availability

quantity: Number of units per package (mixed with grams for loose produce)

---
## 🔧 Project Workflow

Here’s a step-by-step breakdown of what i did in this project:

## 1. Database & Table Creation

We start by creating a SQL table with appropriate data types:

<img width="547" height="271" alt="Screenshot 2025-11-14 at 12 18 04 AM" src="https://github.com/user-attachments/assets/bcb952aa-eea1-43c7-8bfc-2a277f7a5778" />

### 2. Data Import
- Loaded CSV using pgAdmin's import feature.
  
- Faced encoding issues (UTF-8 error), which were fixed by saving the CSV file using CSV UTF-8 format.

### 3. 🔍 Data Exploration
- Counted the total number of records in the dataset

- Viewed a sample of the dataset to understand structure and content

- Checked for null values across all columns

- Identified distinct product categories available in the dataset

- Compared in-stock vs out-of-stock product counts

- Detected products present multiple times, representing different SKUs

### 4. 🧹 Data Cleaning
- Identified and removed rows where MRP or discounted selling price was zero

- Converted mrp and discountedSellingPrice from paise to rupees for consistency and readability
  
### 5. 📊 Business Insights
- Found top 10 best-value products based on discount percentage

- Identified high-MRP products that are currently out of stock

- Estimated potential revenue for each product category

- Filtered expensive products (MRP > ₹500) with minimal discount

- Ranked top 5 categories offering highest average discounts

- Calculated price per gram to identify value-for-money products

- Grouped products based on weight into Low, Medium, and Bulk categories

- Measured total inventory weight per product category


---

## 🛠️ Tools & Technologies
- PostgreSQL (SQL) with pgAdmin or psql CLI  
- Dataset from Kaggle (Zepto inventory dataset)  
- SQL queries for ETL, EDA, aggregations, joins, window functions  

---

## 📌 Key Outcomes
- Developed ≥8 business‑driven SQL queries for retail KPIs  
- Identified best‑value products, inventory risks, and pricing optimization  
- Simulated an end‑to‑end analyst workflow from raw data to business insight  

---

