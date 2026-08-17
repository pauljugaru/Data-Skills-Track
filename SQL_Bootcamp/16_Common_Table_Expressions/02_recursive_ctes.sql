/*
-- Generate a Sequence of Numbers from 1 to 20
WITH CTE_Generate AS
(
	SELECT
	1 AS Number
	UNION ALL
	-- Recursive Query
	SELECT
	Number + 1
	FROM CTE_Generate
	WHERE Number < 20
)
-- Main Query
SELECT *
FROM CTE_Generate
OPTION (MAXRECURSION 20)
*/

-- Show the employee hierarchy by displaying each employee's level within the organization
WITH CTE_Employee_Hierarchy AS
(
-- Anchor Query
	SELECT 
		EmployeeID,
		FirstName,
		ManagerID,
		1 AS Level
	FROM Sales.Employees
	WHERE ManagerID IS NULL

	UNION ALL

	SELECT 
		e.EmployeeID,
		e.FirstName,
		e.ManagerID,
		Level + 1
	FROM Sales.Employees e
	INNER JOIN CTE_Employee_Hierarchy AS ceh
	ON e.ManagerID = ceh.EmployeeID
)
SELECT *
FROM CTE_Employee_Hierarchy