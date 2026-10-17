-- Project 3: SQL Data Analysis
-- Task 7: Business Questions and Insights
-- Database: Project3_SQL_Data_Analysis
-- Table: dbo.cleaned_dataset

USE Project3_SQL_Data_Analysis;
GO

-- Check the dataset before starting the analysis
SELECT COUNT(*) AS TotalRecords FROM dbo.cleaned_dataset;
GO

-- Inspect the columns available for business analysis
SELECT TOP 5 * FROM dbo.cleaned_dataset;
GO

-- Task 7.1: Which products generate the highest sales?

SELECT Product, SUM(TotalPrice) AS TotalSales
FROM dbo.cleaned_dataset
GROUP BY
    Product
ORDER BY TotalSales DESC;
GO

/*
Insight:
Chair generated the highest total sales, closely followed by Printer. Phone generated the lowest total sales among the seven products.

Business interpretation:
The business could review what is driving sales for Chair and Printer and investigate whether there are opportunities to improve Phone sales.
*/

-- Task 7.2: Which products sell the highest quantities?

SELECT Product, SUM(Quantity) AS TotalQuantitySold
FROM dbo.cleaned_dataset
GROUP BY
    Product
ORDER BY TotalQuantitySold DESC;
GO

/*
Insight:
Chair had the highest recorded quantity sold, followed by Printer and Laptop. Phone had the lowest recorded quantity sold.

Business interpretation:
The business could compare product demand with stock availability before making inventory decisions.
*/

-- Task 7.3: Which payment methods generate the most sales?

SELECT
    PaymentMethod,
    COUNT(*) AS TotalOrders,
    SUM(TotalPrice) AS TotalSales,
    AVG(TotalPrice) AS AverageOrderValue
FROM dbo.cleaned_dataset
GROUP BY
    PaymentMethod
ORDER BY TotalSales DESC;
GO

/*
Insight:
Credit Card generated the highest total sales, while Online had the highest number of orders. Debit Card had the lowest total sales and the lowest average order value among the five payment methods.

Business interpretation:
The business could compare payment-method usage and sales performance when reviewing its payment options.
*/

-- Task 7.4: How do sales change by year?

SELECT
    YEAR(Date) AS SalesYear,
    COUNT(*) AS TotalOrders,
    SUM(TotalPrice) AS TotalSales,
    AVG(TotalPrice) AS AverageOrderValue
FROM dbo.cleaned_dataset
GROUP BY
    YEAR(Date)
ORDER BY SalesYear;
GO

/*
Insight:
2023 had the highest recorded sales and average order value. Both figures decreased in 2024 and 2025.

Business interpretation:
The business could investigate the reasons behind the lower sales totals and average order values in the later years. The date coverage for 2025 should be checked before comparing it directly with the earlier years.
*/

-- Task 7.5: How do order statuses compare?

SELECT
    OrderStatus,
    COUNT(*) AS TotalOrders,
    SUM(TotalPrice) AS TotalSales,
    AVG(TotalPrice) AS AverageOrderValue
FROM dbo.cleaned_dataset
GROUP BY
    OrderStatus
ORDER BY TotalOrders DESC;
GO

/*
Insight:
Cancelled orders had the highest record count, while Delivered orders had the lowest. Cancelled orders also had the highest total recorded sales value. Returned orders had the lowest average order value.

Business interpretation:
The business could investigate why orders are being cancelled and review the reasons for returns. The recorded values for cancelled and returned orders should be checked before using them to report completed sales.
*/

-- Task 7.6: Which orders have the highest sales values?

SELECT TOP 10
    OrderID,
    Date,
    Product,
    Quantity,
    PaymentMethod,
    OrderStatus,
    TotalPrice
FROM dbo.cleaned_dataset
ORDER BY TotalPrice DESC;
GO

/*
Insight:
The highest recorded order value was 3,456.40 for a Tablet order. The top 10 results include different order statuses, including
Delivered, Shipped, Returned, Cancelled, and Pending. 
Business interpretation:
The business could review high-value orders alongside their order status to understand which transactions were completed and which may need further attention.
*/

-- Task 7.7: What does the overall dataset tell us?

SELECT
    COUNT(*) AS TotalOrders,
    COUNT(DISTINCT Product) AS TotalProducts,
    COUNT(DISTINCT PaymentMethod) AS TotalPaymentMethods,
    SUM(Quantity) AS TotalQuantitySold,
    SUM(TotalPrice) AS TotalRecordedSales,
    AVG(TotalPrice) AS AverageOrderValue,
    MIN(TotalPrice) AS MinimumOrderValue,
    MAX(TotalPrice) AS MaximumOrderValue
FROM dbo.cleaned_dataset;
GO

/*
Overall findings:
The dataset contains 1,200 records across seven products and five payment methods. Chair generated the highest total sales and had the highest recorded quantity sold. Credit Card had the highest total sales among payment methods, while Online had the highest order count.

Annual sales totals decreased from 2023 to 2025, although 2025 coverage should be checked before comparing full-year performance. Cancelled orders had the highest record count among the five order statuses.

Business recommendations:
The business could investigate the reasons behind cancellations, review product demand and stock availability, and examine changes in annual sales. High-value orders should also be reviewed alongside their order statuses.

These findings describe the available records. They do not establish profitability, the causes of sales changes, or the reasons for
cancellations and returns.
*/