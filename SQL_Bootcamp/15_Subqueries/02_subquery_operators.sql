-- Show the details of orders made by customers in Germany
SELECT * 
FROM Sales.Orders
WHERE CustomerID IN 
				(SELECT CustomerID 
				FROM Sales.Customers
				WHERE Country = 'Germany');


-- Find female employees whose salaries are greater than male
Select * from Sales.Employees

SELECT 
	EmployeeID,
	FirstName,
	LastName,
	Gender,
	Salary
FROM Sales.Employees
WHERE Gender = 'F' AND Salary >  ANY(SELECT Salary FROM Sales.Employees WHERE Gender = 'M') 
-- For 'greater than ALL males' i have to use ALL(...) 