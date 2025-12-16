USE StagingDatabase

CREATE TABLE dbo.extractedPricesClean(
DateAvg DATE NOT NULL,
PriceAvg DECIMAL(10,2) NOT NULL,
DateMin DATE NOT NULL,
PriceMin DECIMAL(10,2) NOT NULL
)

INSERT INTO dbo.extractedPricesClean(DateAvg, PriceAvg, DateMin, PriceMin)
SELECT 
TRY_CAST(REPLACE(DateAvg, '.','-') AS DATE),
TRY_CAST(REPLACE(PriceAvg,',','.') AS DECIMAL(10,2)),
TRY_CAST(REPLACE(DateMin, '.', '-') AS DATE),
TRY_CAST(REPLACE(PriceMin, ',', '.') AS DECIMAL(10,2))
FROM dbo.extractedPrices
WHERE 
ISDATE(DateAvg) = 1 
AND TRY_CAST(REPLACE(PriceAvg,',','.') AS DECIMAL(10,2)) IS NOT NULL 
AND TRY_CAST(REPLACE(PriceMin, ',', '.') AS DECIMAL(10,2)) IS NOT NULL;