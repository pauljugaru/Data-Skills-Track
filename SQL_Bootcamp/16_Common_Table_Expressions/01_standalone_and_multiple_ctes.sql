-- Find the total sales per customer
WITH CTE_TotalSales AS
(
	SELECT 
		CustomerID,
		SUM(Sales) AS TotalSales
	FROM Sales.Orders
	GROUP BY CustomerID
)
-- Step 2: Find the last order date per customer
, CTE_Last_Order AS
(
	SELECT
		CustomerID,
		MAX(OrderDate) AS Last_Order
	FROM Sales.Orders
	GROUP BY CustomerID
)
-- Step 3: Rank Customers based on total sales per customer
, CTE_Customer_Rank AS
( 
	SELECT 
		CustomerID,
		TotalSales,
		RANK() OVER(ORDER BY TotalSales DESC) AS CustomerRank
	FROM CTE_TotalSales
)
-- Step 4: Segment customers based on their total sales
, CTE_Customer_Segment AS
(
	SELECT
		CustomerID,
		CASE WHEN TotalSales > 100 THEN 'HIGH'
			 WHEN TotalSales > 50 THEN 'MEDIUM'
			 ELSE 'LOW'
		END CustomerSegment
	FROM CTE_TotalSales
)

-- Main Query
SELECT 
	c.CustomerID,
	c.FirstName,
	c.LastName,
	cts.TotalSales,
	clo.Last_Order,
	ccr.CustomerRank,
	ccs.CustomerSegment
FROM Sales.Customers c
LEFT JOIN CTE_TotalSales cts
ON cts.CustomerID = c.CustomerID
LEFT JOIN CTE_Last_Order clo
ON clo.CustomerID = c.CustomerID
LEFT JOIN CTE_Customer_Rank ccr
ON ccr.CustomerID = c.CustomerID
LEFT JOIN CTE_Customer_Segment ccs
ON ccs.CustomerID = c.CustomerID
