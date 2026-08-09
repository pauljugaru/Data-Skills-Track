-- Analyze the month-over-month (MoM) perfromance by
-- finding the percentage change in sales
SELECT 
*,
CurrentMonthSales - PreviousMonthSales AS MoM_Change,
ROUND(CAST((CurrentMonthSales - PreviousMonthSales) AS FLOAT) / PreviousMonthSales * 100, 1) AS MoM_Perc
FROM
(
	SELECT
		MONTH(OrderDate) OrderMonth,
		SUM(Sales) CurrentMonthSales,
		LAG(SUM(Sales)) OVER (ORDER BY MONTH(OrderDate)) PreviousMonthSales
	FROM Sales.Orders
	GROUP BY MONTH(OrderDate)
)t 


-- In order to analyze customer loyalty, 
-- rank customers based on the average days between their orders
SELECT
CustomerID,
AVG(DaysUntilNextOrder) AvgDays,
RANK() OVER (ORDER BY COALESCE(AVG(DaysUntilNextOrder), 9999999))
FROM
(
	SELECT
		OrderID,
		CustomerID,
		OrderDate AS CurrentOrder,
 		LEAD(OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS NextOrder,
		DATEDIFF(day,OrderDate, LEAD(OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderDate)) DaysUntilNextOrder
	FROM Sales.Orders
)t GROUP BY CustomerID;


-- Find the average shipping duration in days for each month
SELECT
	AVG(DATEDIFF(DAY,OrderDate, ShipDate)) AS ShippingDuration,
	MONTH(OrderDate) Month_
FROM Sales.Orders
GROUP BY MONTH(OrderDate);


-- Find the number of days between each order and the previous one
SELECT 
	OrderID,
	OrderDate AS CurrentDate,
	DATEDIFF(DAY, LAG(OrderDate) OVER(ORDER BY OrderDate), OrderDate) DiffDays
FROM Sales.Orders;