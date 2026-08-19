-- Total number of orders of each month
IF OBJECT_ID('Sales.MonthlyOrders', 'U') IS NOT NULL
	DROP TABLE Sales.MonthlyOrders;
GO
SELECT
	DATENAME(month, OrderDate) OrderMonth,
	COUNT(OrderID) TotalOrders
INTO Sales.MonthlyOrders
FROM Sales.Orders
GROUP BY DATENAME(month, OrderDate);


-- Creating a temporary table (We can find it in: Databases -> System Databases -> tempdb -> Temporary Tables
SELECT 
*
INTO #Temp_Orders
FROM Sales.Orders;

DELETE FROM #Temp_Orders
WHERE OrderStatus = 'Delivered'
