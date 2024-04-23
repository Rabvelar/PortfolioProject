-- Create database
CREATE DATABASE IF NOT EXISTS salesDataWalmart;


-- Create table
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


-- ----------------
SELECT
	time,
	(CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END) AS time_of_day
FROM sales;

ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);

UPDATE sales
SET time_of_day = (
	CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END
);

-- Add day_name column
SELECT
	date,
	DAYNAME(date)
FROM sales;

ALTER TABLE sales ADD COLUMN day_name VARCHAR(10);

UPDATE sales
SET day_name = DAYNAME(date);

-- Add month_name column
SELECT
	date,
	MONTHNAME(date)
FROM sales;

ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);

UPDATE sales
SET month_name = MONTHNAME(date);

-- ------------------------------------------------
-- “What are the key factors influencing customer spending?”

-- Which product categories have the highest sales volume?
SELECT product_line, COUNT(*) AS SalesCount, SUM(Total) AS TotalSales
FROM sales
GROUP BY product_line
ORDER BY TotalSales DESC;


-- Whether membership status (Member/Normal) affects spending behavior.
SELECT customer_type, COUNT(*) AS CustomerCount, AVG(Total) AS AverageSpending
FROM sales
GROUP BY customer_type
ORDER BY CustomerCount DESC;

-- The preferred payment methods (Ewallet, Credit card, Cash) and their impact on purchase amounts.
SELECT payment, COUNT(*) AS PurchaseCount, AVG(Total) AS AveragePurchaseAmount
FROM sales
GROUP BY payment
ORDER BY PurchaseCount DESC;

-- Which day of the week has the highest sales volume?
SELECT DAYNAME(date) AS DayOfWeek,SUM(Total) AS TotalSales
FROM sales
GROUP BY DayOfWeek
ORDER BY TotalSales DESC
LIMIT 1;

-- Which city has the highest sales volume?
SELECT City, SUM(Total) AS TotalSales
FROM sales
GROUP BY City
ORDER BY TotalSales DESC
LIMIT 1;

-- What is the distribution of purchase quantities for each product category?
SELECT product_line, COUNT(*) AS TransactionCount, AVG(quantity) AS AvgQuantity
FROM sales
GROUP BY product_line;

-- What is the most common product line by gender
SELECT gender,product_line,
    COUNT(gender) AS total_count
FROM sales
GROUP BY gender, product_line
ORDER BY total_count DESC;