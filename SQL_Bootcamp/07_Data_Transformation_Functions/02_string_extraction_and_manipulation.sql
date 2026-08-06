-- Remove dashes (-) from a phone number
SELECT 
	'123-456-7890' AS phone_number,
	REPLACE('123-456-7890','-','') AS clean_phone_number;


-- Replace File Extence from txt to csv
SELECT
	'report.txt' AS txt_report,
	REPLACE('report.txt', '.txt', '.csv') AS csv_report;


-- Retrieve the first two characters of each first name
SELECT 
	first_name,
	LEFT(TRIM(first_name), 2) AS first_2_char
FROM customers;


-- Retrieve the last character of each first name
SELECT 
	first_name,
	RIGHT(TRIM(first_name), 1) AS last_char
FROM customers;


-- Retrieve a list of customer's first names removing the first character
SELECT
	first_name,
	SUBSTRING(TRIM(first_name),2,LEN(first_name)) AS without_first_letter
FROM customers;