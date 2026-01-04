-- queries.sql
-- SQL queries to showcase basic to advanced operations
-- Includes selects, filters, joins, aggregations, and analytical queries

-- 1. Select all customers
SELECT * FROM customers;

-- 2. Select all orders
SELECT * FROM orders;

-- 3. Select all products
SELECT * FROM products;

-- 4. Select all order items
SELECT * FROM ord_items;

-- 5. Select specific columns
SELECT cust_name FROM customers;
SELECT p_name, price FROM products;

-- 6. Orders for a specific customer
SELECT * FROM orders WHERE cust_id = 1;

-- 7. Products above a certain price
SELECT * FROM products WHERE price > 1000;

-- 8. Order items with quantity more than 2
SELECT * FROM ord_items WHERE quantity > 2;

-- 9. Total number of orders per customer
SELECT cust_id, COUNT(*) AS total_orders
FROM orders
GROUP BY cust_id;

-- 10. Total items ordered per product
SELECT p_id, SUM(quantity) AS total_sold
FROM ord_items
GROUP BY p_id;

-- 11. Total revenue per product
SELECT p.p_name, SUM(oi.quantity * p.price) AS revenue
FROM ord_items oi
JOIN products p ON oi.p_id = p.p_id
GROUP BY p.p_name;

-- 12. Show each order with customer name
SELECT o.ord_id, o.ord_date, c.cust_name
FROM orders o
JOIN customers c ON o.cust_id = c.cust_id;

-- 13. Show each order item with product and customer details
SELECT c.cust_name, o.ord_id, o.ord_date, p.p_name, oi.quantity, p.price, p.price*oi.quantity AS total_price
FROM ord_items oi
JOIN orders o ON oi.ord_id = o.ord_id
JOIN products p ON oi.p_id = p.p_id
JOIN customers c ON o.cust_id = c.cust_id;

-- 14. Total spent by each customer
SELECT c.cust_name, SUM(oi.quantity * p.price) AS total_spent
FROM customers c
JOIN orders o ON c.cust_id = o.cust_id
JOIN ord_items oi ON o.ord_id = oi.ord_id
JOIN products p ON oi.p_id = p.p_id
GROUP BY c.cust_name
ORDER BY total_spent DESC;

-- 15. Most expensive product sold
SELECT p.p_name, MAX(p.price) AS max_price
FROM products p;

-- 16. Customers with more than 1 order
SELECT c.cust_name, COUNT(o.ord_id) AS num_orders
FROM customers c
JOIN orders o ON c.cust_id = o.cust_id
GROUP BY c.cust_name
HAVING COUNT(o.ord_id) > 1;

-- 17. Average order value per customer
SELECT c.cust_name, AVG(oi.quantity * p.price) AS avg_order_value
FROM customers c
JOIN orders o ON c.cust_id = o.cust_id
JOIN ord_items oi ON o.ord_id = oi.ord_id
JOIN products p ON oi.p_id = p.p_id
GROUP BY c.cust_name;
