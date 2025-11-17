USE Northwind;

SELECT 
s.CompanyName as 'Name of the company', 
s.ContactName as 'Contact Name',
SUBSTRING(s.ContactName, 1,  CHARINDEX(' ', s.ContactName) -1) AS	'First name', 
SUBSTRING(s.ContactName, CHARINDEX(' ', s.ContactName) + 1, LEN(s.ContactName) - CHARINDEX(' ', s.ContactName)) AS 'Last name', 
p.ProductName as 'The name of the product', 
c.CategoryName as 'Category name', 
(s.Address + ', ' + s.City + ', ' + s.PostalCode) as 'AddressCity' 
FROM Products as p
INNER JOIN Suppliers as s ON p.SupplierID = s.SupplierID
INNER JOIN Categories as c on p.CategoryID = c.CategoryID;