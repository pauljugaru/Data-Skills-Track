--	Show all customers details and find the total orders of each customer
SELECT 
*,
(
SELECT 
	COUNT(*)
FROM Sales.Orders o WHERE o.CustomerID = c.CustomerID) TotalSales
FROM Sales.Customers c;


-- Show the details of orders made by customers in Germany
SELECT 
* 
FROM Sales.Orders o
WHERE EXISTS (SELECT 1
				FROM Sales.Customers c
				WHERE Country = 'Germany'
				AND o.CustomerID = c.CustomerID)
