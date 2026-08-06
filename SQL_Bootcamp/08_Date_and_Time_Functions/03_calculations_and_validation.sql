SELECT
	OrderID,
	OrderDate,
	DATEADD(year,2,OrderDate) AS TwoYearsLater,
	DATEADD(month,4,OrderDate) AS FourMonthsLater,
	DATEADD(day,-10,OrderDate) AS TenDaysBefore
FROM Sales.Orders;


-- Calculate the age of employees
SELECT
	FirstName,
	LastName,
	BirthDate,
	CURRENT_DATE AS [Current Date],
	DATEDIFF(year, BirthDate, GETDATE()) as AGE
FROM Sales.Employees;


-- Find the average shipping duration for each month
SELECT 
	MONTH(OrderDate) as Month_,
	AVG(DATEDIFF(day, OrderDate, ShipDate))
FROM Sales.Orders
GROUP BY MONTH(OrderDate);


-- Find the number of days between each order and the previous order.
SELECT
	OrderID,
	OrderDate AS CurrentOrderDate,
	LAG(OrderDate) OVER (ORDER BY OrderDate) AS PreviousOrderDate,
	--ABS(DATEDIFF(day, OrderDate ,LAG(OrderDate) OVER (ORDER BY OrderDate))) AS NumberOfDays
	DATEDIFF(day, LAG(OrderDate) OVER (ORDER BY OrderDate) , OrderDate) AS NumberOfDays
FROM Sales.Orders;


SELECT 
	ISDATE('123') DateCheck1,
	ISDATE('20-08-2025') DateCheck2,
	ISDATE('20/12/2000') DateCheck3,
	ISDATE('2025-08-20') DateCheck4,
	ISDATE('2026/12/22') DateCheck5,
	ISDATE('2025') DateCheck6,
	ISDATE('08') DateCheck7