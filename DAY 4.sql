CREATE DATABASE DAY_4;

USE  DAY_4;


CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    CustomerID INT,
    ProductName VARCHAR(50),
    Category VARCHAR(30),
    Quantity INT,
    Amount DECIMAL(10,2),
    SaleDate DATE
);

INSERT INTO Sales VALUES
(1,101,'Laptop','Electronics',1,55000,'2025-01-02'),
(2,102,'Mouse','Electronics',2,1200,'2025-01-03'),
(3,103,'Keyboard','Electronics',1,1800,'2025-01-05'),
(4,101,'Chair','Furniture',2,8000,'2025-01-08'),
(5,104,'Table','Furniture',1,6000,'2025-01-10'),
(6,105,'Mobile','Mobiles',1,25000,'2025-01-12'),
(7,106,'Headphones','Electronics',2,3000,'2025-01-15'),
(8,102,'Monitor','Electronics',1,12000,'2025-01-17'),
(9,107,'Notebook','Stationery',5,500,'2025-01-20'),
(10,108,'Pen','Stationery',10,300,'2025-01-21'),
(11,109,'Shoes','Fashion',1,3500,'2025-01-22'),
(12,110,'Watch','Fashion',1,4500,'2025-01-24'),
(13,103,'Tablet','Electronics',1,18000,'2025-01-25'),
(14,111,'Printer','Electronics',1,9000,'2025-01-27'),
(15,104,'Bag','Fashion',2,2000,'2025-01-28'),
(16,112,'Desk Lamp','Furniture',2,2400,'2025-02-01'),
(17,113,'TV','Electronics',1,42000,'2025-02-03'),
(18,101,'Phone Cover','Mobiles',3,900,'2025-02-05'),
(19,114,'Smart Watch','Electronics',1,7000,'2025-02-08'),
(20,115,'Water Bottle','Home',4,800,'2025-02-10');

create table Employee (
	Emp_ID int,
    Name varchar(20),
    Department varchar(30),
    City varchar(30),
    Salary decimal(15,2)
    
    );
    
INSERT INTO Employee (Emp_ID, Name, Department, City, Salary)
VALUES
(101, 'Amit Sharma', 'IT', 'Pune', 65000),
(102, 'Priya Patel', 'HR', 'Mumbai', 50000),
(103, 'Rahul Verma', 'Finance', 'Delhi', 72000),
(104, 'Sneha Joshi', 'Marketing', 'Pune', 58000),
(105, 'Vikram Singh', 'IT', 'Bangalore', 80000),
(106, 'Neha Gupta', 'HR', 'Hyderabad', 52000),
(107, 'Arjun Mehta', 'Finance', 'Mumbai', 69000),
(108, 'Kavita Rao', 'Marketing', 'Chennai', 61000),
(109, 'Rohan Desai', 'IT', 'Pune', 75000),
(110, 'Anjali Kulkarni', 'Sales', 'Nagpur', 55000);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Stock INT,
    DateAdded DATE
);

INSERT INTO Products (ProductID, ProductName, Category, Price, Stock, DateAdded)
VALUES
(101, 'Wireless Mouse', 'Electronics', 799, 45, '2026-06-01'),
(102, 'Gaming Keyboard', 'Electronics', 2499, 20, '2026-06-03'),
(103, 'Laptop Stand', 'Electronics', 1499, 18, '2026-06-05'),
(104, 'Office Chair', 'Furniture', 6999, 12, '2026-06-08'),
(105, 'Study Table', 'Furniture', 8999, 8, '2026-06-10'),
(106, 'Wooden Shelf', 'Furniture', 3499, 15, '2026-06-12'),
(107, 'Cotton T-Shirt', 'Clothing', 499, 80, '2026-06-15'),
(108, 'Jeans', 'Clothing', 1499, 35, '2026-06-17'),
(109, 'Hoodie', 'Clothing', 1999, 25, '2026-06-19'),
(110, 'Sneakers', 'Footwear', 2999, 30, '2026-06-21'),
(111, 'Running Shoes', 'Footwear', 4599, 14, '2026-06-23'),
(112, 'Formal Shoes', 'Footwear', 3799, 10, '2026-06-25'),
(113, 'Smartphone A', 'Mobiles', 15999, 22, '2026-06-27'),
(114, 'Smartphone B', 'Mobiles', 24999, 17, '2026-06-29'),
(115, 'Tablet', 'Mobiles', 18999, 9, '2026-07-01'),
(116, 'Smart Watch', 'Electronics', 5999, 28, '2026-07-03'),
(117, 'Bluetooth Speaker', 'Electronics', 2999, 42, '2026-07-05'),
(118, 'LED Monitor', 'Electronics', 12999, 11, '2026-07-06'),
(119, 'USB Cable', 'Electronics', 299, 100, '2026-07-07'),
(120, 'Power Bank', 'Electronics', 1999, 39, '2026-07-08'),
(121, 'Coffee Table', 'Furniture', 4999, 7, '2026-07-09'),
(122, 'Sofa', 'Furniture', 25999, 4, '2026-07-10'),
(123, 'Dining Table', 'Furniture', 18999, 5, '2026-07-11'),
(124, 'Bookshelf', 'Furniture', 5499, 16, '2026-07-12'),
(125, 'Jacket', 'Clothing', 2799, 18, '2026-07-13'),
(126, 'Cap', 'Clothing', 399, 60, '2026-07-14'),
(127, 'Socks', 'Clothing', 199, 120, '2026-07-15'),
(128, 'Sandals', 'Footwear', 999, 32, '2026-07-16'),
(129, 'Boots', 'Footwear', 5999, 6, '2026-07-17'),
(130, 'Headphones', 'Electronics', 3499, 26, '2026-07-18'),
(131, 'Printer', 'Electronics', 8499, 13, '2026-07-19'),
(132, 'Scanner', 'Electronics', 6499, 9, '2026-07-20'),
(133, 'Camera', 'Electronics', 45999, 3, '2026-07-21'),
(134, 'Tripod', 'Electronics', 1799, 21, '2026-07-22'),
(135, 'Refrigerator', 'Home Appliances', 34999, 2, '2026-07-23'),
(136, 'Washing Machine', 'Home Appliances', 28999, 5, '2026-07-24'),
(137, 'Microwave', 'Home Appliances', 9999, 8, '2026-07-25'),
(138, 'Air Conditioner', 'Home Appliances', 42999, 4, '2026-07-26'),
(139, 'Ceiling Fan', 'Home Appliances', 2499, 40, '2026-07-27'),
(140, 'Water Bottle', 'Accessories', 599, 70, '2026-07-28');


