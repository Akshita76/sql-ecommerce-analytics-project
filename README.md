# SQL Server E-Commerce Analytics Project

## Overview
This project demonstrates an end-to-end **SQL Server analytics workflow**, simulating the work of a data/BI analyst supporting an e-commerce business.  
The focus is on **schema design, data loading, and business-driven SQL analysis**, not just writing isolated queries.

---

## Business Problem
An online retail company wants to:
- Track daily and monthly revenue trends
- Measure month-over-month (MoM) growth
- Understand order performance and customer behavior
- Identify insights that can support business and marketing decisions

---

## Tech Stack
- **Database:** Microsoft SQL Server  
- **Query Tool:** SQL Server Management Studio (SSMS)  
- **Language:** T-SQL  
- **Version Control:** Git  

---

## Database Schema
The database is designed using a normalized relational model:

### Tables
- **Customers** – customer master data
- **Products** – product catalog with pricing
- **Orders** – customer orders and order status
- **OrderItems** – line-level order details

### Relationships
- One customer → many orders  
- One order → many order items  
- One product → many order items  

Primary keys, foreign keys, CHECK constraints, and indexes are used to ensure data integrity and performance.

---

## Project Structure

---

## Data Loading
Sample CSV datasets are loaded into SQL Server using **SSMS Import Wizard** for reliability and consistency across environments.

Row counts are validated after loading to ensure data completeness.

---

## Key Analysis & Queries

### 1. Daily Revenue & Orders
- Total orders per day
- Daily revenue
- Average order value (AOV)
- Filtered for completed orders only

### 2. Monthly Revenue Trends
- Aggregated revenue by month
- Order volume trends

### 3. Month-over-Month (MoM) Growth
- Uses CTEs and window functions (`LAG`)
- Calculates percentage growth compared to previous month
- Handles divide-by-zero safely using `NULLIF`

### 4. Customer Analytics
- Lifetime order count and spend
- First and last order dates
- Days since last order
- Basic churn-risk identification logic

---

## SQL Concepts Demonstrated
- Relational schema design (PK/FK)
- Data integrity constraints
- Multi-table joins
- Aggregations (`SUM`, `COUNT`, `AVG`)
- CTEs
- Window functions (`LAG`)
- Date handling and formatting
- Business-oriented SQL querying

---

## Key Insights (Sample)
- Revenue is concentrated in a small number of completed orders
- Month-over-month growth highlights revenue fluctuations between periods
- Repeat customers contribute a significant portion of total revenue

---

## Why This Project Matters
This project mirrors **real analytics work**:
- Understanding an existing schema
- Validating and loading data
- Writing SQL to answer stakeholder questions
- Version-controlling SQL artifacts using Git

---

## How to Run
1. Execute `00_create_database.sql`
2. Execute `01_create_tables.sql`
3. Load data using SSMS Import Wizard or run `Data_insertion_into_tables.sql`
4. Run analytics scripts in order:
   - `02_daily_revenue_&_orders.sql`
   - `03_MoM_growth.sql`
   - `04_CustomerAnalytics.sql`
