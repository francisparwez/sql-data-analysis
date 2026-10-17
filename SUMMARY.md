# Project 3 — SQL Data Analysis Summary

## Project Goal

Use T-SQL queries to retrieve, filter, group, and summarise data to answer practical analytical questions. This project is part of my Data Analytics Internship at DecodeLabs.

## Completed Work — Task 1: Database Setup and Data Import

- Created the `Project3_SQL_Data_Analysis` database in Microsoft SQL Server.
- Created the `dbo.cleaned_dataset` table with 14 columns.
- Exported the cleaned Project 2 dataset to CSV format.
- Imported the CSV using `BULK INSERT`.
- SQL Server reported **1,200 rows affected**.
- Added initial queries to count records, preview data, inspect table structure, check duplicate and missing `OrderID` values, and validate `TotalPrice` against `Quantity * UnitPrice`.
- Verified that the record count is 1,200 and the column count is 14.

## Current Project Structure

```text
sql-data-analysis/
├── data/
│   └── input/
│       └── cleaned_dataset.csv
├── sql/
│   ├── 01-creating-db__schema__data-insertion.sql
│   ├── 02-basic-sql-queries.sql
│   ├── 03-filtering-and-sorting.sql
│   ├── 04-aggregate-functions-and-grouping.sql
│   └── 05-advanced-grouped-analysis.sql
├── .gitignore
├── CHANGE_LOG.md
├── README.md
├── requirements.txt
└── SUMMARY.md
```

## Tools

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- T-SQL
- CSV

## Important Note

The `BULK INSERT` statement currently uses a local Windows path. Anyone running the script on another computer must update that path and ensure that the SQL Server service account can access the CSV file.

## Completed Work — Task 3: Basic SQL Queries

- Retrieved all columns using `SELECT *`.
- Selected specific columns to focus query results.
- Used column aliases to make result headings easier to read.
- Retrieved a 10-row sample using `TOP 10`.
- Created queries to view customer and order details, product prices and quantities, and order dates and delivery details.
- Confirmed successful query execution in SSMS. Each of the three practical data-view queries returned 1,200 records.

The queries in `sql/02-basic-sql-queries.sql` retrieve data only; they do not modify the source table.

## Completed Work — Task 4: Filtering and Sorting

- Used `WHERE` with comparison operators such as `>`, `=`, `<`, and `>=`.
- Combined conditions using `AND` and `OR`.
- Used `LIKE` to find product names beginning with `P`.
- Used `IN` to select records with specific order statuses and payment methods.
- Used `BETWEEN` to filter order totals from 500 to 1,000, inclusive.
- Used `ORDER BY` in ascending and descending order.
- Used `TOP 10` with sorting to find the highest-value orders and earliest order dates.
- Combined product, payment, status, price, and date conditions.
- Added 15 exercises to `sql/03-filtering-and-sorting.sql`.

The uploaded screenshots show successful execution of the individual queries. A fresh execution of the entire script should still be performed before final submission.

The Task 4 queries retrieve records only. They do not modify the source table.

## Completed Work — Task 5: Aggregate Functions and Grouping

- Added `sql/04-aggregate-functions-and-grouping.sql` with Tasks 5.1–5.26.
- Used `COUNT()`, `SUM()`, `AVG()`, `MIN()`, and `MAX()` to summarise the order data.
- Used `GROUP BY` to compare results by product, payment method, order status, year, month, and combinations of fields.
- Used `HAVING` to filter grouped results and `COUNT(DISTINCT ...)` to count unique products.
- Used `YEAR()` and `MONTH()` to summarise order activity over time.
- The screenshots show 1,200 total orders and total quantity of 3,535.
- Product sales were highest for Chair (195,620.11), closely followed by Printer (195,612.61) and Laptop (192,126.56).
- Online was the most common payment method with 258 orders.
- The yearly order counts shown were 510 for 2023, 459 for 2024, and 231 for 2025.
- The overall average order value was approximately 1,053.97, with a minimum of 11.39 and maximum of 3,456.40.

The aggregate script uses read-only `SELECT` queries. Sales values are shown without a currency symbol because the dataset does not specify a currency.

## Completed Work — Task 6: Advanced Grouped Analysis

- Added `sql/05-advanced-grouped-analysis.sql`.
- Used `HAVING` to keep groups that meet an order-count or sales threshold.
- Combined `WHERE` with `GROUP BY` to filter records before calculating grouped results.
- Calculated each product's share of total sales and total quantity sold.
- Compared payment methods by order count, total sales, average order value, and sales contribution.
- Summarised orders by status and by product/status combinations.
- The supplied SSMS screenshots show successful execution.
- The overall summary returned 1,200 orders, 7 products, 5 payment methods, total quantity sold of 3,535, total sales of 1,264,761.96, average order value of 1,053.97, minimum order value of 11.39, and maximum order value of 3,456.40.
- For payment methods with sales above 250,000, contribution to total dataset sales was Credit Card 20.86%, Online 20.75%, and Cash 20.54%.

The source does not specify a currency, so sales values are shown without a currency symbol. The script uses read-only `SELECT` queries and does not modify the table.

## Next Steps

1. Review the remaining project requirements and confirm which tasks are still outstanding.
2. Run the SQL scripts from beginning to end in SSMS and resolve any errors.
3. Confirm that the documented file paths match the actual repository structure.
4. Update the documentation again only when additional tasks are completed.
