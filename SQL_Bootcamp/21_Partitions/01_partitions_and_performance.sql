-- Step 1: Create a Partition Function
CREATE PARTITION FUNCTION PartitionByYear (DATE)
AS RANGE LEFT FOR VALUES ('2023-12-31', '2024-12-31', '2025-12-31')

-- Query lists all existing Partition Function
SELECT
	name,
	function_id,
	type,
	type_desc,
	boundary_value_on_right
FROM sys.partition_functions

-- Step 2: Create Filegroups
ALTER DATABASE SalesDB ADD FILEGROUP FG_2023;
-- ALTER DATABASE SalesDB REMOVE FILEGROUP FG_2023;
ALTER DATABASE SalesDB ADD FILEGROUP FG_2024;
ALTER DATABASE SalesDB ADD FILEGROUP FG_2025;
ALTER DATABASE SalesDB ADD FILEGROUP FG_2026;

-- Query lists all existing Filegroups
SELECT *
FROM sys.filegroups
WHERE type = 'FG'

-- Step 3: Add .ndf Files to each Filegroup
ALTER DATABASE SalesDB ADD FILE 
(
	NAME = P_2023, -- Logical Name
	FILENAME = 'C:\PAUL\SQLCourse\git\SQL_Bootcamp\21_Partitions\P_2023.ndf'
) TO FILEGROUP FG_2023;

ALTER DATABASE SalesDB ADD FILE 
(
	NAME = P_2024, -- Logical Name
	FILENAME = 'C:\PAUL\SQLCourse\git\SQL_Bootcamp\21_Partitions\P_2024.ndf'
) TO FILEGROUP FG_2024;

ALTER DATABASE SalesDB ADD FILE 
(
	NAME = P_2025, -- Logical Name
	FILENAME = 'C:\PAUL\SQLCourse\git\SQL_Bootcamp\21_Partitions\P_2025.ndf'
) TO FILEGROUP FG_2025;

ALTER DATABASE SalesDB ADD FILE 
(
	NAME = P_2026, -- Logical Name
	FILENAME = 'C:\PAUL\SQLCourse\git\SQL_Bootcamp\21_Partitions\P_2026.ndf'
) TO FILEGROUP FG_2026;


-- Step 4: Create Partition Scheme
CREATE PARTITION SCHEME SchemePartitionByYear
AS PARTITION PartitionByYear
TO (FG_2023, FG_2024, FG_2025, FG_2026)


-- Step 5: Create the Partitioned Table
CREATE TABLE Sales.Orders_Partitioned
(
	OrderID INT,
	OrderDate DATE,
	Sales INT
) ON SchemePartitionByYear (OrderDate)


-- Step 6: Insert data into the partitioned table
INSERT INTO Sales.Orders_Partitioned VALUES (1, '2023-05-15', 100);
INSERT INTO Sales.Orders_Partitioned VALUES (2, '2024-07-20', 50);
INSERT INTO Sales.Orders_Partitioned VALUES (3, '2025-12-31', 29);

SELECT * FROM Sales.Orders_Partitioned;