SELECT * FROM SALES;

-- Q1: Count the total number of rows in the Sales table using COUNT(*).

SELECT COUNT(*) AS TOTAL_COUNT
FROM Sales;

-- Q2: Count how many distinct products have been sold using COUNT(DISTINCT ProductName)

SELECT COUNT(DISTINCT ProductName) AS DISTINCT_COUNT
FROM Sales;

-- Q3: Find the total revenue using SUM(Amount).

SELECT SUM(Amount) AS TOTAL_REVENUE
FROM Sales;

-- Q4: Find the average sale amount using AVG(Amount).

SELECT AVG(Amount) AS AVG_AMOUNT
FROM Sales;

-- Q5: Find the minimum sale amount using MIN(Amount).

SELECT MIN(AMOUNT) AS MIN_AMOUNT 
FROM SALES;

-- Q6: Find the maximum sale amount using MAX(Amount).

SELECT MAX(Amount) AS MAX_AMOUNT
FROM Sales;

-- Q7: Count how many sales happened in the 'Electronics' category.

SELECT COUNT(*) AS SALES_COUNT
FROM Sales
WHERE Category = "ELECTRONICS";

-- Q8: Find the total quantity sold across all sales using SUM(Quantity).

SELECT SUM(Quantity) AS TOTAL_QUANTITY_SOLD
FROM Sales;

-- Q9: Find the average quantity sold per sale.

SELECT AVG(Quantity) AS AVG_QUANTITY_SOLD
FROM Sales;

-- Q10: Find the single highest sale amount and identify which product it belongs to.

SELECT ProductName, Amount
FROM Sales
ORDER BY Amount DESC
LIMIT 1;

-- Q11: Count how many distinct customers have placed at least one order.

SELECT COUNT(DISTINCT CustomerID) AS DISTINCT_CUSTOMERS
FROM Sales;

-- Q12: Calculate total revenue for one specific category using WHERE and SUM together.

SELECT SUM(Amount) AS TOTAL_REVENUE
FROM Sales
WHERE Category = "ELECTRONICS";

-- Q13: Find the minimum and maximum product price in a single query.

SELECT
	MIN(Amount) AS MIN_PRICE,
    MAX(Amount) AS MAX_AMOUNT
FROM Sales;

-- Q14: Count how many products have a Price greater than 1000.

SELECT COUNT(ProductName) AS PRODUCTS_PRICE_GRETER_THAN_1000
FROM Sales 
WHERE Amount >= 1000;
    
-- Q15: Calculate the average salary of employees using AVG(Salary) on the Employee table.

SELECT AVG(Salary) AS AVG_SALARY 
FROM Employee;

-- Q16: Find the total salary expense for the company using SUM(Salary).

SELECT SUM(SALARY) AS TOTAL_SALARY
FROM Employee ;

-- Q17: Count how many employees earn more than 50000 using COUNT with WHERE.

SELECT COUNT(EMP_ID) AS EMPLOYEE_COUNT 
FROM Employee
WHERE Salary > 50000;

-- Q18: Find the number of orders placed after a specific date.

SELECT COUNT(ProductTID) AS ORDER_COUNT
FROM Products
WHERE Dateadded > '2026-07-10';

-- Q19: Calculate total revenue and average revenue per sale together in one summary query.

SELECT
	SUM(Price) AS TOTAL_REVENUE,
    AVG(Price) AS AVG_REVENUE
FROM Products;

-- Q20: Build a one-row sales summary: total sales, total revenue, average sale, min sale, max sale 

SELECT 
	COUNT(*) AS TOTAL_SALES,
	SUM(Amount) AS TOTAL_REVENUE,
    AVG(Amount) AS AVG_SALES,
    MIN(Amount) AS MIN_SALES,
    MAX(Amount) AS MAX_SALES
FROM Sales;















