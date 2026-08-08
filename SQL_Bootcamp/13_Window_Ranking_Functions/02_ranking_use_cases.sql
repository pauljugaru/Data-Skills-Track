-- Find the top highest sales for each product
SELECT * 
FROM
(
	SELECT 
		ProductID,
		Sales,
		ROW_NUMBER() OVER (PARTITION BY ProductID ORDER BY Sales DESC) Ranking
	FROM Sales.Orders
)t WHERE Ranking = 1;


-- Find the lowest 2 customers based on their total sales
SELECT * FROM Sales.Orders;

SELECT *
FROM
(
	SELECT 
		CustomerID,
		SUM(Sales) TotalSalesByCustomer,
		ROW_NUMBER() OVER(ORDER BY SUM(Sales)) Ranking
	FROM Sales.Orders
	GROUP BY CustomerID
)t WHERE Ranking <= 2;


-- Asign unique IDs rows of the 'OrdersArchive' table
SELECT 
ROW_NUMBER() OVER (ORDER BY OrderID, OrderDate) UniqueID,
*
FROM Sales.OrdersArchive;


-- Identify duplicate rows in the table 'OrdersArchive' and return clean result without any duplicates
SELECT *
FROM
(
	SELECT 
	ROW_NUMBER() OVER (PARTITION BY OrderID ORDER BY CreationTime ASC) RN,
	*
	FROM Sales.OrdersArchive
)t WHERE RN = 1;