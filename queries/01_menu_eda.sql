-- =========================================================
-- QUERY 1 — MENU ITEMS EXPLORATORY DATA ANALYSIS (EDA)
-- Database: restaurant_db
-- Objective:
--   1) Explore the structure of the menu table
--   2) Analyze price distribution
--   3) Examine category-level statistics
-- =========================================================

USE restaurant_db;

-- ---------------------------------------------------------
-- 1) Preview the menu_items table
-- Purpose: Quick inspection of table structure and data
-- ---------------------------------------------------------
SELECT *
FROM menu_items;

-- ---------------------------------------------------------
-- 2) Total number of menu items
-- ---------------------------------------------------------
SELECT COUNT(*) AS total_menu_items
FROM menu_items;

-- ---------------------------------------------------------
-- 3) Top 10 most expensive items
-- ---------------------------------------------------------
SELECT 
    menu_item_id,
    item_name,
    category,
    price
FROM menu_items
ORDER BY price DESC
LIMIT 10;

-- ---------------------------------------------------------
-- 4) Top 10 least expensive items
-- ---------------------------------------------------------
SELECT 
    menu_item_id,
    item_name,
    category,
    price
FROM menu_items
ORDER BY price ASC
LIMIT 10;

-- ---------------------------------------------------------
-- 5) Count of items in the 'Italian' category
-- ---------------------------------------------------------
SELECT COUNT(*) AS italian_item_count
FROM menu_items
WHERE category = 'Italian';

-- ---------------------------------------------------------
-- 6) Italian items sorted by price (highest first)
-- ---------------------------------------------------------
SELECT 
	menu_item_id,
    item_name,
    category,
    price
FROM menu_items
WHERE category = 'Italian'
ORDER BY price DESC;

-- ---------------------------------------------------------
-- 7) Number of dishes per category
-- ---------------------------------------------------------
SELECT category, COUNT(*) AS number_of_dishes
FROM menu_items
GROUP BY category
ORDER BY number_of_dishes DESC;

-- ---------------------------------------------------------
-- 8) Category-level price statistics
--    - number of dishes
--    - average price
--    - minimum price
--    - maximum price
-- ---------------------------------------------------------
SELECT category, COUNT(*) AS number_of_dishes,
	ROUND(AVG(price), 2) AS average_price,
    MIN(price) AS minimum_price,
    MAX(price) AS maximum_price
FROM menu_items
GROUP BY category
ORDER BY average_price DESC;