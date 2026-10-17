-- Project 3: SQL Data Analysis
-- Task 8: Final Presentation and Quality
-- Purpose: Final checks before project submission

USE Project3_SQL_Data_Analysis;
GO

-- Check the total number of records

SELECT COUNT(*) AS TotalRecords FROM dbo.cleaned_dataset;
GO

-- Check the number of columns in the dataset

SELECT COUNT(*) AS TotalColumns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE
    TABLE_SCHEMA = 'dbo'
    AND TABLE_NAME = 'cleaned_dataset';
GO

-- Check for missing OrderID values

SELECT COUNT(*) AS MissingOrderIDs
FROM dbo.cleaned_dataset
WHERE
    OrderID IS NULL;
GO

-- Check for duplicate OrderID values

SELECT OrderID, COUNT(*) AS DuplicateCount
FROM dbo.cleaned_dataset
GROUP BY
    OrderID
HAVING
    COUNT(*) > 1;
GO

-- Check whether TotalPrice matches Quantity * UnitPrice

SELECT
    OrderID,
    Quantity,
    UnitPrice,
    TotalPrice,
    Quantity * UnitPrice AS CalculatedTotal
FROM dbo.cleaned_dataset
WHERE
    ABS(
        TotalPrice - (Quantity * UnitPrice)
    ) > 0.01;
GO

-- Check the earliest and latest order dates

SELECT
    MIN(Date) AS EarliestOrderDate,
    MAX(Date) AS LatestOrderDate,
    COUNT(*) AS TotalRecords
FROM dbo.cleaned_dataset;
GO