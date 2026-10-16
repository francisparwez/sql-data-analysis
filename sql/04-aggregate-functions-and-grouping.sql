/*
Project 3: SQL Data Analysis
Task 5: Aggregate Functions and Grouping

Purpose:
Summarise order data using aggregate functions
and GROUP BY to answer practical questions.

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

-- Check a few records before starting the analysis
SELECT TOP 10
    OrderID,
    [Date],
    Product,
    Quantity,
    UnitPrice,
    TotalPrice,
    PaymentMethod,
    OrderStatus
FROM dbo.cleaned_dataset
ORDER BY [Date] ASC;
GO

-- Task 5.1: Count the number of orders for each product
SELECT Product, COUNT(*) AS NumberOfOrders
FROM dbo.cleaned_dataset
GROUP BY
    Product
ORDER BY NumberOfOrders DESC;
GO

-- Task 5.2: Calculate the total quantity for each product
SELECT Product, SUM(Quantity) AS TotalQuantitySold
FROM dbo.cleaned_dataset
GROUP BY
    Product
ORDER BY TotalQuantitySold DESC;
GO

-- Task 5.3: Calculate the average order value for each product
SELECT Product, AVG(TotalPrice) AS AverageOrderValue
FROM dbo.cleaned_dataset
GROUP BY
    Product
ORDER BY AverageOrderValue DESC;
GO

-- Task 5.4: Find the lowest and highest order value for each product
SELECT
    Product,
    MIN(TotalPrice) AS MinimumOrderValue,
    MAX(TotalPrice) AS MaximumOrderValue
FROM dbo.cleaned_dataset
GROUP BY
    Product
ORDER BY Product;
GO

-- Task 5.5: Calculate total sales value for each product
SELECT Product, SUM(TotalPrice) AS TotalSales
FROM dbo.cleaned_dataset
GROUP BY
    Product
ORDER BY TotalSales DESC;
GO

-- Task 5.6: Count orders by payment method
SELECT PaymentMethod, COUNT(*) AS NumberOfOrders
FROM dbo.cleaned_dataset
GROUP BY
    PaymentMethod
ORDER BY NumberOfOrders DESC;
GO

-- Task 5.7: Calculate total sales by payment method
SELECT PaymentMethod, SUM(TotalPrice) AS TotalSales
FROM dbo.cleaned_dataset
GROUP BY
    PaymentMethod
ORDER BY TotalSales DESC;
GO

-- Task 5.8: Calculate the average order value by payment method
SELECT
    PaymentMethod,
    AVG(TotalPrice) AS AverageOrderValue
FROM dbo.cleaned_dataset
GROUP BY
    PaymentMethod
ORDER BY AverageOrderValue DESC;
GO

-- Task 5.9: Count orders by order status
SELECT OrderStatus, COUNT(*) AS NumberOfOrders
FROM dbo.cleaned_dataset
GROUP BY
    OrderStatus
ORDER BY NumberOfOrders DESC;
GO

-- Task 5.10: Calculate total sales by order status
SELECT OrderStatus, SUM(TotalPrice) AS TotalSales
FROM dbo.cleaned_dataset
GROUP BY
    OrderStatus
ORDER BY TotalSales DESC;
GO

-- Task 5.11: Compare order count and average order value by product
SELECT
    Product,
    COUNT(*) AS NumberOfOrders,
    AVG(TotalPrice) AS AverageOrderValue
FROM dbo.cleaned_dataset
GROUP BY
    Product
ORDER BY NumberOfOrders DESC;
GO

-- Task 5.12: Summarise unit prices by product
SELECT
    Product,
    MIN(UnitPrice) AS MinimumUnitPrice,
    MAX(UnitPrice) AS MaximumUnitPrice,
    AVG(UnitPrice) AS AverageUnitPrice
FROM dbo.cleaned_dataset
GROUP BY
    Product
ORDER BY AverageUnitPrice DESC;
GO

-- Task 5.13: Calculate total quantity by payment method
SELECT
    PaymentMethod,
    SUM(Quantity) AS TotalQuantitySold
FROM dbo.cleaned_dataset
GROUP BY
    PaymentMethod
ORDER BY TotalQuantitySold DESC;
GO

-- Task 5.14: Summarise order activity by month
SELECT
    YEAR([Date]) AS OrderYear,
    MONTH([Date]) AS OrderMonth,
    COUNT(*) AS NumberOfOrders,
    SUM(TotalPrice) AS TotalSales
FROM dbo.cleaned_dataset
GROUP BY
    YEAR([Date]),
    MONTH([Date])
ORDER BY
    OrderYear,
    OrderMonth;
GO

-- Task 5.15: Calculate average quantity by product
SELECT Product, AVG(
        CAST(Quantity AS DECIMAL(10, 2))
    ) AS AverageQuantity
FROM dbo.cleaned_dataset
GROUP BY
    Product
ORDER BY AverageQuantity DESC;
GO

-- Task 5.16: Summarise products by order status
SELECT
    Product,
    OrderStatus,
    COUNT(*) AS NumberOfOrders,
    SUM(TotalPrice) AS TotalSales
FROM dbo.cleaned_dataset
GROUP BY
    Product,
    OrderStatus
ORDER BY Product, TotalSales DESC;
GO

-- Task 5.17: Count the number of distinct products
SELECT COUNT(DISTINCT Product) AS NumberOfProducts
FROM dbo.cleaned_dataset;
GO

-- Task 5.18: Compare average unit prices by product and payment method
SELECT
    Product,
    PaymentMethod,
    AVG(UnitPrice) AS AverageUnitPrice
FROM dbo.cleaned_dataset
GROUP BY
    Product,
    PaymentMethod
ORDER BY Product, AverageUnitPrice DESC;
GO

-- Task 5.19: Count orders by product and order status
SELECT
    Product,
    OrderStatus,
    COUNT(*) AS NumberOfOrders
FROM dbo.cleaned_dataset
GROUP BY
    Product,
    OrderStatus
ORDER BY Product, NumberOfOrders DESC;
GO

-- Task 5.20: Find products with total sales above 180000
SELECT Product, SUM(TotalPrice) AS TotalSales
FROM dbo.cleaned_dataset
GROUP BY
    Product
HAVING
    SUM(TotalPrice) > 180000
ORDER BY TotalSales DESC;
GO

-- Task 5.21: Find payment methods with more than 240 orders
SELECT
    PaymentMethod,
    COUNT(*) AS NumberOfOrders,
    SUM(TotalPrice) AS TotalSales,
    AVG(TotalPrice) AS AverageOrderValue
FROM dbo.cleaned_dataset
GROUP BY
    PaymentMethod
HAVING
    COUNT(*) > 240
ORDER BY NumberOfOrders DESC;
GO

-- Task 5.22: Summarise orders and sales by year
SELECT
    YEAR([Date]) AS OrderYear,
    COUNT(*) AS NumberOfOrders,
    SUM(TotalPrice) AS TotalSales
FROM dbo.cleaned_dataset
GROUP BY YEAR([Date])
ORDER BY OrderYear;
GO

-- Task 5.23: Calculate average order value by status
SELECT
    OrderStatus,
    AVG(TotalPrice) AS AverageOrderValue
FROM dbo.cleaned_dataset
GROUP BY
    OrderStatus
ORDER BY AverageOrderValue DESC;
GO

-- Task 5.24: Find products with more than 170 orders
SELECT Product, COUNT(*) AS NumberOfOrders
FROM dbo.cleaned_dataset
GROUP BY
    Product
HAVING
    COUNT(*) > 170
ORDER BY NumberOfOrders DESC;
GO

-- Task 5.25: Summarise quantity and sales by product
SELECT
    Product,
    SUM(Quantity) AS TotalQuantitySold,
    SUM(TotalPrice) AS TotalSales
FROM dbo.cleaned_dataset
GROUP BY
    Product
ORDER BY TotalSales DESC;
GO

-- Task 5.26: Calculate overall order statistics
SELECT
    COUNT(*) AS TotalOrders,
    SUM(Quantity) AS TotalQuantity,
    AVG(TotalPrice) AS AverageOrderValue,
    MIN(TotalPrice) AS MinimumOrderValue,
    MAX(TotalPrice) AS MaximumOrderValue
FROM dbo.cleaned_dataset;
GO