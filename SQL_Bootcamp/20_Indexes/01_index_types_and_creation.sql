SELECT
*
FROM Sales.DBCustomers
WHERE CustomerID = 1
-- Heap Method

CREATE CLUSTERED INDEX idx_DBCustomers_CustomerID 
ON Sales.DBCustomers (CustomerID)

 -- DROP INDEX idx_DBCustomers CustomerID ON Sales.DBCustomers

 SELECT * FROM Sales.DBCustomers
 WHERE FirstName = 'Anna';

 CREATE NONCLUSTERED INDEX idx_DBCustomers_LastName
 ON Sales.DBCustomers (LastName)

 CREATE INDEX idx_DBCustomers_FirstName
 ON Sales.DBCustomers (FirstName)

 CREATE INDEX idx_DBCustomers_CountryScore
 ON Sales.DBCustomers(Country,Score
 -- Composite Index

 SELECT * FROM Sales.DBCustomers
 WHERE Score > 500 AND Country = 'USA' -- It's not using the index
 
 SELECT * FROM Sales.DBCustomers
 WHERE Country = 'USA' AND Score > 500 -- It's using the index

 SELECT * FROM Sales.DBCustomers
 WHERE Country = 'USA' -- It's not using the index
 
 SELECT * FROM Sales.DBCustomers
 WHERE Country = 'USA' AND Score > 500 -- It's using the index because Country is the LEFT Column
 

