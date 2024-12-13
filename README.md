# ETL_Web_Scraping_Data-Wrangling

# Workflow

As a Data Engineer, im working on a data pipeline/ETL project. Your task is to extract data from a website, process it, and store it in a PostgreSQL database. 

## A. Extract

The first stage in the data pipeline is Extract, retrieve data from a source website using web scraping.  are as follows:

1. website related to retail (e-commerce, online stores, etc.).
2. Ensure the website selection is discussed and approved by your instructor.
3. Extract data using web scraping and implement it in a Jupyter Notebook file (.ipynb).
4. Collect minimum of 50 rows of data and include at least 4 columns.

## B. Transform

In the Transform stage, process the extracted data using Pandas. using these steps:

1. Data exploration on the scraped data:
2. Check the structure, completeness, and accuracy of the data.
3. Ensure the consistency of data types in columns: For columns like price, ratings, or quantity that should only contain numbers, verify there are no non-numeric characters and convert them to numeric data types.
4. Save the processed data to a .csv file.

## C. Load
In the Load stage, store the processed data in a PostgreSQL database. Follow these instructions:

1. Create a PostgreSQL database based on the processed CSV data:

2. Match the table columns and data types with the data in the CSV.
Normalize the data if necessary to ensure the database adheres to normalization rules.

3. Load the CSV data into the PostgreSQL database:

Implement the Load stage in a .sql file and run the script in pgAdmin.
