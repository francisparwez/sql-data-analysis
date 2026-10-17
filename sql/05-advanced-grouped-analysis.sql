-- Project 3: SQL Data Analysis
-- Task 6: Advanced Grouped Analysis

USE Project3_SQL_Data_Analysis;
GO

-- Check that the correct database is selected
SELECT DB_NAME () AS CurrentDatabase;
GO

-- Task 6.1: Check the number of records

SELECT COUNT(*) AS TotalRecords FROM dbo.cleaned_dataset;
GO

-- Task 6.2: Preview the fields used in this analysis

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

-- Task 6.3: Find products with more than 170 orders

SELECT Product, COUNT(*) AS NumberOfOrders
FROM dbo.cleaned_dataset
GROUP BY
    Product
HAVING
    COUNT(*) > 170
ORDER BY NumberOfOrders DESC;
GO

-- Task 6.4: Find products with at least 20 orders above 1000

SELECT
    Product,
    COUNT(*) AS NumberOfOrders,
    SUM(TotalPrice) AS TotalSales,
    AVG(TotalPrice) AS AverageOrderValue
FROM dbo.cleaned_dataset
WHERE
    TotalPrice > 1000
GROUP BY
    Product
HAVING
    COUNT(*) >= 20
ORDER BY TotalSales DESC;
GO

-- Task 6.5: Calculate each product's share of total sales

SELECT
    Product,
    SUM(TotalPrice) AS TotalSales,
    CAST(
        SUM(TotalPrice) * 100.0 / SUM(SUM(TotalPrice)) OVER () AS DECIMAL(10, 2)
    ) AS SalesContributionPercent
FROM dbo.cleaned_dataset
GROUP BY
    Product
ORDER BY SalesContributionPercent DESC;
GO

-- Task 6.6: Find payment methods with sales above 250000

WITH
    PaymentMethodSales AS (
        SELECT
            PaymentMethod,
            COUNT(*) AS NumberOfOrders,
            SUM(TotalPrice) AS TotalSales,
            AVG(TotalPrice) AS AverageOrderValue
        FROM dbo.cleaned_dataset
        GROUP BY
            PaymentMethod
    )
SELECT
    PaymentMethod,
    NumberOfOrders,
    TotalSales,
    AverageOrderValue,
    CAST(
        TotalSales * 100.0 / (
            SELECT SUM(TotalPrice)
            FROM dbo.cleaned_dataset
        ) AS DECIMAL(10, 2)
    ) AS SalesContributionPercent
FROM PaymentMethodSales
WHERE
    TotalSales > 250000
ORDER BY TotalSales DESC;
GO

-- Task 6.7: Find products with an average order value above 1050

SELECT
    Product,
    COUNT(*) AS NumberOfOrders,
    AVG(TotalPrice) AS AverageOrderValue
FROM dbo.cleaned_dataset
GROUP BY
    Product
HAVING
    AVG(TotalPrice) > 1050
ORDER BY AverageOrderValue DESC;
GO

-- Task 6.8: Calculate each product's percentage of total quantity sold

SELECT
    Product,
    SUM(Quantity) AS TotalQuantitySold,
    CAST(
        SUM(Quantity) * 100.0 / SUM(SUM(Quantity)) OVER () AS DECIMAL(10, 2)
    ) AS QuantityContributionPercent
FROM dbo.cleaned_dataset
GROUP BY
    Product
ORDER BY QuantityContributionPercent DESC;
GO

-- Task 6.9: Summarise orders by status

SELECT
    OrderStatus,
    COUNT(*) AS NumberOfOrders,
    SUM(TotalPrice) AS TotalSales,
    AVG(TotalPrice) AS AverageOrderValue
FROM dbo.cleaned_dataset
GROUP BY
    OrderStatus
ORDER BY TotalSales DESC;
GO

-- Task 6.10: Find product and status groups with at least 35 orders

SELECT
    Product,
    OrderStatus,
    COUNT(*) AS NumberOfOrders,
    SUM(TotalPrice) AS TotalSales
FROM dbo.cleaned_dataset
GROUP BY
    Product,
    OrderStatus
HAVING
    COUNT(*) >= 35
ORDER BY Product, NumberOfOrders DESC;
GO

-- Task 6.11: Find payment methods contributing more than 20% of total sales

WITH
    PaymentMethodSales AS (
        SELECT PaymentMethod, SUM(TotalPrice) AS TotalSales
        FROM dbo.cleaned_dataset
        GROUP BY
            PaymentMethod
    ),
    PaymentMethodContribution AS (
        SELECT
            PaymentMethod,
            TotalSales,
            CAST(
                TotalSales * 100.0 / SUM(TotalSales) OVER () AS DECIMAL(10, 2)
            ) AS SalesContributionPercent
        FROM PaymentMethodSales
    )
SELECT
    PaymentMethod,
    TotalSales,
    SalesContributionPercent
FROM PaymentMethodContribution
WHERE
    SalesContributionPercent > 20
ORDER BY SalesContributionPercent DESC;
GO

-- Task 6.12: Summarise the full dataset

SELECT
    COUNT(*) AS TotalOrders,
    COUNT(DISTINCT Product) AS NumberOfProducts,
    COUNT(DISTINCT PaymentMethod) AS NumberOfPaymentMethods,
    SUM(Quantity) AS TotalQuantitySold,
    CAST(
        SUM(TotalPrice) AS DECIMAL(12, 2)
    ) AS TotalSales,
    CAST(
        AVG(TotalPrice) AS DECIMAL(12, 2)
    ) AS AverageOrderValue,
    CAST(
        MIN(TotalPrice) AS DECIMAL(12, 2)
    ) AS MinimumOrderValue,
    CAST(
        MAX(TotalPrice) AS DECIMAL(12, 2)
    ) AS MaximumOrderValue
FROM dbo.cleaned_dataset;
GO