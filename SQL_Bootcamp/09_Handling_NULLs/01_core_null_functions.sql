-- Find the sales price for each order by dividing sales by quantity
SELECT 
	OrderID,
	Sales,
	Quantity,
	-- Sales / Quantity AS Price //  Divide by zero error encountered ERROR
	Sales / NULLIF(Quantity, 0) AS Price
FROM Sales.Orders;


-- Identify the customers who have no scores
SELECT 
	CustomerID,
	Score
FROM Sales.Customers
WHERE Score IS NULL;


-- List all customers who have scores
SELECT 
	CustomerID,
	Score
FROM Sales.Customers
WHERE Score IS NOT NULL;


-- List all details for customers who have not placed any orders
SELECT 
	c.*,
	o.OrderID
FROM Sales.Customers AS c
LEFT JOIN Sales.Orders AS o
ON c.CustomerID = o.CustomerID
WHERE Score IS NULL;