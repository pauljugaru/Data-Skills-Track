SELECT 
	OrderID,
	OrderDate,
	OrderStatus,
	Sales,
	SUM(Sales) OVER (PARTITION BY OrderStatus ORDER BY OrderDate, OrderID ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING) AS CurrentAnd2Following,
	SUM(Sales) OVER (PARTITION BY OrderStatus ORDER BY OrderDate, OrderID ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS TwoPrecedingAndCurrent,
	SUM(Sales) OVER (PARTITION BY OrderStatus ORDER BY OrderDate, OrderID ROWS BETWEEN UNBOUNDED PRECEDING AND 3 FOLLOWING) AS UnboundedPrecedingAnd3Following,
	SUM(Sales) OVER (PARTITION BY OrderStatus ORDER BY OrderDate, OrderID ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS CurrentAndUnboundedFollowing
FROM Sales.Orders
ORDER BY OrderStatus, OrderDate, OrderID;