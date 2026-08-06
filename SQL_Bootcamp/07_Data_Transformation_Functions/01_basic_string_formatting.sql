-- Concatenate first name and country in one column.
SELECT
	CONCAT(first_name,' ', country) AS name_country
FROM customers;

-- Transform the customer's first name to lowercase
SELECT 
	LOWER(first_name) AS low_name
FROM customers;


-- Transform the customer's first name to uppercase
SELECT 
	UPPER(first_name) AS up_name
FROM customers;


-- Find customers whose first name contains leading or trailing spaces
SELECT
	first_name
FROM customers
WHERE first_name !=	TRIM(first_name);

------
SELECT 
	first_name,
	LEN(TRIM(first_name)) AS len_trim_name,
	LEN(first_name) - LEN(TRIM(first_name)) AS FLAG
FROM customers;


-- Calculate the length of each customer's first name
SELECT
	first_name,
	LEN(TRIM(first_name)) AS length
FROM customers;