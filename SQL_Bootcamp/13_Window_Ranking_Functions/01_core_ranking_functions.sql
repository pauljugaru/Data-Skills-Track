-- Rank the orders based on their sales from highest to lowest with ROW_NUMBER
SELECT 
	OrderID,
	Sales,
	ROW_NUMBER() OVER (ORDER BY Sales DESC) Ranking
FROM Sales.Orders;


-- Rank the orders based on their sales from highest to lowest with RANK
SELECT 
	OrderID,
	Sales,
	RANK() OVER (ORDER BY Sales DESC) Ranking
FROM Sales.Orders;


-- Rank the orders based on their sales from highest to lowest with DENSE_RANK
SELECT 
	OrderID,
	Sales,
	DENSE_RANK() OVER (ORDER BY Sales DESC) Ranking
FROM Sales.Orders;