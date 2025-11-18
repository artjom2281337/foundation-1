use Northwind
select top 10*
from Customers;
update Customers
set CompanyName = 'Shuvojyoti Singha',
	ContactName = 'Hamk 2nd Year',
	ContactTitle = 'Student',
	Address = 'Visäkylä',
	City = 'Hameenlinna',
	Country = 'Finland'
where CustomerId = 'ALFKI';

update Customers
set CompanyName = 'Hazard',
	ContactName = 'Kaos',
	ContactTitle = 'Student',
	Address = 'Hammenkatu 1',
	City = 'Hameenlinna',
	Country = 'Finland'
where CustomerId = 'ANATR';