-- SQL Retail Sales Analysis
CREATE DATABASE sql_project;
USE sql_project;

-- Create TABLE
DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales
            (
                transaction_id INT PRIMARY KEY,	
                sale_date DATE,	 
                sale_time TIME,	
                customer_id	INT,
                gender	VARCHAR(15),
                age	INT,
                category VARCHAR(15),	
                quantity	INT,
                price_per_unit FLOAT,	
                cogs	FLOAT,
                total_sale FLOAT
            );
            
SELECT * FROM retail_sales
LIMIT 10 

-- Data Analysis & Business Key Problems & Answers 
  
-- 1.What are the top-selling product categories?
-- 2.Which customers have the highest total spending?
-- 3.What is the monthly sales trend?
-- 4.What is the average sales amount per transaction?
-- 5.How does gender impact total sales?
-- 6.Which age group generates the most revenue?
-- 7.What are the peak sales hours during the day?

-- 1. Top-Selling Product Categories
-- Question: What are the top-selling product categories based on total sales?  

            SELECT category, SUM(total_sale) AS total_sales
            FROM retail_sales
            GROUP BY category
            ORDER BY total_sales DESC;  
            
-- 2. Highest-Spending Customers
-- Question: Which customers have the highest total spending?    

            SELECT customer_id, SUM(total_sale) AS total_spent
            FROM retail_sales
            GROUP BY customer_id
            ORDER BY total_spent DESC
            LIMIT 10;
            
-- 3. Monthly Sales Trend
-- Question: What is the sales trend by month?  

            SELECT EXTRACT(MONTH FROM sale_date) AS month, SUM(total_sale) AS total_sales
            FROM retail_sales
            GROUP BY month
            ORDER BY month;
            
-- 4. Average Sales Per Transaction
-- Question: What is the average sales amount per transaction?

			SELECT AVG(total_sale) AS avg_sales
			FROM retail_sales;
            
-- 5. Impact of Gender on Total Sales
-- Question: How do sales differ between male and female customers?
            SELECT gender, SUM(total_sale) AS total_sales
            FROM retail_sales
			GROUP BY gender
            ORDER BY total_sales DESC;
            
-- 6. Revenue by Age Group
-- Question: Which age group generates the most revenue?   
         
SELECT CASE 
         WHEN age BETWEEN 18 AND 25 THEN '18-25'
         WHEN age BETWEEN 26 AND 35 THEN '26-35'
         WHEN age BETWEEN 36 AND 45 THEN '36-45'
         WHEN age BETWEEN 46 AND 55 THEN '46-55'
         ELSE '55+' 
       END AS age_group,
       SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY age_group
ORDER BY total_sales DESC;

-- 7. Peak Sales Hours
-- Question: During which hours do we see the highest sales?

         SELECT EXTRACT(HOUR FROM sale_time) AS hour, SUM(total_sale) AS total_sales
         FROM retail_sales
         GROUP BY hour
         ORDER BY total_sales DESC;

         

        
       
            