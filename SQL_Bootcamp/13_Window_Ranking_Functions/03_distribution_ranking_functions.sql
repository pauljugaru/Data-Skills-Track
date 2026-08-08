-- Find the products that fall within the highest 40% of prices
SELECT * FROM Sales.Products;
SELECT 
	*,
	CONCAT(DistRank * 100, '%') DistRankPerc
FROM
(
	SELECT 
		Product,
		Price,
		CUME_DIST() OVER(ORDER BY Price DESC) DistRank
	FROM Sales.Products
)t WHERE DistRank <= 0.4

--
SELECT 
	OrderID,
	Sales,
	NTILE(1) OVER(ORDER BY Sales DESC) NTILE1,
	NTILE(2) OVER(ORDER BY Sales DESC) NTILE2,
	NTILE(5) OVER(ORDER BY Sales DESC) NTILE5,
	NTILE(7) OVER(ORDER BY Sales DESC) NTILE7
FROM Sales.Orders;

-- Segment all orders into 3 categories: high, medium and low sells (Data Analyst exercise)
SELECT 
	*,
	CASE 
		WHEN Buckets = 1 THEN 'High'
		WHEN Buckets = 2 THEN 'Medium'
		WHEN Buckets = 3 THEN 'Low'
	END Category
FROM
(
	SELECT
		OrderID,
		Sales,
		NTILE(3) OVER(ORDER BY Sales DESC) Buckets
	FROM Sales.Orders
)t


-- In order to export the data, divide the orders into 2 groups. (Data Engineer exercise)
SELECT 
*,
NTILE(2) OVER(ORDER BY OrderID) Buckets
FROM Sales.Orders;
