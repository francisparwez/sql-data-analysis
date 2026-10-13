# Change Log

This file records the work completed in Project 3 — SQL Data Analysis.

## Project 3 — SQL Data Analysis

| Change ID | Area               | Change                                                                                                                                                                   | Reason                                                                       | Status    |
| --------- | ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ---------------------------------------------------------------------------- | --------- |
| SQL001    | Project setup      | Created the `sql-data-analysis` project structure with `data/input/` and `sql/` folders.                                                                                 | To keep the dataset and SQL scripts organised.                               | Completed |
| SQL002    | Input dataset      | Exported the cleaned Project 2 dataset to `data/input/cleaned_dataset.csv`.                                                                                              | To import the cleaned data into SQL Server using `BULK INSERT`.              | Completed |
| SQL003    | Database and table | Created the `Project3_SQL_Data_Analysis` database and `dbo.cleaned_dataset` table with 14 columns.                                                                       | To prepare a SQL Server table for analysis.                                  | Completed |
| SQL004    | Data import        | Imported the CSV into `dbo.cleaned_dataset`; SQL Server reported 1,200 rows affected.                                                                                    | To make the dataset available for SQL queries.                               | Completed |
| SQL005    | Initial validation | Added queries to count and preview records, inspect the table structure, check duplicate and missing `OrderID` values, and validate `TotalPrice`.                        | To perform initial checks after importing the data.                          | Completed |
| SQL006    | Basic SQL queries  | Created `sql/02-basic-sql-queries.sql` with `SELECT *`, selected columns, column aliases, `TOP 10`, and queries for customer/order, product/price, and delivery details. | To practise retrieving and presenting selected data from the existing table. | Completed |

## Notes

The current SQL script contains a machine-specific file path for `BULK INSERT`. Update it before running the script on another computer. The initial validation queries are included in the setup script; record their individual results only after reviewing their outputs.

The basic queries in `sql/02-basic-sql-queries.sql` retrieve data only and do not modify the table. The three practical data-view queries each return 1,200 records when run against the current dataset.
