Sales Data Cleaning and Analysis
This project involves the manipulation and cleaning of sales data from Walmart using SQL queries. The dataset includes various aspects of sales transactions such as invoice details, branch, city, customer information, product details, pricing, payment methods, and ratings.

Database Structure
The project starts by creating a database named salesDataWalmart and a table named sales with the following schema:

sql
Copy code
CREATE TABLE IF NOT EXISTS sales(
    invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    tax_pct FLOAT(6,4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct FLOAT(11,9),
    gross_income DECIMAL(12, 4),
    rating FLOAT(2, 1)
);
Data Cleaning and Manipulation
The SQL queries provided are used to clean and manipulate the data to derive useful insights. Key steps include:

Adding a time_of_day column to categorize sales time into morning, afternoon, or evening.
Adding day_name and month_name columns to categorize sales date into day names and month names respectively.
Performing various analyses to answer key questions about customer spending behavior, such as product category preferences, the influence of membership status on spending, preferred payment methods, sales volume by day of the week and city, distribution of purchase quantities, and common product lines by gender.
Key Factors Influencing Customer Spending
Product Categories with Highest Sales Volume
Analysis of sales volume by product line reveals the top-selling product categories.
Membership Status and Spending Behavior
Examination of how membership status (Member/Normal) affects spending behavior.
Preferred Payment Methods and Purchase Amounts
Investigation into the impact of payment methods (Ewallet, Credit card, Cash) on purchase amounts.
Sales Volume by Day of the Week
Determination of which day of the week experiences the highest sales volume.
Sales Volume by City
Identification of the city with the highest sales volume.
Distribution of Purchase Quantities for Each Product Category
Analysis of the distribution of purchase quantities for each product category.
Common Product Lines by Gender
Identification of the most common product lines by gender.
Conclusion
This README provides an overview of the SQL data manipulation and cleaning project for Walmart sales data. The queries presented help derive insights into various aspects of customer spending behavior, product preferences, and sales patterns.

Feel free to explore the provided SQL queries and results for deeper analysis of the dataset. For any questions or further assistance, please reach out to the project contributors.

Note: The SQL queries provided in this README are based on the project requirements and dataset. Adjustments may be needed based on specific use cases or dataset characteristics.
