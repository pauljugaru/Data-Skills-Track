-- Find the average scores of customers and treat NULLs as 0 
-- Additionaly provide details such CustomerID and LastName
SELECT 
	CustomerID,
	LastName,
	Score,
	CASE
		WHEN Score IS NULL THEN 0
		ELSE Score 
	END ScoreClean,
	AVG
	(CASE
		WHEN Score IS NULL THEN 0
		ELSE Score 
	END) OVER() AvgCustomerClean,

	AVG(Score) OVER() AvgCustomer
FROM Sales.Customers;


-- Count how many time each customer has made an order with sales greater than 30
SELECT 
	CustomerID,
	Sales
FROM Sales.Orders;

SELECT 
	CustomerID,
	COUNT(*) TotalOrders,
	SUM(CASE
		WHEN Sales > 30 THEN 1
		ELSE 0
	END) TotalOrderHighSales
FROM Sales.Orders
GROUP BY CustomerID;