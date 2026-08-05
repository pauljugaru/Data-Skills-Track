/* Retrieve all customers and sort the results by the highest score first. */
SELECT * 
FROM customers
ORDER BY score DESC;


/* Retrieve all customers and sort the results by the country and then by the highest score. */
SELECT * 
FROM customers 
ORDER BY country ASC, score DESC;


-- Find the total score for each country
SELECT 
	country, 
	SUM(score) as total_score
FROM customers 
GROUP BY country;


-- Find the total score and total customers for each country
SELECT 
	country, 
	SUM(score) as total_score,
	COUNT(id) as total_customers
FROM customers 
GROUP BY country;


/* Find the average score for each country, considering only customers 
   with a score not equal to 0 and return only those countries 
   with an average score greater than 430 */
SELECT 
	country,
	AVG(score) as avg_score
FROM customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) > 430;


-- CODING ORDER VS EXECUTE ORDER
SELECT DISTINCT TOP 2 
	country,
	SUM(score) as total_score
FROM customers
WHERE country = 'USA'
GROUP BY country
HAVING SUM(score) > 300
ORDER BY country ASC;

-- ! The execute order is: FROM, WHERE, GROUP BY, HAVING, SELECT, DISTINCT, ORDER BY, TOP