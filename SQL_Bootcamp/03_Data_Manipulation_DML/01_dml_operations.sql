-- Insert 2 more customers in the table using Manual Entry (Values)
INSERT INTO customers (id, first_name, country, score)
VALUES 
	(6, 'Ana', 'USA', NULL),	
	(7, 'Sam', NULL, 100);


-- Insert only 2 columns in the table
INSERT INTO customers (id, first_name)
VALUES (8, 'Sahra');


-- Insert data from 'customers' to 'persons'
INSERT INTO persons (id, person_name, birth_date, phone)
SELECT 
	id,
	first_name,
	NULL,       -- birth_date can accept NULL
	'Unknown'   -- phone can not accept NULL so it will be a static value
FROM customers; -- ! The database will never compare the columns names


-- Change the score of customer 6 to 0
UPDATE customers
SET score = 0 
WHERE id = 6;


-- Change the score of customer 8 to 0 and update the country to UK
UPDATE customers
SET score = 0,
	country = 'UK'
WHERE id = 8;


-- Delete all the customers with an id greater than 5
DELETE FROM customers
WHERE id > 5;


-- Delete all data from table persons
/* DELETE FROM persons it is an option BUT */
TRUNCATE TABLE persons; -- is faster