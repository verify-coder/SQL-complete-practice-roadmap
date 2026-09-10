CREATE DATABASE DAY_9;
USE DAY_9;

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    ManagerID INT
);

INSERT INTO Employees
(EmpID, EmpName, Department, Salary, ManagerID)
VALUES
(1, 'Rahul', 'IT', 90000, NULL),
(2, 'Amit', 'IT', 60000, 1),
(3, 'Priya', 'IT', 50000, 1),
(4, 'Raj', 'HR', 55000, NULL),
(5, 'Neha', 'HR', 45000, 4),
(6, 'Sneha', 'Finance', 70000, NULL),
(7, 'Vikas', 'Finance', 50000, 6),
(8, 'Rohan', 'IT', 40000, 2),
(9, 'Kiran', 'IT', 60000, 2),
(10, 'Pooja', 'HR', 45000, 4),
(11, 'Amit', 'IT', 60000, 1),
(12, 'Neha', 'HR', 45000, 4);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    TotalSpend INT
);


INSERT INTO Customers
(CustomerID, CustomerName, TotalSpend)
VALUES
(101, 'Anil',   150000),
(102, 'Sunil',  120000),
(103, 'Priya',  120000),
(104, 'Neha',    95000),
(105, 'Ravi',    80000),
(106, 'Pooja',   80000);


CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    CategoryID INT,
    Price INT,
    TotalSales INT
);


INSERT INTO Products
(ProductID, ProductName, CategoryID, Price, TotalSales)
VALUES
(301, 'Laptop',               1, 70000, 111),
(302, 'Gaming Laptop',        1, 95000, 131),
(303, 'Basic Laptop',         1, 45000, 141),

(304, 'Mobile',               2, 30000, 152),
(305, 'iPhone',               2, 80000, 43),
(306, 'Budget Mobile',        2, 15000, 65),

(307, 'Keyboard',             3, 2000,  98),
(308, 'Mechanical Keyboard',  3, 5000,  123),
(309, 'Wireless Keyboard',    3, 3000,  345),

(310, 'Headphones',           4, 4000,  12),
(311, 'Premium Headphones',   4, 10000, 342),
(312, 'Bluetooth Headphones', 4, 6000,  567);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    Salesperson VARCHAR(50),
    Region VARCHAR(50),
    Revenue INT
);

INSERT INTO Sales
(SaleID, Salesperson, Region, Revenue)
VALUES
(1, 'Rahul', 'North', 100000),
(2, 'Rahul', 'South', 150000),
(3, 'Rahul', 'West',   200000),

(4, 'Amit',  'North', 120000),
(5, 'Amit',  'South', 180000),
(6, 'Amit',  'West',   150000),

(7, 'Priya', 'North', 150000),
(8, 'Priya', 'South', 150000),
(9, 'Priya', 'West',   150000),

(10, 'Neha', 'North', 100000),
(11, 'Neha', 'South', 100000),
(12, 'Neha', 'West',   100000),

(13, 'Vikas','North',  90000),
(14, 'Vikas','South',  90000),
(15, 'Vikas','West',   90000);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderAmount INT,
    OrderDate DATE
);

INSERT INTO Orders
(OrderID, CustomerID, OrderAmount, OrderDate)
VALUES
(1001, 101, 5000, '2026-01-10'),
(1002, 101, 8000, '2026-02-15'),
(1003, 101, 3000, '2026-03-20'),

(1004, 102, 7000, '2026-01-05'),
(1005, 102, 9000, '2026-04-10'),
(1006, 102, 4000, '2026-05-15'),

(1007, 103, 6000, '2026-02-10'),
(1008, 103, 12000, '2026-05-20'),
(1009, 103, 5000, '2026-06-15'),

(1010, 104, 3000, '2026-03-01'),
(1011, 104, 7000, '2026-06-10');



-- Q1: Use ROW_NUMBER() to assign a unique rank to each employee ordered by salary.

SELECT 
EmpID,
EmpName,
Salary,
ROW_NUMBER() OVER (

				ORDER BY Salary DESC
				) AS Salary_Row
