# Restaurant Order & Revenue Analytics

SQL-based analysis of restaurant order and revenue data using **MySQL**.

This project explores order patterns, top-selling items, and revenue distribution across menu categories using SQL queries and joins.

---

# Project Objectives

The goal of this project is to analyze restaurant sales data and extract useful business insights such as:

- Order activity over time
- Most frequently ordered menu items
- Revenue contribution by category
- High-value customer orders
- Item popularity and demand patterns

The project demonstrates practical use of SQL for **Exploratory Data Analysis (EDA)**.

---

# Dataset Structure

The analysis uses two tables:

### menu_items
Contains information about menu items.

Columns include:
- menu_item_id
- item_name
- category
- price

### order_details
Contains order transaction records.

Columns include:
- order_details_id
- order_id
- order_date
- order_time
- item_id

---

# SQL Analysis Tasks

The project includes several analytical queries such as:

### Menu Exploration
- Total number of menu items
- Category distribution
- Price range analysis
- Most expensive and least expensive items

### Order Exploration
- Order date range
- Total number of orders
- Total items sold
- Orders with the highest number of items

### Revenue & Join Analysis
Using SQL joins to combine order data with menu data.

Insights include:
- Most purchased items
- Least purchased items
- Category level spending
- Highest revenue orders
- Top 10 highest spending orders

---

# Project Structure
restaurant-order-revenue-analytics

queries/
01_menu_analysis.sql
02_order_analysis.sql
03_join_analysis.sql

schema/
restaurant_schema.sql

README.md


---

# Technologies Used

- MySQL
- SQL joins
- Aggregations
- GROUP BY
- Data exploration techniques

---

# Example Insights

Some interesting patterns that can be discovered from this dataset:

- Certain categories generate significantly more revenue.
- Some orders contain unusually high numbers of items.
- A small number of items drive a large percentage of total sales.

These insights can help restaurants optimize their menu and pricing strategy.

---

# Author

Data analysis project created for SQL practice and portfolio development.
