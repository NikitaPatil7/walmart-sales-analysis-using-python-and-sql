# walmart-sales-analysis-using-python-and-sql
An end-to-end data analysis project on Walmart sales data, leveraging Python for processing, SQL for advanced querying, and structured problem-solving to uncover key business insights. Designed to showcase skills in data manipulation, SQL querying, and building efficient data pipelines.

# Walmart Sales Data Analysis
## Problem Statement

Walmart is one of the largest retail chains, and analyzing its sales data can reveal valuable business insights. This project focuses on understanding sales patterns, customer behavior, and revenue drivers by performing data cleaning, SQL-based analysis, and visualization. The goal is to answer key business questions such as:

* Which product categories contribute most to revenue?

* How do sales vary across branches, cities, and payment methods?

* What trends exist in customer purchasing behavior over time?

## Project Overview

This project is an end-to-end data analysis solution designed to extract meaningful business insights from Walmart sales data. The workflow covers everything from raw data cleaning to database integration, SQL querying, and dashboard creation.

The aim is to demonstrate strong data analysis, SQL, and visualization skills by solving real-world business problems such as identifying sales trends, understanding customer behavior, and evaluating product performance.

## Tools & Technologies
1. Python: Data cleaning, preprocessing, and EDA (Pandas, NumPy)
2. PostgreSQL: SQL queries for sales insights
3. Jupyter Notebook: Exploratory Data Analysis (EDA)


## Project Workflow

1. Raw Data
    * Sourced Walmart sales dataset from Kaggle.

2. Data Cleaning (Python)
    * Checked dataset shape, info, and statistical summary.
    * Removed duplicates and handled missing values.
    * Converted unit_price column (removed $ sign, converted to float).
    * Created new column total = unit_price * quantity.
    * Exported the cleaned dataset to CSV.

3. Database Integration
    * Established PostgreSQL connection.
    * Loaded cleaned dataset into the database for structured querying.

4. SQL Queries
   * Revenue and profit analysis.
   * Best-selling products and categories.
   * Sales performance by city, branch, and payment type.
   * Customer trends and purchase behavior.

## Key Business Insights

 * Identified top-performing product categories driving revenue.
 * Detected seasonal trends in customer purchases.
 * Highlighted cities/branches with highest sales and profits.
 * Analyzed payment method preferences across customers.

## How to Run the Project

 1. Clone the repository:
   git clone https://github.com/your-username/walmart-sales-analysis.git
   cd walmart-sales-analysis
 
 2. Run the Jupyter notebook for EDA:
   jupyter notebook notebooks/Walmart_EDA.ipynb
 
 3. Load cleaned CSV into PostgreSQL and execute queries from sql/Walmart_queries.sql.

## Skills Demonstrated
  * Data cleaning & preprocessing (Python, Pandas)
  * SQL query writing & optimization (PostgreSQL)
  * Data visualization & dashboarding (Excel)
  * End-to-end problem solving for business analytics

## Future Enhancements
  * Automate ETL pipeline using Airflow or Prefect.
  * Build an interactive dashboard with Power BI or Tableau.
  * Deploy the solution as a web-based analytics tool.
