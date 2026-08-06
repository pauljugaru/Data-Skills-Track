-- Format CreationTime into various string patterns (USA, EU, specific date parts)
SELECT 
	OrderID,
	CreationTime,
	FORMAT(CreationTime, 'MM-dd-yyyy') as USA_format,
	FORMAT(CreationTime, 'dd-MM-yyyy') as EU_format,
	FORMAT(CreationTime, 'dd/MM/yyyy') as new_date,
	FORMAT(CreationTime, 'dd') as dd,
	FORMAT(CreationTime, 'ddd') as ddd,
	FORMAT(CreationTime, 'dddd') as dddd,
	FORMAT(CreationTime, 'MM') as MM,
	FORMAT(CreationTime, 'MMM') as MMM,
	FORMAT(CreationTime, 'MMMM') as MMMM
FROM Sales.Orders;


-- Show CreationTime using the following format: Day Wed Jan Q1 2025 12:34:56 PM
SELECT 
	CreationTime,
	'Day ' 
	+ FORMAT(CreationTime, 'ddd MMM ') 
	+ 'Q' 
	+ DATENAME(quarter, CreationTime) 
	+ FORMAT(CreationTime, ' yyyy hh:mm:ss tt') 
FROM Sales.Orders;


-- Count total orders grouped by formatted month and year
SELECT 
	FORMAT(OrderDate, 'MMM yy') as OrderDates,
	COUNT(*)
FROM Sales.Orders
GROUP BY FORMAT(OrderDate, 'MMM yy');


-- Convert data types using the CONVERT function (including specific styles for datetime)
SELECT 
	CONVERT(INT, '123') AS [String to INT Convert],
	CONVERT(VARCHAR, 123) AS [INT to String Convert],
	CONVERT(DATE, '2025-08-30') AS [String to DATE Convert],
	CreationTime,
	CONVERT(DATE, CreationTime) AS [Datetime to Date Convert],
	CONVERT(VARCHAR, CreationTime, 32) AS [US Std. Style: 32],
	CONVERT(VARCHAR, CreationTime, 34) AS [EU Std. Style: 34]
FROM Sales.Orders;


-- Cast string and datetime values into specific data types using CAST
SELECT 
	CAST('123' AS INT) AS [String to INT],
	CAST('2025-08-23' AS DATE) AS [String to Date],
	CAST('2025-08-23' AS DATETIME2) AS [String to Datetime],
	CreationTime,
	CAST(CreationTime AS DATE) AS [Datetime to Date]
FROM Sales.Orders;