FROM Employees;

-- Q2: Use RANK() to rank employees by salary and note how tied values are handled.

SELECT 
EmpID,
EmpName,
Salary,
RANK () OVER(
			ORDER BY Salary DESC
				) AS Salary_Rank
FROM EMployees;

-- Q3: Use DENSE_RANK() on the same data and compare its results with RANK().

SELECT 
EmpID,
EmpName,
Salary,
DENSE_RANK() OVER (
					ORDER BY Salary DESC
                    ) AS Salary_DenseRank
FROM Employees;

-- Q4: Use ROW_NUMBER() with PARTITION BY Department to rank employees within each department.

SELECT 
EmpID,
EmpName,
Salary,
Department,
ROW_NUMBER() OVER(
                   PARTITION BY Department
                   ORDER BY Salary DESC
                   ) AS Salary_no
FROM EMployees;

-- Q5: Find the top 3 highest-paid employees in each department using RANK() and a filter.

with RankedSalary  AS (
SELECT 
EmpID,
EmpName,
Salary,
Department,
RANK() OVER(
             PARTITION BY Department
             ORDER BY Salary DESC
             ) AS Salary_Rank
FROM Employees
)
SELECT * FROM
RankedSalary
WHERE Salary_Rank<=3;

-- Q6: Use ROW_NUMBER() to remove duplicate rows, keeping only the first occurrence per group.

WITH DuplicateData AS (
SELECT 
EmpName,
EmpID,
Department,
ROW_NUMBER() OVER (
					PARTITION BY Department,EmpName
                    ORDER BY EmpID
                    ) AS RowNum
FROM Employees
)
SELECT 
EmpName,
EmpID,
Department
FROM DuplicateData
WHERE RowNum=1;

-- Q7: Rank products within each category by total sales using RANK().

SELECT 
ProductName,
ProductID,
TotalSales,
Category,
RANK() OVER(
			PARTITION BY Category
            ORDER BY TotalSales DESC
            )AS Total_Rank
FROM Products;

UPDATE PRODUCTS
SET PRODUCTID=311
WHERE PRODUCTID=411;


ALTER TABLE Products 
ADD column TotalSales INT;
ALTER TABLE Products
ADD COLUMN Category INT;

SHOW COLUMNS FROM Products;
SELECT * FROM Products;

-- Q8: Use DENSE_RANK() to rank customers by total spend without skipping numbers on ties.

SELECT
CustomerID,
CustomerName,
TotalSpend,
DENSE_RANK() OVER(
					ORDER BY TotalSpend DESC
                    )AS Total_rank
FROM Customers;

ALTER TABLE CUSTOMERS
ADD COLUMN TotalSpend INT;

UPDATE Customers
SET TotalSpend = CASE CustomerID
    WHEN 101 THEN 150000
    WHEN 102 THEN 120000
    WHEN 103 THEN 120000
    WHEN 104 THEN 95000
    WHEN 105 THEN 80000
    WHEN 106 THEN 80000
END
WHERE CustomerID IN (101,102,103,104,105,106);

-- Q9: Find the 2nd highest sale in each region using ROW_NUMBER() with PARTITION BY.

WITH HighestSale AS (
SELECT 
 Salesperson,
SaleID,
Revenue,
Region,
ROW_NUMBER() OVER(
				ORDER BY Region DESC
                ) AS Data_No
FROM Sales
)
SELECT 
 Salesperson,
SaleID,
Revenue
Region FROM HighestSale
WHERE Data_No=2;

-- Q10: Build a leaderboard of top salespeople by total revenue using RANK().
SELECT
    Salesperson,
    SUM(Revenue) AS TotalRevenue,
    RANK() OVER (
        ORDER BY SUM(Revenue) DESC
    ) AS Leaderboard_Rank
FROM Sales
GROUP BY Salesperson
ORDER BY Leaderboard_Rank;

-- Q11: Use ROW_NUMBER() to paginate a large result set, returning only rows 11-20.

