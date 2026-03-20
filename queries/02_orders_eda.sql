-- =========================================================
-- QUERY 2 — ORDER DETAILS EXPLORATORY DATA ANALYSIS (EDA)
-- Database: restaurant_db
-- Objective:
--   1) Inspect the order_details table
--   2) Determine the date range covered by the dataset
--   3) Count total unique orders and total order lines
--   4) Compute average items per order
--   5) Analyze daily order volume (trend + peak days)
--   6) Identify orders with unusually high item counts (outliers)
-- =========================================================

USE restaurant_db;

-- ---------------------------------------------------------
-- 1) Preview the order_details table
-- Purpose: Quick inspection of table structure and sample data
-- ---------------------------------------------------------
SELECT *
FROM order_details;

-- ---------------------------------------------------------
-- 2) Date range of the dataset
-- ---------------------------------------------------------
SELECT
  MIN(order_date) AS min_order_date,
  MAX(order_date) AS max_order_date
FROM order_details;

-- ---------------------------------------------------------
-- 3) Total number of unique orders
-- ---------------------------------------------------------
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM order_details;

-- ---------------------------------------------------------
-- 4) Total number of order lines (rows recorded in order_details)
-- Note: This counts rows, not distinct menu items.
-- ---------------------------------------------------------
SELECT COUNT(*) AS total_order_lines
FROM order_details;

-- ---------------------------------------------------------
-- 5) Average number of items per order
-- ---------------------------------------------------------
SELECT ROUND(COUNT(*) / COUNT(DISTINCT order_id), 2) AS avg_items_per_order
FROM order_details;

-- ---------------------------------------------------------
-- 6) Orders with the highest number of items (order lines)
-- ---------------------------------------------------------
SELECT order_id, COUNT(*) AS item_count
FROM order_details
GROUP BY order_id
ORDER BY item_count DESC;

-- ---------------------------------------------------------
-- 7) Number of orders that contain more than 12 items
-- ---------------------------------------------------------
SELECT COUNT(*) AS orders_over_12_items
FROM (
  SELECT order_id
  FROM order_details
  GROUP BY order_id
  HAVING COUNT(*) > 12
) t;

-- ---------------------------------------------------------
-- 8) Daily order volume (orders per day)
-- ---------------------------------------------------------
SELECT order_date, COUNT(DISTINCT order_id) AS daily_orders
FROM order_details
GROUP BY order_date
ORDER BY order_date;

-- ---------------------------------------------------------
-- 9) Top 5 peak order days
-- ---------------------------------------------------------
SELECT order_date, COUNT(DISTINCT order_id) AS daily_orders
FROM order_details
GROUP BY order_date
ORDER BY daily_orders DESC
LIMIT 5;

-- ---------------------------------------------------------
-- 10) Maximum items found in a single order (outlier ceiling)
-- ---------------------------------------------------------
SELECT MAX(item_count) AS max_items_in_single_order
FROM (
  SELECT order_id, COUNT(*) AS item_count
  FROM order_details
  GROUP BY order_id
) t;