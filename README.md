#  Product Catalog Analysis

## 🚀 Objective

The objective of this solution is to prove to  internal business stakeholders that  customers (manufacturers/retailers) would benefit from an improvement in their data quality, using the provided catalog data

## 📁 Project Structure

- `data/` — Contains raw data files (`product_descriptions`, `product_properties`, `manufacturers`)
- `scripts/` — Contains the functional Python notebook script for data pipeline using Pandas
- `sql/` — Contains SQL scripts to answer key  questions
- `dashboard/` — Contains the Power BI one-page dashboard
- `Bonus Question.txt` — Bonus Question
- `requirements.txt` — Python dependency file

## Data Pipeline (Pandas)
### Steps:
1. **Data Loading**: Loaded the raw CSV files (`product_descriptions.csv`, `product_properties.csv`, `manufacturers.csv`) into Pandas DataFrames.
2. **Data Cleaning**:
   - Normalized bad quality data (e.g., 'N/A', empty strings).
   - Dropped rows with missing values in key columns (`Articlenumber`, `Manufacturernumber`).
3. **Merging Data**: Merged the `product_descriptions`, `product_properties`, and `manufacturers` DataFrames on common columns.
4. **Output**: Saved the cleaned data to `output/cleaned_product_data.csv` 

## SQL section: 
### Steps to Run SQL Queries
1. **Set Up Database Connection**:
   -  Make sure your MySQL database is running and accessible.
   
   - Ensure you have SQLAlchemy and Pandas installed:  pip install sqlalchemy pymysql pandas

2. **Configure Database Credentials** :

   - Replace the placeholder credentials (DB_USERNAME, DB_PASSWORD, etc.) in the connection script with your MySQL database credentials.


from sqlalchemy import create_engine 
#Connecting to SQL Database using SQLAlchemy 

   - MySQL Connection Parameters
   - username = "DB_USERNAME"               
   - password = "DB_PASSWORD"     
   - host = "DB_HOST"             
   - port = "DB_PORT"                  
   - database = "DB_NAME"           

 Creating SQLAlchemy connection string
   - connection_string = f"mysql+pymysql://{username}:{password}@{host}:{port}/{database}"

Creating SQLAlchemy Engine
   - engine = create_engine(connection_string)

Loading DataFrame into MySQL
   - merged.to_sql(name="clean_catalog", con=engine, if_exists="fail", index=False)

3. **Run the SQL Queries**:

   - The SQL queries to answer the key business questions are available in the SQL folders.