WITH NumberedEmployees AS (
    SELECT
        EmpID,
        EmpName,
        Department,
        Salary,
        ROW_NUMBER() OVER (
            ORDER BY EmpID
        ) AS RowNum
    FROM Employees
)
SELECT *
FROM NumberedEmployees
WHERE RowNum BETWEEN 11 AND 20;

-- Q12: Compare ROW_NUMBER(), RANK(), and DENSE_RANK() side by side on the same ordered column.

SELECT 
EmpID,
EmpName,
Salary,
ROW_NUMBER() OVER(
					ORDER BY Salary DESC
                    )AS Row_no,
RANK() OVER (
				ORDER BY Salary DESC
                ) AS Rank_Salary,
DENSE_RANK() OVER(
					ORDER BY Salary DESC
                    )AS Dense_no
	FROM Employees;
    
-- Q13: Rank employees by hire date to find the most senior employee in each department.

SELECT
    EmpID,
    EmpName,
    Department,
    HireDate,
    ROW_NUMBER() OVER (
        PARTITION BY Department
        ORDER BY HireDate ASC
    ) AS Seniority_Rank
FROM Employees;

-- Q14: Use PARTITION BY City combined with RANK() to find the top earner in each city.

WITH CitySalary AS (
    SELECT
        EmpID,
        EmpName,
        City,
        Salary,
        RANK() OVER (
            PARTITION BY City
            ORDER BY Salary DESC
        ) AS Salary_Rank
    FROM Employees
)
SELECT *
FROM CitySalary
WHERE Salary_Rank = 1;

-- Q15: Find employees tied for the highest salary using a filter of RANK() = 1.

WITH RankedEmployees AS (
    SELECT
        EmpID,
        EmpName,
        Salary,
        RANK() OVER (
            ORDER BY Salary DESC
        ) AS Salary_Rank
    FROM Employees
)
SELECT
    EmpID,
    EmpName,
    Salary
FROM RankedEmployees
WHERE Salary_Rank = 1;

-- Q16: Use DENSE_RANK() to assign performance tiers (1st, 2nd, 3rd tier) to salespeople.

SELECT
    EmpName,
    Salary,
    DENSE_RANK() OVER (
        ORDER BY Salary DESC
    ) AS Performance_Tier
FROM Employees;

-- Q17: Rank orders by amount within each customer using ROW_NUMBER() PARTITION BY CustomerID.

SELECT
    OrderID,
    CustomerID,
    OrderAmount,
    ROW_NUMBER() OVER (
        PARTITION BY CustomerID
        ORDER BY OrderAmount DESC
    ) AS Order_Rank
FROM Orders;

ALTER TABLE ORDERS
ADD COLUMN OrderAmount INT;

-- Q18: Use ROW_NUMBER() to find the most recent order placed by each customer.

WITH RecentOrders AS (
    SELECT
        OrderID,
        CustomerID,
        OrderAmount,
        OrderDate,
        ROW_NUMBER() OVER (
            PARTITION BY CustomerID
            ORDER BY OrderDate DESC
        ) AS RowNum
    FROM Orders
)
SELECT
    OrderID,
    CustomerID,
    OrderAmount,
    OrderDate
FROM RecentOrders
WHERE RowNum = 1;

-- Q19: Combine RANK() with a CTE to keep only the top-ranked row per group.

WITH RankedEmployees AS (
    SELECT
        EmpID,
        EmpName,
        Department,
        Salary,
        RANK() OVER (
            PARTITION BY Department
            ORDER BY Salary DESC
        ) AS Salary_Rank
    FROM Employees
)
SELECT
    EmpID,
    EmpName,
    Department,
    Salary
FROM RankedEmployees
WHERE Salary_Rank = 1;

-- Q20: Build a complete sales leaderboard: rank, salesperson name, total revenue - today's main task

SELECT
    RANK() OVER (
        ORDER BY SUM(Revenue) DESC
    ) AS Sales_Rank,
    Salesperson,
    SUM(Revenue) AS Total_Revenue
FROM Sales
GROUP BY Salesperson
ORDER BY Sales_Rank;