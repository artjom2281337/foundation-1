CREATE VIEW DetailedContract AS
SELECT cu.customername, co.countryname, c.startdate, c.enddate, c.fixedprice
FROM extractedContract AS c
JOIN extractedCustomer AS cu ON cu.id = c.customer_id
JOIN extractedCountry AS co ON cu.country_id = co.id

-- SELECT * FROM DetailedContract;