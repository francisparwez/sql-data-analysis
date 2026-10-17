# Change Log

This file records the work completed in Project 3 — SQL Data Analysis.

| Change ID | Area                             | Change                                                                                                                                  | Reason                                                                           | Status    |
| --------- | -------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | --------- |
| SQL001    | Project setup                    | Created the project structure for SQL analysis.                                                                                         | To keep data, scripts, and documentation organised.                              | Completed |
| SQL002    | Input dataset                    | Exported the cleaned Project 2 dataset to `data/input/cleaned_dataset.csv`.                                                             | To load the data into SQL Server.                                                | Completed |
| SQL003    | Database and table               | Created the `Project3_SQL_Data_Analysis` database and `dbo.cleaned_dataset` table with 14 columns.                                      | To prepare the data for analysis.                                                | Completed |
| SQL004    | Data import                      | Imported the CSV into `dbo.cleaned_dataset`; SQL Server reported 1,200 rows affected.                                                   | To make the data available for queries.                                          | Completed |
| SQL005    | Initial validation               | Added checks for row count, table structure, duplicate and missing `OrderID` values, and the `TotalPrice` calculation.                  | To check the imported data before analysis.                                      | Completed |
| SQL006    | Basic SQL queries                | Added `02-basic-sql-queries.sql` with selected columns, aliases, `TOP 10`, and practical data-view queries.                             | To practise retrieving relevant records.                                         | Completed |
| SQL007    | Filtering and sorting            | Added `03-filtering-and-sorting.sql` with 15 filtering and sorting exercises.                                                           | To practise narrowing down and ordering results.                                 | Completed |
| SQL008    | Aggregate functions and grouping | Added `04-aggregate-functions-and-grouping.sql` with Tasks 5.1–5.26 using aggregate functions, `GROUP BY`, `HAVING`, and date grouping. | To summarise orders, quantities, prices, and sales by useful categories.         | Completed |
| SQL009    | Documentation                    | Updated the README and summary to describe Task 5 and record results visible in the supplied screenshots.                               | To keep the documentation aligned with the work completed.                       | Completed |
| SQL010    | Advanced grouped analysis        | Added `05-advanced-grouped-analysis.sql` with `HAVING`, combined filtering and grouping, and sales/quantity contribution percentages.   | To compare category-level performance and document the results.                  | Completed |
| SQL011    | Business questions and insights  | Added `06-business-questions-and-insights.sql` with seven business questions, SQL queries, interpretations, and overall findings.       | To use SQL results to answer practical business questions and document findings. | Completed |

## Notes

- The SQL scripts use `dbo.cleaned_dataset` in the `Project3_SQL_Data_Analysis` database.
- The aggregation scripts contain read-only `SELECT` queries. They do not update or delete table records.
- Task 6 added `sql/05-advanced-grouped-analysis.sql` for `HAVING`, filtered aggregation, and sales and quantity contribution percentages. The supplied screenshots show successful execution and an overall summary of 1,200 orders, total quantity of 3,535, and total sales of 1,264,761.96.
- The earlier data-import script may use a computer-specific Windows path in `BULK INSERT`. Update the path and check SQL Server service-account permissions before running it on another computer.
- The results recorded here are based on screenshots supplied during development. Run the complete script once more before final submission to confirm all batches execute successfully in sequence.
- The source data does not specify a currency, so sales values are not assigned a currency symbol.
- Task 7 added `sql/06-business-questions-and-insights.sql` to compare product sales and quantities, payment methods, annual sales, order statuses, high-value orders, and overall dataset metrics. The supplied SSMS screenshots show successful execution of the selected queries.
