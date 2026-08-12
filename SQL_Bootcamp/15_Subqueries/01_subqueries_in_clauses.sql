SELECT
DISTINCT TABLE_NAME
FROM INFORMATION_SCHEMA.COLUMNS


-- Scalar Query
SELECT
AVG (Sales) AvgSales
FROM Sales.Orders;

-- Row Query
SELECT
CustomerID
FROM Sales.Orders;


-- Table Query
SELECT 
*
FROM Sales.Orders;


-- Find the product that have a price higher than the average price of all products
SELECT
*
FROM
( 
	SELECT
		ProductID,
		Price,
		AVG(Price) OVER() AvgPrice
	FROM Sales.Products
)t WHERE Price > AvgPrice


-- Rank customers based on their total amount of sales
SELECT
*,
RANK() OVER (ORDER BY TotalSales DESC) Ranking
FROM
(
	SELECT 
		CustomerID,
		SUM(Sales) TotalSales
	FROM Sales.Orders
	GROUP BY CustomerID
)t


-- Select the productIDs, names, prices and total number of orders
SELECT 
	ProductID,
	Product,
	Price,
	(SELECT COUNT(OrderID) FROM Sales.Orders) TotalOrders
FROM Sales.Products;


-- Show all customer details and find the total orders of each customer
SELECT *
FROM Sales.Customers c
LEFT JOIN 
(
	SELECT 
		CustomerID,
		COUNT(*) TotalOrders
	FROM Sales.Orders
	GROUP BY CustomerID
) o
ON c.CustomerID = o.CustomerID


-- Find the products that have a price higher than average price of all products
SELECT * FROM Sales.Products
SELECT 
	ProductID,
	Price,
	(SELECT AVG(Price) FROM Sales.Products) as AvgPrice
FROM Sales.Products
WHERE Price > (SELECT AVG(Price) FROM Sales.Products) 