IF OBJECT_ID('Sales.V_Monthly_Summary', 'V') IS NOT NULL
	DROP VIEW Sales.V_Monthly_Summary;
GO -- T-SQL
 CREATE VIEW Sales.V_Monthly_Summary AS 
(
	SELECT
	 DATETRUNC(month,OrderDate) OrderMonth,
	 SUM(Sales) TotalSales,
	 COUNT(OrderID) TotalOrders
	 FROM Sales.Orders
	 GROUP BY DATETRUNC(month,OrderDate)
)

/* DROP VIEW V_Monthly_Summary */