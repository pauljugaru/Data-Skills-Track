-- 1. Find the total sales for each product
-- 2. Additionaly provide details such OrderID, OrderDate
-- 3. Find the total sales across all orders
-- 4. Find the total sales for each combinations of product and order status
SELECT
	OrderID,
	OrderDate,
	ProductID,
	Sales,
	OrderStatus,
	SUM(Sales) OVER (PARTITION BY ProductID) as TotalSalesByProduct,
	SUM(Sales) OVER() as TotalSales,
	SUM(Sales) OVER (PARTITION BY ProductID, OrderStatus) as TotalSalesByProductAndStatus
FROM Sales.Orders;	


-- RANK each order based on their sales from the highest to lowest
-- Additionaly provide informations such OrderID, OrderDate
SELECT
	OrderID,
	OrderDate,
	Sales,
	RANK() OVER(ORDER BY Sales DESC) RankSales
FROM Sales.Orders;


-- Find the total sales for each order status, only for	two products 101 and 102
SELECT
	OrderID,
	OrderDate,
	OrderStatus,
	ProductID,
	Sales,
	SUM(Sales) OVER(PARTITION BY OrderStatus) TotalSales
FROM Sales.Orders
WHERE ProductID IN (101,102);


-- Rank Customers based on their total sales
SELECT 
	CustomerID,
	SUM(Sales) TotalSales,
	RANK() OVER (ORDER BY SUM(Sales) DESC) RankCustomers
FROM Sales.Orders
GROUP BY CustomerID;	