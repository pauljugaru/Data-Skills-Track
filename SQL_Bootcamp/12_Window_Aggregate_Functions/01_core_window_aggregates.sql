-- Find the total number of orders
-- Additionally provide details such order id & order date
SELECT 
	OrderID,
	OrderDate,
	COUNT(*) OVER() TotalOrders
FROM Sales.Orders; 


-- Find the total number of orders for each customer
SELECT 
	CustomerID,
	COUNT(*) OVER(PARTITION BY CustomerID) TotalOrders
FROM Sales.Orders;


-- Find the total number of customers 
-- Additionally provive all customers details
SELECT 
	*,
	COUNT(*) OVER() NumberOfCustomers
FROM Sales.Customers;


-- Find the total number of scores for the customers
SELECT 
	*,
	COUNT(Score) OVER() ScoresNumber
FROM Sales.Customers;


-- Check whether the table 'orders' contains any duplicates row
SELECT
	OrderID,
	COUNT(*) OVER(PARTITION BY OrderID) CheckPK
FROM Sales.Orders;

SELECT *
FROM (
	SELECT 
		OrderID,
		COUNT(*) OVER(PARTITION BY OrderID) CheckPK 
	FROM Sales.OrdersArchive
)t WHERE CheckPK > 1


-- Find the total sales across all orders and the total sales for each product.
-- Additionally, provide details such as orderID, orderDate
SELECT 
	OrderID,
	OrderDate,
	ProductID,
	Sales,
	SUM(Sales) OVER() AS TotalSales,
	SUM(Sales) OVER(PARTITION BY ProductID) AS SalesByProducts
FROM Sales.Orders;


-- Find the percentage contribution of each product's sales to the total sales.
SELECT 
	OrderID,
	ProductID,
	Sales,
	SUM(Sales) OVER() TotalSales,
	ROUND(CAST(Sales AS Float) / SUM(Sales) OVER() * 100, 2) AS Contribution
FROM Sales.Orders;


-- Find the average sales across all orders 
-- Add find the average sales for each product
-- Additionally, provide informations such order id, order date
SELECT 
	OrderID,
	OrderDate,
	ProductID,
	Sales,
	AVG(Sales) OVER() SalesAvg,
	AVG(Sales) OVER(PARTITION BY ProductID) ProductSalesAvg
FROM Sales.Orders;


-- Find the average scores of customers
-- Additionally, provide details such CustomerID and LastName
SELECT 
	CustomerID,
	FirstName,
	LastName,
	Score,
	AVG(Score) OVER() AvgScoreWithNULL,
	AVG(COALESCE(Score,0)) OVER() AvgScore
FROM Sales.Customers;


-- Find all orders where sales are higher than the average sales across all orders with FLAGS
SELECT
	OrderID,
	Sales,
	AVG(Sales) OVER() AvgSales,
	CASE 
		WHEN Sales > AVG(Sales) OVER() THEN 1
		ELSE 0
	END AS Flag
FROM Sales.Orders;


-- Find all orders where sales are higher than the average sales across all orders WITHOUT FLAGS
SELECT *
FROM
(
	SELECT
		OrderID,
		ProductID,
		Sales,
		AVG(Sales) OVER() AvgSales
	FROM Sales.Orders
)t WHERE Sales > AvgSales;


-- Find the highest and the lowest sales of all orders
-- Find the highest and the lowest sales for each product
-- Additionally, provide details such as orderID, orderDate	
SELECT 
	OrderID,
	OrderDate,
	ProductID,
	Sales,
	MIN(Sales) OVER() MinSale,
	MAX(Sales) OVER() MaxSale,
	MIN(Sales) OVER(PARTITION BY ProductID) MinSaleProduct,
	MAX(Sales) OVER(PARTITION BY ProductID) MaxSaleProduct
FROM Sales.Orders;


-- Show the employees with the highest salary
SELECT
*
FROM
(
	SELECT
		*,
		MAX(Salary) OVER() MaxSalary
	FROM Sales.Employees
)t WHERE Salary = MaxSalary;


-- Find the deviation of each sale from both the minimum and maximum sales amounts.
SELECT 
	OrderID,
	ProductID,
	Sales,
	MIN(Sales) OVER() MinSale,
	MAX(Sales) OVER() MaxSale,
	ABS(MIN(Sales) OVER() - Sales) DevMinSale,
	ABS(MAX(Sales) OVER() - Sales) DevMaxSale
FROM Sales.Orders;