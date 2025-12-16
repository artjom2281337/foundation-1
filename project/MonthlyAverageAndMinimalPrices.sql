-- DROP VIEW MonthlyPrices;

CREATE VIEW MonthlyPrices AS
SELECT 
	DateAvg as 'Date',
	PriceAvg as 'Average price',
	PriceMin as 'Minimal price'
FROM extractedPricesClean;

-- SELECT * FROM MonthlyPrices;