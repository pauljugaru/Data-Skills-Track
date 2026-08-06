SELECT 
	OrderID,
	CreationTime,
	DAY(CreationTime) AS Day_,
	MONTH(CreationTime) AS Month_,
	YEAR(CreationTime) AS Year_,
	--DATEPART examples
	DATEPART(year, CreationTime) AS year_dp,
	DATEPART(hour, CreationTime) AS hour_dp,
	DATEPART(quarter, CreationTime) AS quarter_dp,
	DATEPART(weekday, CreationTime) AS weekday_dp,
	DATEPART(week, CreationTime) AS week_dp,
	--DATENAME examples
	DATENAME(weekday, CreationTime) AS day_dn,
	DATENAME(month, CreationTime) AS month_dn,
	--DATETRUNC examples
	DATETRUNC(year, CreationTime) AS year_dt,
	DATETRUNC(day, CreationTime) AS day_dt,
	DATETRUNC(hour, CreationTime) AS hour_dt,
	DATETRUNC(minute, CreationTime) AS minute_dt
FROM Sales.Orders;


-- Example when we have to use DATETRUNC
SELECT 
	DATETRUNC(month,CreationTime) AS Creation,
	COUNT(*)
FROM Sales.Orders
GROUP BY DATETRUNC(month,CreationTime);


-- EOMONTH exercise
SELECT 
	OrderID,
	CreationTime,
	EOMONTH(CreationTime) AS EndOfMonth,
	CAST(DATETRUNC(month, CreationTime) AS DATE) AS StartOfMonth
FROM Sales.Orders


-- How many orders were placed each year?
SELECT
	YEAR(OrderDate) AS year_,
	COUNT(*) as total_orders
FROM Sales.Orders
GROUP BY YEAR(OrderDate);



-- How many orders were placed each month?
SELECT
	DATENAME(month, OrderDate) AS month_,
	COUNT(*) as total_orders
FROM Sales.Orders
GROUP BY DATENAME(month, OrderDate);


-- Show OrderID's that were placed during the month of February
SELECT 
	OrderID,
	DATENAME(month,OrderDate) as month_name
FROM Sales.Orders
WHERE DATENAME(month,OrderDate) = 'February';
-- ! Filtering data using an Integer is faster than using a string, SO:
SELECT
	OrderID,
	MONTH(OrderDate)  as month_index
FROM Sales.Orders
WHERE MONTH(OrderDate) = 2;



SELECT * 
FROM Sales.Orders