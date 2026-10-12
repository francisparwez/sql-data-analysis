-- Create the Project 3 database
CREATE DATABASE Project3_SQL_Data_Analysis;
GO

USE Project3_SQL_Data_Analysis;
GO

-- Create a table for the cleaned dataset
CREATE TABLE dbo.cleaned_dataset (
    OrderID          VARCHAR(20),
    [Date]            DATE,
    CustomerID        VARCHAR(20),
    Product           VARCHAR(100),
    Quantity          INT,
    UnitPrice         DECIMAL(12, 2),
    ShippingAddress   VARCHAR(255),
    PaymentMethod     VARCHAR(50),
    OrderStatus       VARCHAR(50),
    TrackingNumber    VARCHAR(50),
    ItemsInCart       INT,
    CouponCode        VARCHAR(50),
    ReferralSource    VARCHAR(100),
    TotalPrice        DECIMAL(12, 2)
);
GO

BULK
INSERT
    dbo.cleaned_dataset
FROM 'C:\Users\franc\OneDrive\Desktop\DATA SCIENCE\Decode Labs INTERNSHIP\Project 3 SQL Data Analysis\sql-data-analysis\data\input\cleaned_dataset.csv'
WITH (
        FORMAT = 'CSV',
        FIRSTROW = 2,
        FIELDQUOTE = '"',
        CODEPAGE = '65001',
        TABLOCK
    );
GO


-- Check the number of imported records
SELECT COUNT(*) AS TotalRecords
FROM dbo.cleaned_dataset;

-- Preview the imported data
SELECT TOP 10 *
FROM dbo.cleaned_dataset;

-- Check the column structure and data types
EXEC sp_help 'dbo.cleaned_dataset';


-- Check for duplicate OrderIDs
SELECT
    OrderID,
    COUNT(*) AS RecordCount
FROM dbo.cleaned_dataset
GROUP BY OrderID
HAVING COUNT(*) > 1;

-- Check for missing OrderIDs
SELECT COUNT(*) AS MissingOrderIDs
FROM dbo.cleaned_dataset
WHERE OrderID IS NULL;

-- Validate the TotalPrice calculation
SELECT COUNT(*) AS PriceMismatches
FROM dbo.cleaned_dataset
WHERE ABS(
    TotalPrice - (Quantity * UnitPrice)
) > 0.01;