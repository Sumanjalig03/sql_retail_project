# Retail Sales Analysis Using SQL

## Project Overview
This project focuses on analyzing retail sales data using SQL to gain insights into customer behavior, product performance, and sales trends. 
The dataset contains transaction records, including customer demographics, product categories, sales amounts, and transaction dates and times. 
The goal is to extract meaningful information that can help in making data-driven decisions for retail business strategies.

## Dataset
The dataset used for this project includes the following columns:

**transactions_id**: Unique ID for each transaction.
**sale_date**: Date of the sale.
**sale_time**: Time of the sale.
**customer_id**: Unique ID for each customer.
**gender**: Gender of the customer.
**age**: Age of the customer.
**category**: Product category (e.g., Clothing, Beauty).
**quantity**: Number of units sold.
**price_per_unit**: Price per unit of the product.
**cogs**: Cost of goods sold (COGS).
**total_sale**: Total sale amount for the transaction.


## SQL Queries and Analysis
## 1. Top-Selling Product Categories
**Objective**: Identify the product categories generating the most sales revenue.

```sql
SELECT category, SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY category
ORDER BY total_sales DESC;
```
**Insight**: Helps determine which product categories are driving the most revenue for the business.

## 2. Highest-Spending Customers
**Objective**: Identify the customers who have spent the most.

```sql
SELECT customer_id, SUM(total_sale) AS total_spent
FROM retail_sales
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;
```
**Insight**: Knowing your highest-spending customers can inform loyalty programs and personalized marketing strategies.

## 3. Monthly Sales Trend
**Objective**: Analyze the sales trend across months to identify patterns.

```sql
SELECT EXTRACT(MONTH FROM sale_date) AS month, SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY month
ORDER BY month;
```
**Insight**: Helps identify which months have the highest sales volume and plan for seasonality.

## 4. Average Sales Per Transaction
**Objective**: Calculate the average sales amount per transaction.

```sql
SELECT AVG(total_sale) AS avg_sales
FROM retail_sales;
```
**Insight**: Useful for understanding the average transaction value, which can guide strategies for increasing order sizes.

## 5. Impact of Gender on Total Sales
**Objective**: Compare total sales across genders to determine purchasing behavior differences.

```sql
SELECT gender, SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY gender
ORDER BY total_sales DESC;
```
**Insight**: Helps identify whether certain demographics contribute more to sales and informs targeted marketing.

## 6. Revenue by Age Group
**Objective**: Determine which age group generates the most revenue.

```sql
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
```
**Insight**: Understanding which age groups spend more can guide marketing and product targeting strategies.

## 7. Peak Sales Hours
**Objective**: Identify the hours during the day when sales are the highest.

```sql
SELECT EXTRACT(HOUR FROM sale_time) AS hour, SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY hour
ORDER BY total_sales DESC;
```
**Insight**: Helps plan staffing and marketing efforts around peak sales times.


## Technologies Used
- SQL
- PostgreSQL/MySQL (or your preferred SQL database)

## Conclusion
This project demonstrates how to use SQL for analyzing retail sales data, focusing on key metrics such as sales trends, customer behavior, and product performance. 
Each query addresses a specific business question, providing actionable insights for retail strategy.
