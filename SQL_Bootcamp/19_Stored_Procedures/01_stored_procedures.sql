-- Step 1: Write a Query
-- For US Customers, find the total number of customers and the average score
SELECT 
	COUNT(*) AS TotalCustomers,
	AVG(Score) AS AvgScore
FROM Sales.Customers
WHERE Country = 'USA';


-- Step 2: Turning the Query Into a Stored Procedure
CREATE OR ALTER PROCEDURE GetCustomerSummary
AS
BEGIN
	SELECT 
		COUNT(*) AS TotalCustomers,
		AVG(Score) AS AvgScore
	FROM Sales.Customers
	WHERE Country = 'USA';
END;


-- Step 3: Execute the Stored Procedure
EXEC GetCustomerSummary;


-- Step 4: Create a Stored Procedure for German Customers
CREATE OR ALTER PROCEDURE GetCustomerSummaryGermany
AS
BEGIN
	SELECT 
		COUNT(*) AS TotalCustomers,
		AVG(Score) AS AvgScore
	FROM Sales.Customers
	WHERE Country = 'Germany';
END;


-- Execute the Stored Procedure
EXEC GetCustomerSummaryGermany;

-- Step 5: Using Parameters
CREATE OR ALTER PROCEDURE GetCustomerSummary
	@Country NVARCHAR(50) = 'USA'
AS
BEGIN
	BEGIN TRY

		DECLARE @TotalCustomers INT;
		DECLARE @AvgScore FLOAT;

		-- ===============================
		-- Step 1: Prepare & Cleanup Data
		-- ===============================
		IF EXISTS (
			SELECT 1
			FROM Sales.Customers
			WHERE Score IS NULL 
				AND Country = @Country
		)
		BEGIN
			PRINT ('Updating NULL Scores to 0');

			UPDATE Sales.Customers
			SET Score = 0
			WHERE Score IS NULL 
				AND Country = @Country;
		END
		ELSE
		BEGIN
			PRINT ('No NULL Scores found');
		END;

		-- =================================
		-- Step 2: Generating Sumary Reports
		-- =================================
		-- Calculate Total Customers and Average Score for specific Country
		SELECT 
			@TotalCustomers = COUNT(*),
			@AvgScore = AVG(Score)
		FROM Sales.Customers
		WHERE Country = @Country;

		PRINT 'Total Customers from ' + @Country + ':' + CAST(@TotalCustomers AS NVARCHAR);
		PRINT 'AverageScore from ' + @Country + ':' + CAST(@AvgScore AS NVARCHAR);


		-- Calculate Total Number of Orders and Total Sales for specific Country
		SELECT 
			COUNT(OrderID) AS TotalOrders,
			SUM(Sales) AS TotalSales
		FROM Sales.Orders o
		JOIN Sales.Customers c
			ON c.CustomerID = o.CustomerID
		WHERE c.Country = @Country;

	END TRY
	BEGIN CATCH
		PRINT ('An error occured.');
		PRINT ('Error Message: ' + ERROR_MESSAGE());
	END CATCH
END


-- Execute the Stored Procedure with Different Countries
EXEC GetCustomerSummary @Country = 'Germany';
EXEC GetCustomerSummary @Country = 'USA';


-- Delete the German Customers Stored Procedure
DROP PROCEDURE GetCustomerSummaryGermany;



