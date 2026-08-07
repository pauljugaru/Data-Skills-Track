/* Generate a report showing the total sales for each category:
- High: if the sales higher than 50
- Medium: if the sales between 20 and 50
- Low: if the sales equal or lower than 20
*/

SELECT 
	Category,
	SUM(Sales) AS TotalSales
	FROM
	(
		SELECT 
			Sales,
			CASE
				WHEN Sales > 50 THEN 'High'
				WHEN Sales > 20 THEN 'Medium'
				ELSE 'Low'
			END AS Category
		FROM Sales.Orders
	)t
	GROUP BY Category
	ORDER BY TotalSales DESC;
