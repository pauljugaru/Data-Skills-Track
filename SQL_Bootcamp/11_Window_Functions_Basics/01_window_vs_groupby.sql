/* -- Find the total number of customers
SELECT *
FROM orders;

SELECT
	COUNT(customer_id) AS Customers
FROM orders;


-- Find the total sales of all orders
SELECT 
	SUM(sales) AS TotalSales
FROM orders;


-- Find the average sales of all orders
SELECT 
	AVG(sales) AS AvgSales
FROM orders;


-- Find the highest sales of all orders
SELECT 
	MAX(sales) AS HighestSales
FROM orders;


-- Find the lowest sales of all orders
SELECT 
	MIN(sales) AS LowestSales
FROM orders;
*/

-- Find the total sales across all orders
SELECT 
	SUM(Sales) TotalSales
FROM Sales.Orders;

SELECT * FROM Sales.Orders;


-- Find the total sales for each product
SELECT
	ProductID,
	SUM(Sales) TotalSales
FROM Sales.Orders
GROUP BY ProductID;


-- Find the total sales for each product
-- Additionaly provide details such OrderID, OrderDate
SELECT
	OrderID,
	OrderDate, 
	ProductID,
	SUM(Sales) OVER(PARTITION BY ProductID) TotalSalesByProducts
FROM Sales.Orders