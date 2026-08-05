USE MyDatabase;

-- Retrieve All Customers Data
SELECT * 
FROM customers;


-- Retrieve each customer's name, country and score.
SELECT 
	first_name,
	country,
	score
FROM customers;


-- Retrieve customers from Germany
SELECT * 
FROM customers
WHERE country = 'Germany';


-- Return Unique list of all countries
SELECT DISTINCT country
FROM customers;


-- Get the Two Most Recent Orders 
SELECT TOP 2 * 
FROM orders
ORDER BY order_date DESC;	


-- Retrieve the Lowest 2 Customers based on the Score
SELECT TOP 2 *
FROM customers
ORDER BY score ASC;
