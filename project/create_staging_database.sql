USE master;

DROP DATABASE IF EXISTS StagingDatabase;
CREATE DATABASE StagingDatabase;

USE StagingDatabase;

CREATE TABLE [dbo].[extractedPrices](
	[DateAvg] [varchar](100) NULL,
	[PriceAvg] [varchar](100) NULL,
	[DateMin] [varchar](100) NULL,
	[PriceMin] [varchar](100) NULL
);

CREATE TABLE [dbo].[extractedContact](
	[id] [int] NULL,
	[firstname] [varchar](45) NULL,
	[lastname] [varchar](45) NULL,
	[address] [varchar](100) NULL,
	[zipcode] [varchar](45) NULL,
	[city] [varchar](45) NULL,
	[email] [varchar](45) NULL,
	[customer_id] [int] NULL,
	[country_id] [int] NULL
);

CREATE TABLE [dbo].[extractedContract](
	[id] [int] NULL,
	[startdate] [date] NULL,
	[enddate] [date] NULL,
	[interval] [int] NULL,
	[customer_id] [int] NULL,
	[contracttype_id] [int] NULL,
	[fixedprice] [decimal](6, 3) NULL
);

CREATE TABLE [dbo].[extractedContractType](
	[id] [int] NULL,
	[name] [varchar](45) NULL
);

CREATE TABLE [dbo].[extractedCountry](
	[id] [int] NULL,
	[countryname] [varchar](45) NULL
);

CREATE TABLE [dbo].[extractedCustomer](
	[id] [int] NULL,
	[customername] [varchar](200) NULL,
	[country_id] [int] NULL
);

CREATE TABLE [dbo].[extractedFixedPrices](
	[idPrices] [int] NULL,
	[startdate] [date] NULL,
	[enddate] [date] NULL,
	[price] [decimal](6, 3) NULL
);