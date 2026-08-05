/* Retrieve all customers whose score falls in the range
between 100 and 500 */
SELECT * 
FROM customers
WHERE score BETWEEN 100 AND 500;


-- Retrieve all customers from either USA or Germany
SELECT * 
FROM customers
WHERE country IN ('USA','Germany'); -- Using IN is cleaner than writing multiple OR conditions 


-- Find all customers whose first name starts with 'M'
SELECT * 
FROM customers 
WHERE first_name LIKE 'M%';


-- Find all customers whose first name end with 'n'
SELECT * 
FROM customers 
WHERE first_name LIKE '%n';


-- Find all customers whose first name contains 'r'
SELECT *
FROM customers
WHERE first_name LIKE '%r%';


-- Find all customers whose first name has 'r' in the 3rd position
SELECT *
FROM customers
WHERE first_name LIKE '__r%';