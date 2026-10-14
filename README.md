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

**Note:** The current script contains a machine-specific Windows file path. Update that path before running the script on another computer. The SQL Server service account must have permission to read the CSV file.

The database-creation statement will fail if a database with the same name already exists. If you rerun the script, check the database and table first to avoid duplicate imports. The filtering and sorting script reads data only; it does not update or delete records.

## Planned Work

The next stages will build on the imported table and cover the remaining SQL analysis requirements for this project:

- Grouping with `GROUP BY`
- Aggregations using `COUNT()`, `SUM()`, and `AVG()`
- Group-level filtering with `HAVING`
- Percentage contribution calculations
- Business questions and interpretation of query results
- Final query review and project documentation

## Internship

- **Program:** Data Analytics Internship
- **Organization:** DecodeLabs
- **Project:** Project 3 — SQL Data Analysis
