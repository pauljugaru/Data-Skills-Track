-- Combine the data from employees and customers into one table
SELECT 
	FirstName,
	LastName
FROM Sales.Customers

UNION

SELECT 
	FirstName,
	LastName
FROM Sales.Employees;


-- Combine the data from employees and customers into one table, including duplicates
SELECT 
	FirstName,
	LastName
FROM Sales.Customers

UNION ALL

SELECT 
	FirstName,
	LastName
FROM Sales.Employees;


-- Find the employees who are not customers at the same time
SELECT 
	FirstName,
	LastName
FROM Sales.Employees

EXCEPT

SELECT 
	FirstName,
	LastName
FROM Sales.Customers;