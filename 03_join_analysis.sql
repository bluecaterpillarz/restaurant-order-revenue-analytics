USE restaurant_db

-- Combine The menu_items and order_details tables into a single table:
SELECT * FROM order_details od LEFT JOIN menu_items mi
ON od.item_id=mi.menu_item_id;

-- What were the least and most ordered items? What categories where they in?
SELECT item_name, COUNT(order_details_id) AS num_purchases
FROM order_details od LEFT JOIN menu_items mi
ON od.item_id=mi.menu_item_id
GROUP BY item_name
LIMIT 5;

-- View the details of the highest spent order:
SELECT * FROM order_details od LEFT JOIN menu_items mi
ON od.item_id=mi.menu_item_id
WHERE order_id=440;
-- What insights can you gather from this:
SELECT category, COUNT(item_id) AS num_items
FROM order_details od LEFT JOIN menu_items mi
ON od.item_id=mi.menu_item_id
WHERE order_id=440
GROUP BY category;



-- View the top 5 most spent order:
SELECT * FROM order_details od LEFT JOIN menu_items mi
ON od.item_id=mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675);
-- What insights can you gather from this:
SELECT category, COUNT(item_id) AS num_items
FROM order_details od LEFT JOIN menu_items mi
ON od.item_id=mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY category;

SELECT order_id, category, COUNT(item_id) AS num_items
FROM order_details od LEFT JOIN menu_items mi
ON od.item_id=mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY order_id, category;