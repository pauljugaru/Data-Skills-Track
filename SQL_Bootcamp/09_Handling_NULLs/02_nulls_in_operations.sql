-- Find the average scores for the customers
SELECT 
	AVG(Score) AS AverageWithNULL
FROM Sales.Customers;

SELECT 
	AVG(Score) AS AverageWithNULL,
	AVG(ISNULL(Score,0)) AS AverageWithoutNULL
FROM Sales.Customers;


-- Display the full name of the customers in a single field and add 10 bonus points to each customer's score
SELECT 
	ISNULL(FirstName,'') + ' ' + ISNULL(LastName,'') AS FullName,
	Score,
	COALESCE(Score,0) + 10 AS BonusPoints
FROM Sales.Customers;

-- Sort the customers from lowest to highest score, with NULL appearing LAST.
SELECT 
	CustomerID,
	FirstName,
	Score,
	CASE WHEN Score IS NULL THEN 1 ELSE 0 END Flag
FROM Sales.Customers
ORDER BY CASE WHEN Score IS NULL THEN 1 ELSE 0 END, Score