-- Retrieve employee details with gender displayed as full text
SELECT 
	EmployeeID,
	FirstName,
	LastName,
	Department,
	BirthDate,
	CASE
		WHEN Gender = 'M' THEN 'Masculine'
		ELSE 'Feminine'
	END as FullGender,
	Salary,
	ManagerID
FROM Sales.Employees;


-- Retrieve customers details with abbreviated country code
SELECT DISTINCT Country
FROM Sales.Customers;

SELECT 
	CustomerID,
	FirstName,
	LastName,
	Country,
	CASE 
		WHEN Country = 'Germany' THEN 'DE'
		WHEN Country = 'USA' THEN 'US'
		ELSE 'n/a'
	END CountryAbbreviationFullForm,

	CASE Country
		WHEN 'Germany' THEN 'DE'
		WHEN 'USA' THEN 'US'
		ELSE 'n/a'
	END CountryAbbreviationQuickForm
FROM Sales.Customers;
	