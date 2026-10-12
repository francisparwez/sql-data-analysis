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

## Current Project Structure

```text
sql-data-analysis/
├── data/
│   └── input/
│       └── cleaned_dataset.csv
├── sql/
│   └── 01-creating-db__schema__data-insertion.sql
├── .gitignore
├── CHANGE_LOG.md
├── README.md
└── SUMMARY.md
```

## Tools

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- T-SQL
- CSV

## Next Steps

1. Verify the outputs of the initial validation queries.
2. Practise basic `SELECT` queries.
3. Filter and sort data using `WHERE` and `ORDER BY`.
4. Group and summarise records using `GROUP BY` and aggregate functions.
5. Use `HAVING` and calculate percentage contributions.
6. Answer business questions and document the findings.
7. Complete final quality checks and update the project documentation.

## Important Note

The `BULK INSERT` statement currently uses a local Windows path. Anyone running the script on another computer must update that path and ensure that the SQL Server service account can access the CSV file.
