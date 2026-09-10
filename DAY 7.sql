CREATE DATABASE DAY_7;

USE DAY_7;

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

INSERT INTO Employees
(EmpID, EmpName, Department, Salary)
VALUES
(1, 'Amit', 'IT', 95000),
(2, 'Rahul', 'HR', 65000),
(3, 'Priya', 'Finance', 35000),
(4, 'Sneha', 'IT', 82000),
(5, 'Rohan', 'Sales', 45000),
(6, 'Neha', 'HR', 55000),
(7, 'Vikas', 'IT', 30000),
(8, 'Pooja', 'Finance', 75000),
(9, 'Karan', NULL, 40000),
(10, 'Anjali', 'Sales', 90000);

	CREATE TABLE Customers (
		CustomerID INT PRIMARY KEY,
		CustomerName VARCHAR(50),
		Age INT,
		City VARCHAR(50),
		TotalSpend DECIMAL(10,2)
	);
    
    INSERT INTO Customers
(CustomerID, CustomerName, Age, City, TotalSpend)
VALUES
(1, 'Raj', 22, 'Mumbai', 30000),
(2, 'Priya', 35, 'Pune', 75000),
(3, 'Amit', 55, 'Delhi', 150000),
(4, 'Sneha', 28, 'Bangalore', 45000),
(5, 'Rahul', 48, 'Chennai', 90000),
(6, 'Neha', 62, 'Nagpur', 25000),
(7, 'Vikas', 21, 'Hyderabad', 120000),
(8, 'Pooja', 42, 'Pune', 55000),
(9, 'Karan', 67, 'Mumbai', 200000),
(10, 'Anjali', 30, 'Nashik', 35000);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Amount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders
(OrderID, CustomerID, Amount)
VALUES
(101, 1, 500),
(102, 2, 2500),
(103, 3, 7500),
(104, 4, 1200),
(105, 5, 6000),
(106, 6, 800),
(107, 7, 10000),
(108, 8, 4500),
(109, 9, 15000),
(110, 10, 3000);


CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Stock INT
);


INSERT INTO Products
(ProductID, ProductName, Stock)
VALUES
(1, 'Laptop', 25),
(2, 'Mouse', 7),
(3, 'Keyboard', 0),
(4, 'Monitor', 15),
(5, 'Printer', 5),
(6, 'Headphones', 30),
(7, 'Webcam', 0),
(8, 'Speaker', 10);


CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Marks INT
);

INSERT INTO Students
(StudentID, StudentName, Marks)
VALUES
(1, 'Amit', 85),
(2, 'Rahul', 72),
(3, 'Priya', 65),
(4, 'Sneha', 55),
(5, 'Rohan', 42),
(6, 'Neha', 35),
(7, 'Vikas', 90),
(8, 'Pooja', 78),
(9, 'Karan', 25),
(10, 'Anjali', 60);

-- Q1: Use CASE WHEN to label employees as 'High', 'Medium', or 'Low' salary based on set thresholds

SELECT
 EmpName,
Salary,
CASE
	WHEN Salary >= 80000 THEN 'HIGH'
	WHEN Salary >=40000 THEN 'Medium'
	ELSE 'LOW'
 END AS Salary_Band
FROM Employees;

-- Q2: Use CASE WHEN to classify customers into 'Young', 'Middle-aged', or 'Senior' based on Age

SELECT 
CustomerName,
Age,
CASE
	WHEN Age <25 THEN 'Young'
    WHEN Age <50 THEN 'Middle-aged'
    Else 'Senior'
    END AS Age_category
    FROM Customers;
    
    -- Q3: Use CASE WHEN to label orders as 'Small', 'Medium', or 'Large' based on Amount
    
    SELECT 
    OrderID,
    Amount,
    CASE 
		WHEN Amount <1000 THEN 'SMALL'
        WHEN Amount < 5000 THEN 'Medium'
        ELSE 'LARGE'
        END AS Amount_Label
        FROM Orders;
        
-- Q4: Use CASE WHEN inside ORDER BY to sort records in a custom priority order.
        
