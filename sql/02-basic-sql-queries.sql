/*
Project 3: SQL Data Analysis
Task 3: Basic SQL Queries

Purpose:
Practise retrieving data from the cleaned dataset
using basic SELECT queries.

Database: Project3_SQL_Data_Analysis
Table: dbo.cleaned_dataset

Tools:
Microsoft SQL Server and SSMS
*/

USE Project3_SQL_Data_Analysis;
GO

-- Check that we are using the correct database
SELECT DB_NAME () AS CurrentDatabase;
GO

-- Task 3.1: Retrieve all columns and rows
SELECT * FROM dbo.cleaned_dataset;
GO

-- Task 3.2: Select specific columns
SELECT
    OrderID,
    [Date],
    Product,
    Quantity,
    UnitPrice,
    TotalPrice
FROM dbo.cleaned_dataset;
GO

-- Task 3.3: Use aliases for readable column names
SELECT
    OrderID AS [Order ID],
    [Date] AS [Order Date],
    Product AS [Product Name],
    Quantity AS [Items Purchased],
    UnitPrice AS [Unit Price],
    TotalPrice AS [Order Total]
FROM dbo.cleaned_dataset;
GO

-- Task 3.4: Retrieve a sample of 10 records
SELECT TOP 10
    OrderID,
    [Date],
    Product,
    Quantity,
    TotalPrice
FROM dbo.cleaned_dataset;
GO

/*
Task 3 Summary — Basic SQL Queries

Completed:
1. Retrieved all columns using SELECT *.
2. Selected specific columns.
3. Used aliases to improve column headings.
4. Retrieved a sample using TOP 10.
5. Viewed customer and order details.
6. Viewed product prices and quantities.
7. Viewed order dates and delivery details.

The queries above return records from the existing
dbo.cleaned_dataset table. No data was modified.
*/