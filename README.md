# SQL Data Analysis

This is Project 3 of my Data Analytics Internship at DecodeLabs. The project uses SQL Server and T-SQL to prepare a database for analysing the cleaned dataset used in Project 2.

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

The CSV import completed successfully and SQL Server reported **1,200 rows affected**.

## Dataset

The project uses the cleaned dataset carried forward from Project 2.

- **File:** `data/input/cleaned_dataset.csv`
- **Expected records:** 1,200
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
│   └── 01-creating-db__schema__data-insertion.sql
└── README.md
```

## Setup Notes

1. Place `cleaned_dataset.csv` in `data/input/`.
2. Open `sql/01-creating-db__schema__data-insertion.sql` in SSMS.
3. Review the file path in the `BULK INSERT` statement and update it to the location available to the SQL Server service account on your computer.
4. Run the script in SSMS.

**Note:** The current SQL script contains a machine-specific Windows file path. Update that path before running the script on another computer. The SQL Server service account must have permission to read the CSV file.

The database-creation statement will fail if a database with the same name already exists. If you rerun the script, check the database and table first to avoid duplicate imports.

## Planned Work

The next stages will build on the imported table and cover the SQL analysis requirements for this project:

- Basic `SELECT` queries
- Filtering with `WHERE`
- Sorting with `ORDER BY`
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
