USE StagingDatabase
GO
SET DATEFORMAT DMY;
GO
DROP TABLE IF EXISTS dbo.extractedPricesClean
GO

CREATE TABLE dbo.extractedPricesClean(
DateAvg DATE NOT NULL,
PriceAvg DECIMAL(10,2) NOT NULL,
PriceMin DECIMAL(10,2) NOT NULL
)
GO

INSERT INTO dbo.extractedPricesClean(DateAvg, PriceAvg, PriceMin)
SELECT 
TRY_CAST(REPLACE(DateAvg, '.','-') AS DATE),
ISNULL(TRY_CAST(REPLACE(PriceAvg,',','.') AS DECIMAL(10,2)), 0),
ISNULL(TRY_CAST(REPLACE(PriceMin, ',', '.') AS DECIMAL(10,2)), 0)
FROM dbo.extractedPrices
WHERE 
ISDATE(DateAvg) = 1;