-- THERE IS A MISTAKE IN FIXED PRICES ID=5	2020-04-01	2021-08-31 (THIS SHOULD BE 2020-08-31)
UPDATE extractedFixedPrices
SET enddate = '2020-08-31'
WHERE idPrices=5;
-- QUERY SOLVE

USE StagingDatabase;

-- VARIABLES FOR THE LOOP
DECLARE 
	@CurrentDate	DATE,
	@EndDate		DATE;

-- SETTING THE DATES
SET @CurrentDate	= '1 January 2015';
SET @EndDate		= '31 December 2023';

-- TABLE FOR PRICES IN MONTHLY INTERVALS REFRESH
DROP TABLE IF EXISTS TempFixedPriceTable;

-- TABLE FOR PRICES IN MONTHLY INTERVALS
CREATE TABLE TempFixedPriceTable (
TimePeriod Varchar(20),
Price float
)

-- GO THROUGH EVERY MONTH BETWEEN 2015 - 2023
WHILE @CurrentDate < @EndDate
BEGIN	

	-- INSERT PRICE FOR SPECIFIC MONTH INTO THE TABLE
	INSERT INTO TempFixedPriceTable(TimePeriod, Price)
	SELECT FORMAT(@CurrentDate, 'yyyy MMMM') as 'Period', price as 'Price' FROM extractedFixedPrices
	WHERE @CurrentDate BETWEEN startdate AND enddate;

	-- NEXT MONTH
	SET @CurrentDate = DATEADD(month, 1, @CurrentDate);
END

-- DROP VIEW IF EXISTS FixedPricesInMonthlyIntervals;
-- DROP TABLE IF EXISTS TempFixedPriceTable;

-- CREATE VIEW FixedPriceInMonthlyIntervals AS SELECT * FROM TempFixedPriceTable;
-- SELECT * FROM FixedPriceInMonthlyIntervals;