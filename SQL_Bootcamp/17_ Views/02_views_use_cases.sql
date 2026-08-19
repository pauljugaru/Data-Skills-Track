-- Provide a view that combines details from orders, products, customers and employees
CREATE VIEW Sales.V_Order_Details AS 
(
	SELECT 
		o.OrderID,
		o.OrderDate,
		p.Product,
		p.Category,
		COALESCE(c.FirstName, ' ') + ' ' + COALESCE(c.LastName, ' ') CustomerName,
		c.Country CustomerCountry,
		COALESCE(e.FirstName, ' ') + ' ' + COALESCE(e.LastName, ' ') SalesName,
		e.Department,
		o.Sales,
		o.Quantity
	FROM Sales.Orders o
	LEFT JOIN Sales.Products p
	ON p.ProductID = o.ProductID
	LEFT JOIN Sales.Customers c
	ON c.CustomerID = o.CustomerID
	LEFT JOIN Sales.Employees e
	ON e.EmployeeID = o.SalesPersonID
);


-- Security USE-CASE (Row-Level-Security):
-- Provide a view for the EU Sales Team that combines details from all tables and excludes data related to USA.
CREATE VIEW Sales.V_Order_Details_EU AS
(
	SELECT 
		o.OrderID,
		o.OrderDate,
		p.Product,
		p.Category,
		COALESCE(c.FirstName, ' ') + ' ' + COALESCE(c.LastName, ' ') CustomerName,
		c.Country CustomerCountry,
		COALESCE(e.FirstName, ' ') + ' ' + COALESCE(e.LastName, ' ') SalesName,
		e.Department,
		o.Sales,
		o.Quantity
	FROM Sales.Orders o
	LEFT JOIN Sales.Products p
	ON p.ProductID = o.ProductID
	LEFT JOIN Sales.Customers c
	ON c.CustomerID = o.CustomerID
	LEFT JOIN Sales.Employees e
	ON e.EmployeeID = o.SalesPersonID
	WHERE c.Country != 'USA'
)