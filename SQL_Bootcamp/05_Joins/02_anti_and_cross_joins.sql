-- Get all customers who haven't placed any order
SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id is NULL;


-- Get all orders without matching customers
SELECT *
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = o.customer_id
WHERE c.id is NULL;



-- Get all orders without matching customers using LEFT JOIN
SELECT *
FROM orders AS o
LEFT JOIN customers AS c
ON o.customer_id = c.id
WHERE c.id is NULL;


-- Find customers without orders AND orders without customers
SELECT * 
FROM customers AS c
FULL JOIN orders AS o
ON c.id = o.customer_id
WHERE c.id is NULL OR o.customer_id is NULL;


/* Get all customers along their orders, but only for customers 
who have placed an order WITHOUT INNER JOIN*/
SELECT * 
FROM customers AS c
FULL JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id is NOT NULL AND c.id is NOT NULL

-- or

SELECT * 
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.customer_id is NOT NULL



-- Get all the combinations of customers and orders
SELECT * 
FROM customers
CROSS JOIN orders