# SQL Data Analysis

This is Project 3 of my Data Analytics Internship at DecodeLabs. The project uses SQL Server and T-SQL to prepare and analyse the cleaned dataset used in Project 2.

## Project Goal

The goal is to use SQL queries to retrieve, filter, group, and summarise data so that the results can answer practical analytical questions.

## Current Progress

### Task 1 — Database Setup and Data Import

Completed the initial database setup using Microsoft SQL Server and SQL Server Management Studio (SSMS).

The SQL script `sql/01-creating-db__schema__data-insertion.sql` currently:

- Creates the `Project3_SQL_Data_Analysis` database.
- Creates the `dbo.cleaned_dataset` table with 14 columns.
- Imports `data/input/cleaned_dataset.csv` using `BULK INSERT`.
- Checks the number of imported records and previews the data.
- Displays the table structure and column data types.
- Checks for duplicate `OrderID` values and missing `OrderID` values.
- Checks whether `TotalPrice` matches `Quantity * UnitPrice`.

The CSV import completed successfully and SQL Server reported **1,200 rows affected**. The record-count and column-count queries also returned 1,200 records and 14 columns.

### Task 3 — Basic SQL Queries

Completed basic data retrieval queries using T-SQL in Microsoft SQL Server.

The script `sql/02-basic-sql-queries.sql` includes:

- Retrieving all columns using `SELECT *`.
- Selecting specific columns to keep results focused.
- Using column aliases to make headings easier to understand.
- Retrieving a sample of 10 records using `TOP 10`.
- Viewing customer and order details.
- Reviewing product quantities and prices.
- Inspecting order dates and delivery details.

The queries were executed successfully against `dbo.cleaned_dataset`. Each of the three practical data-view queries returned 1,200 records. These queries retrieve data only and do not modify the table.

### Task 4 — Filtering and Sorting

Created `sql/03-filtering-and-sorting.sql` to practise filtering records and sorting query results.

The script includes:

- Filtering order totals and unit prices with comparison operators.
- Finding orders by quantity and combining conditions with `AND`.
- Filtering payment methods with `OR` and `IN`.
- Finding product names with `LIKE`.
- Filtering order totals with `BETWEEN`.
- Sorting the highest-value orders with `ORDER BY ... DESC`.
- Sorting the earliest orders with `ORDER BY ... ASC`.
- Combining status, payment method, product name, price, and date conditions.
- Selecting orders from January 2024 using a start date and an exclusive end date.

The script contains exercises numbered Task 4.1 to Task 4.15. The screenshots supplied during the work show successful execution of the individual queries, including 512 rows for Task 4.1, 664 rows for Task 4.4, 713 rows for Task 4.8's related status filter shown earlier, 305 rows for the `BETWEEN` query, 10 rows for the top-10 query, and 146 rows for Task 4.15. Result counts depend on the specific query and current dataset.

### Task 5 — Aggregate Functions and Grouping

Created `sql/04-aggregate-functions-and-grouping.sql` with Tasks 5.1 to 5.26. The queries use `COUNT()`, `SUM()`, `AVG()`, `MIN()`, `MAX()`, `GROUP BY`, `HAVING`, `COUNT(DISTINCT ...)`, and date functions such as `YEAR()` and `MONTH()`.

The exercises summarise order counts, quantities, order values, and total sales by product, payment method, order status, year, and month. They also compare grouped results and filter groups using `HAVING`. The script begins by selecting the project database, checking the record count, and previewing a few records. The aggregation queries are read-only `SELECT` statements.

The screenshots supplied during the task show the following results:

- There are 1,200 records in the table.
- Product order counts: Printer 181, Tablet 179, Chair 178, Laptop 173, Desk 170, Monitor 163, and Phone 156.
- Total quantity by product: Chair 562, Printer 542, Laptop 535, Desk 508, Tablet 497, Monitor 480, and Phone 411.
- Total sales by product: Chair 195,620.11; Printer 195,612.61; Laptop 192,126.56; Tablet 186,568.95; Monitor 175,651.41; Desk 167,459.93; Phone 151,722.39.
- Online is the most common payment method, with 258 orders.
- The yearly summary shows 510 orders in 2023, 459 in 2024, and 231 in 2025.
- The overall summary shows 1,200 orders, total quantity 3,535, average order value approximately 1,053.97, minimum order value 11.39, and maximum order value 3,456.40.

These are descriptive results from this dataset. The source data does not specify a currency, so no currency symbol is assigned to the sales values.

## Dataset

The project uses the cleaned dataset carried forward from Project 2.

- **File:** `data/input/cleaned_dataset.csv`
- **Records:** 1,200
- **Columns:** 14
- **Database table:** `dbo.cleaned_dataset`

The original Excel workbook was exported to CSV for use with `BULK INSERT`. The original cleaned dataset should be kept unchanged.

## Tools

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- T-SQL
- CSV

## Project Structure

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

## Setup Notes

1. Place `cleaned_dataset.csv` in `data/input/`.
2. Open `sql/01-creating-db__schema__data-insertion.sql` in SSMS.
3. Review the file path in the `BULK INSERT` statement and update it to the location available to the SQL Server service account on your computer.
4. Run the script in SSMS.
5. Open `sql/02-basic-sql-queries.sql` to review and run the basic data retrieval queries.
6. Open `sql/03-filtering-and-sorting.sql` to run the filtering and sorting exercises.
7. Open `sql/04-aggregate-functions-and-grouping.sql` to run the aggregate-function and grouping exercises.

**Note:** The current script contains a machine-specific Windows file path. Update that path before running the script on another computer. The SQL Server service account must have permission to read the CSV file.

The database-creation statement will fail if a database with the same name already exists. If you rerun the script, check the database and table first to avoid duplicate imports. The filtering and sorting script reads data only; it does not update or delete records.

## Planned Work

The project has now progressed through aggregate functions and grouping. The next work is to review the remaining project requirements, confirm which tasks are still outstanding, rerun the SQL scripts for a final check, and keep the documentation aligned with the completed work.

## Internship

- **Program:** Data Analytics Internship
- **Organization:** DecodeLabs
- **Project:** Project 3 — SQL Data Analysis
