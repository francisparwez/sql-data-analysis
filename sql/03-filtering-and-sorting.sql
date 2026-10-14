/*
Project 3: SQL Data Analysis
Task 4: Filtering and Sorting

Purpose:
Filter records and sort query results to answer
specific questions about the order dataset.

Database: Project3_SQL_Data_Analysis
Table: dbo.cleaned_dataset

Tools:
Microsoft SQL Server and SSMS
*/

USE Project3_SQL_Data_Analysis;
GO

-- Confirm that the correct database is selected
SELECT DB_NAME () AS CurrentDatabase;
GO

-- Check that the source table is available
SELECT COUNT(*) AS TotalRecords FROM dbo.cleaned_dataset;
GO

-- Task 4.1: Find orders with a total price greater than 1000
SELECT
    OrderID,
    [Date],
    Product,
    Quantity,
    TotalPrice
FROM dbo.cleaned_dataset
WHERE TotalPrice > 1000;
GO

-- Task 4.2: Find orders with a total price equal to 500
SELECT OrderID, Product, TotalPrice
FROM dbo.cleaned_dataset
WHERE
    TotalPrice = 500;
GO

-- Task 4.3: Find orders with a quantity less than 3
SELECT
    OrderID,
    Product,
    Quantity,
    TotalPrice
FROM dbo.cleaned_dataset
WHERE
    Quantity < 3;
GO

-- Task 4.4: Find orders with a unit price greater than or equal to 600
SELECT
    OrderID,
    Product,
    UnitPrice,
    TotalPrice
FROM dbo.cleaned_dataset
WHERE
    UnitPrice >= 600;
GO

-- Task 4.5: Find orders with quantity of at least 3
-- and a total price greater than 1000
SELECT
    OrderID,
    [Date],
    Product,
    Quantity,
    TotalPrice
FROM dbo.cleaned_dataset
WHERE Quantity >= 3
  AND TotalPrice > 1000;
GO

-- Task 4.6: Find orders paid by Credit Card or Online
SELECT
    OrderID,
    [Date],
    Product,
    PaymentMethod,
    OrderStatus,
    TotalPrice
FROM dbo.cleaned_dataset
WHERE PaymentMethod = 'Credit Card'
   OR PaymentMethod = 'Online';
GO

-- Task 4.7: Find products whose names begin with P
SELECT
    OrderID,
    Product,
    Quantity,
    UnitPrice,
    TotalPrice
FROM dbo.cleaned_dataset
WHERE
    Product LIKE 'P%';
GO

-- Task 4.8: Find orders with selected order statuses
SELECT
    OrderID,
    [Date],
    Product,
    OrderStatus,
    TotalPrice
FROM dbo.cleaned_dataset
WHERE OrderStatus IN ('Shipped', 'Delivered', 'Returned');
GO

-- Task 4.9: Find orders with a total price between 500 and 1000
SELECT
    OrderID,
    [Date],
    Product,
    Quantity,
    UnitPrice,
    TotalPrice
FROM dbo.cleaned_dataset
WHERE TotalPrice BETWEEN 500 AND 1000;
GO

-- Task 4.10: Display the 10 most expensive orders
SELECT TOP 10
    OrderID,
    [Date],
    Product,
    Quantity,
    UnitPrice,
    TotalPrice
FROM dbo.cleaned_dataset
ORDER BY TotalPrice DESC;
GO

-- Task 4.11: Display the 10 earliest orders
SELECT TOP 10
    OrderID,
    [Date],
    Product,
    OrderStatus,
    TotalPrice
FROM dbo.cleaned_dataset
ORDER BY [Date] ASC;
GO

-- Task 4.12: Find expensive shipped or delivered orders
SELECT
    OrderID,
    [Date],
    Product,
    OrderStatus,
    TotalPrice
FROM dbo.cleaned_dataset
WHERE OrderStatus IN ('Shipped', 'Delivered')
  AND TotalPrice > 1000
ORDER BY TotalPrice DESC;
GO

-- Task 4.13: Find high-value credit card or online orders
SELECT
    OrderID,
    [Date],
    Product,
    PaymentMethod,
    TotalPrice
FROM dbo.cleaned_dataset
WHERE (PaymentMethod = 'Credit Card'
       OR PaymentMethod = 'Online')
  AND TotalPrice > 1000
ORDER BY TotalPrice DESC;
GO

-- Task 4.14: Find orders placed in January 2024
SELECT
    OrderID,
    [Date],
    Product,
    OrderStatus,
    TotalPrice
FROM dbo.cleaned_dataset
WHERE [Date] >= '2024-01-01'
  AND [Date] < '2024-02-01'
ORDER BY [Date] ASC;
GO

-- Task 4.15: Find P products paid by credit card or online
SELECT
    OrderID,
    [Date],
    Product,
    PaymentMethod,
    OrderStatus,
    TotalPrice
FROM dbo.cleaned_dataset
WHERE Product LIKE 'P%'
  AND PaymentMethod IN ('Credit Card', 'Online')
ORDER BY TotalPrice DESC;
GO