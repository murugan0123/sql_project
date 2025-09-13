# 🛒 SQL Project - Retail Sales Analysis

## 📌 Project Overview
This project demonstrates SQL queries for analyzing *retail sales data*.  
The aim is to practice database creation, table management, and writing SQL queries for insights.

It includes:
- ✅ Creating database & tables  
- ✅ Inserting sample records  
- ✅ Writing queries for data analysis  
- ✅ Finding sales trends  

---

## ⚙ How to Run
1. Open *MySQL Workbench* (or any SQL client).  
2. Import and run the file **SQL_project.sql**.  
3. Execute the queries step by step.  
4. Check the results and analyze the dataset.  

---

## 📊 Sample Queries

```sql
-- Create table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    amount DECIMAL(10,2),
    sale_date DATE
);

-- Insert sample record
INSERT INTO sales VALUES (1, 'Laptop', 'Electronics', 55000, '2025-09-10');

-- Find total sales by category
SELECT category, SUM(amount) AS total_sales
FROM sales
GROUP BY category;

-- Find top 5 highest sales
SELECT product_name, amount
FROM sales
ORDER BY amount DESC
LIMIT 5;