SELECT 
EmpName,
Salary,
CASE 
	WHEN Salary >=80000 THEN 'HIGH'
    WHEN Salary >=40000 THEN 'Medium'
    ELSE 'LOW'
    END AS Salary_Type
    FROM Employees
ORDER BY 
CASE 
	WHEN Salary >=80000 THEN 1
    WHEN Salary >=40000 THEN 2
    ELSE 3
    END;
    
-- Q5: Use CASE WHEN to convert a numeric marks column into letter grades (A, B, C, F).

SELECT 
StudentName,
Marks,
CASE 
	WHEN Marks >= 80 THEN 'A'
    WHEN Marks >= 60 THEN 'B'
    WHEN Marks >= 40 THEN 'C'
    ELSE 'F'
    END Grade
    FROM Students;
    
-- Q6: Combine CASE WHEN with GROUP BY to count how many employees fall into each salary band

SELECT 
CASE
	WHEN Salary >=80000 THEN 'HIGH'
    WHEN Salary >=40000 THEN 'Medium'
    ELSE 'LOW'
    END AS Salary_Band,
    COUNT(*) AS Employee_Count
    FROM Employees
 GROUP BY 
CASE	
	WHEN Salary >=80000 THEN 'HIGH'
    WHEN Salary >=40000 THEN 'Medium'
    ELSE 'LOW'
    END;

-- Q7: Use CASE WHEN to flag customers as 'VIP' when their total spend is above a chosen threshold

SELECT
    CustomerName,
    TotalSpend,
    CASE
        WHEN TotalSpend > 50000 THEN 'VIP'
        ELSE 'Regular'
    END AS Customer_Type
FROM Customers;
   
   --   Q8: Use CASE WHEN to create a Pass/Fail column based on a marks column 
   
   SELECT
    StudentName,
    Marks,
    CASE
        WHEN Marks >= 40 THEN 'Pass'
        ELSE 'Fail'
    END AS Result
   FROM Students;
   
-- Q9: Use CASE WHEN inside SUM() to total two categories separately in a single query (conditional aggregation)

SELECT 
SUM( 
CASE
	WHEN Amount < 5000 THEN Amount
    ELSE 0
    END
    ) AS Small_Order_Details,
SUM(
CASE
	WHEN Amount < 1000 THEN Amount 
    ELSE 0
    END
    ) AS Large_Order_Details
    FROM Orders;

--  Q10: Use CASE WHEN to label products as 'In Stock', 'Low Stock', or 'Out of Stock' based on Stock quantity

SELECT
    ProductName,
    Stock,
    CASE
        WHEN Stock = 0 THEN 'Out of Stock'
        WHEN Stock <= 10 THEN 'Low Stock'
        ELSE 'In Stock'
    END AS Stock_Status
FROM Products;

-- Q11: Use a nested CASE WHEN to classify employees by both salary and department together.

SELECT
    EmpName,
    Department,
    Salary,
    CASE
        WHEN Department = 'IT' THEN
            CASE
                WHEN Salary >= 80000 THEN 'IT High'
                ELSE 'IT Normal'
            END

        WHEN Department = 'HR' THEN
            CASE
                WHEN Salary >= 60000 THEN 'HR High'
                ELSE 'HR Normal'
            END

        ELSE 'Other'
    END AS Employee_Category
FROM Employees;

-- Q12: Use CASE WHEN to replace NULL values in a column with a readable default label.

SELECT
    EmpName,
    CASE
        WHEN Department IS NULL THEN 'Not Assigned'
        ELSE Department
    END AS Department_Name
FROM Employees;

-- Q14: Use CASE WHEN to categorize customers by City into 'Metro' or 'Non-Metro'.

SELECT
    OrderID,
    Amount,
    CASE
        WHEN Amount > 5000 THEN 10
        ELSE 5
    END AS Discount_Percent
FROM Orders;

-- Q15: Build a complete customer category report using CASE WHEN to segment customers by spend and age today's main task.

SELECT
    CustomerName,
    City,
    CASE
        WHEN City IN
        ('Mumbai', 'Delhi', 'Bangalore',
         'Chennai', 'Kolkata', 'Hyderabad')
        THEN 'Metro'
        ELSE 'Non-Metro'
    END AS City_Category
FROM Customers;