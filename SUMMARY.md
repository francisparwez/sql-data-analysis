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
│   └── 03-filtering-and-sorting.sql
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

## Next Steps

1. Group records using `GROUP BY`.
2. Summarise data with aggregate functions such as `COUNT()`, `SUM()`, and `AVG()`.
3. Use `HAVING` to filter grouped results.
4. Calculate percentage contributions.
5. Answer business questions and document the findings.
6. Complete final quality checks and update the project documentation.

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
