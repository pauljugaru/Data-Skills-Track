SELECT *
FROM FactResellerSales_HP -- 0.060s Table Scan

SELECT *
FROM FactResellerSales_HP -- 0.022s Table Scan
ORDER BY SalesOrderNumber  -- 0.071s Sort

SELECT *
FROM FactResellerSales    -- 0.053 Clustered Index Scan

SELECT *
FROM FactResellerSales_HP 
WHERE CarrierTrackingNumber = '4911-403C-98'  -- 0.008s Table Scan

SELECT *
FROM FactResellerSales
WHERE CarrierTrackingNumber = '4911-403C-98'  -- After creating NONCLUSTERED 0.000s because it is reading 12 rows instead of +60000

CREATE NONCLUSTERED INDEX idx_FactReseller_CTA
ON FactResellerSales (CarrierTrackingNumber)