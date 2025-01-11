
## Project Workflow

As a Data Engineer, im working on a data pipeline/ETL project. The task is to extract data from a website, process it, and store it in a PostgreSQL database. 

## Prerequisites
1. Python 3.x installed with the following libraries:
- pandas
- numpy
- beautifulsoup4 or selenium (for web scraping)
2. PostgreSQL installed with pgAdmin for database management.

##  Workflow Stages

## A. Extract

Data is scraped from a website related to retail (e-commerce or online stores).

1. Minimum requirements:
- 50 rows of data
- At least 4 columns (e.g., Product Name, Price, Rating, and Availability)
2. Implementation:
- Web scraping is done using libraries like BeautifulSoup or Selenium in a Jupyter Notebook.
- The script fetches the required data and stores it in a structured DataFrame for further processing.

## B. Transform
Data exploration and cleaning are performed using pandas:
1. Check structure, completeness, and accuracy:
- Handle missing values.
- Ensure column consistency (e.g., uniform formats for price, ratings, and quantities).
2. Data type validation:
- Convert columns like price or ratings to numeric types, ensuring no non-numeric characters exist.
3. Save to CSV:
- The cleaned and processed data is exported to a .csv file for easy loading into the database.

## C. Load
The processed data is stored in a PostgreSQL database:
1. Database and table setup:
- Create a PostgreSQL database and define a table schema that matches the processed data.
- Normalize the data if necessary to ensure compliance with database normalization rules.
2. Load data into PostgreSQL:
- Use pgAdmin or an equivalent tool to execute a .sql script that imports the CSV data into the database.

## Usage
- Run the ETL Process
- 1. Scrape the data by executing the web_scraping.ipynb notebook.
- 2. Process the data using the data_transform.ipynb notebook.
- 3. Load the data into PostgreSQL using the data_load.sql script.

## Conclusion
This ETL project showcases the end-to-end process of extracting, transforming, and loading data into a database system. The pipeline is modular, allowing for easy customization for different data sources and business requirements. 
