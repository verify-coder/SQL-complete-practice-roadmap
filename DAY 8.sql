CREATE DATABASE DAY_8;
USE DAY_8;

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
    City VARCHAR(50)
);

INSERT INTO Customers
(CustomerID, CustomerName, City)
VALUES
(101, 'Siddhesh', 'Pune'),
(102, 'Aarav', 'Mumbai'),
(103, 'Riya', 'Delhi'),
(104, 'Rohit', 'Pune'),
(105, 'Snehal', 'Mumbai'),
(106, 'Kunal', 'Nashik'),
(107, 'Priyanka', 'Pune'),
(108, 'Akash', 'Nagpur'),
(109, 'Neha', 'Mumbai'),
(110, 'Vishal', 'Pune');

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    CategoryID INT,
    Price DECIMAL(10,2)
);


INSERT INTO Products
(ProductID, ProductName, CategoryID, Price)
VALUES
(201, 'Laptop', 1, 70000),
(202, 'Gaming Laptop', 1, 95000),
(203, 'Basic Laptop', 1, 45000),

(204, 'Mobile', 2, 30000),
(205, 'iPhone', 2, 80000),
(206, 'Budget Mobile', 2, 15000),

(207, 'Keyboard', 3, 2000),
(208, 'Mechanical Keyboard', 3, 5000),
(209, 'Wireless Keyboard', 3, 3000),

(210, 'Headphones', 4, 4000),
(211, 'Premium Headphones', 4, 10000),
(212, 'Bluetooth Headphones', 4, 6000);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    Amount DECIMAL(10,2),

    FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID)
);

INSERT INTO Orders
(OrderID, CustomerID, OrderDate, Amount)
VALUES
(1001, 101, '2026-01-05', 25000),
(1002, 102, '2026-01-10', 60000),
(1003, 103, '2026-01-15', 15000),
(1004, 101, '2026-02-05', 40000),
(1005, 104, '2026-02-12', 80000),
(1006, 105, '2026-02-20', 30000),
(1007, 102, '2026-03-03', 70000),
(1008, 106, '2026-03-15', 12000),
(1009, 107, '2026-03-20', 55000),
(1010, 108, '2026-04-02', 20000),
(1011, 101, '2026-04-10', 90000),
(1012, 109, '2026-04-15', 45000),
(1013, 102, '2026-05-01', 110000),
(1014, 104, '2026-05-10', 65000),
(1015, 105, '2026-05-15', 25000),
(1016, 107, '2026-06-05', 75000),
(1017, 110, '2026-06-12', 15000),
(1018, 101, '2026-06-20', 50000);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    SaleDate DATE,
    Category VARCHAR(50),
    Quantity INT,
    UnitPrice DECIMAL(10,2)
);

INSERT INTO Sales
(SaleID, ProductID, CustomerID, SaleDate, Category, Quantity, UnitPrice)
VALUES
(1, 201, 101, '2026-01-05', 'Laptop', 2, 70000),
(2, 202, 102, '2026-01-10', 'Laptop', 1, 95000),
(3, 203, 103, '2026-01-15', 'Laptop', 3, 45000),

(4, 204, 104, '2026-02-05', 'Mobile', 2, 30000),
(5, 205, 105, '2026-02-10', 'Mobile', 1, 80000),
(6, 206, 106, '2026-02-20', 'Mobile', 4, 15000),

(7, 207, 107, '2026-02-25', 'Keyboard', 5, 2000),
(8, 208, 108, '2026-02-28', 'Keyboard', 3, 5000),
(9, 209, 109, '2026-02-28', 'Keyboard', 4, 3000),

(10, 210, 101, '2026-03-05', 'Headphones', 5, 4000),
(11, 211, 102, '2026-03-10', 'Headphones', 2, 10000),
(12, 212, 103, '2026-03-15', 'Headphones', 4, 6000),

(13, 201, 104, '2026-04-05', 'Laptop', 1, 70000),
(14, 202, 105, '2026-04-10', 'Laptop', 2, 95000),
(15, 204, 106, '2026-04-15', 'Mobile', 3, 30000),

(16, 205, 107, '2026-05-05', 'Mobile', 2, 80000),
(17, 207, 108, '2026-05-10', 'Keyboard', 10, 2000),
(18, 211, 109, '2026-05-15', 'Headphones', 3, 10000),

(19, 203, 110, '2026-06-05', 'Laptop', 2, 45000),
(20, 206, 101, '2026-06-10', 'Mobile', 5, 15000);

CREATE TABLE Returns (
    ReturnID INT PRIMARY KEY,
    ProductID INT,
    ReturnDate DATE,
    Amount DECIMAL(10,2)
);

INSERT INTO Returns
(ReturnID, ProductID, ReturnDate, Amount)
VALUES
(1, 201, '2026-01-20', 70000),
(2, 202, '2026-02-15', 95000),
(3, 204, '2026-02-20', 30000),
(4, 205, '2026-03-10', 80000),
(5, 207, '2026-03-15', 2000),
(6, 210, '2026-04-10', 4000),
(7, 211, '2026-05-20', 10000);


SHOW TABLES;



-- Q1: Write a simple CTE that selects all employees earning above 40000, then query from it.

WITH HighSalary AS (
    SELECT *
    FROM Employees
    WHERE Salary > 40000
)
SELECT *
FROM HighSalary;

-- Q2: Use a CTE to summarize total sales per category, then filter categories above a chosen threshold.

WITH CategorySales AS (
    SELECT
        Category,
        SUM(Quantity * UnitPrice) AS Total_Sales
    FROM Sales
    GROUP BY Category
)
SELECT
    Category,
    Total_Sales
FROM CategorySales
WHERE Total_Sales > 100000;

-- Q3: Use a CTE to first summarize orders per customer, then join it back to the Customers table.

WITH CustomerOrders AS (
    SELECT
        CustomerID,
        COUNT(*) AS Total_Orders
    FROM Orders
    GROUP BY CustomerID
)
SELECT
    C.CustomerID,
    C.CustomerName,
    COALESCE(CO.Total_Orders, 0) AS Total_Orders
FROM Customers C
LEFT JOIN CustomerOrders CO
    ON C.CustomerID = CO.CustomerID;
    
-- Q4: Use a CTE to calculate average salary per department, then compare each employee to their own department average.

WITH DeptAverage AS (
    SELECT
        Department,
        AVG(Salary) AS Avg_Salary
    FROM Employees
    GROUP BY Department
)
SELECT
    E.EmpID,
    E.EmpName,
    E.Department,
    E.Salary,
    D.Avg_Salary,
    
    CASE
        WHEN E.Salary > D.Avg_Salary THEN 'Above Average'
        WHEN E.Salary < D.Avg_Salary THEN 'Below Average'
        ELSE 'Equal'
    END AS Salary_Status

FROM Employees E
JOIN DeptAverage D
    ON E.Department = D.Department;
    
-- Q5: Rewrite one of your Day 24 subquery answers using a CTE instead.

WITH AvgSalary AS (
    SELECT AVG(Salary) AS Average_Salary
    FROM Employees
)
SELECT
    E.*
FROM Employees E
CROSS JOIN AvgSalary A
WHERE E.Salary > A.Average_Salary;

-- Q6: Use a CTE to calculate monthly revenue, then find the single month with the highest revenue.

WITH MonthlyRevenue AS (
    SELECT
        YEAR(OrderDate) AS Order_Year,
        MONTH(OrderDate) AS Order_Month,
        SUM(Amount) AS Total_Revenue
    FROM Orders
    GROUP BY
        YEAR(OrderDate),
        MONTH(OrderDate)
)
SELECT
    Order_Year,
    Order_Month,
    Total_Revenue
FROM MonthlyRevenue
ORDER BY Total_Revenue DESC
LIMIT 1;

-- Q7: Use two CTEs in one query - one for total sales, one for total returns - then combine them.

WITH TotalSales AS (
    SELECT
        ProductID,
        SUM(Quantity * UnitPrice) AS Sales
    FROM Sales
    GROUP BY ProductID
),

TotalReturns AS (
    SELECT
        ProductID,
        SUM(Amount) AS Returns
    FROM Returns
    GROUP BY ProductID
)

SELECT
    COALESCE(S.ProductID, R.ProductID) AS ProductID,
    COALESCE(S.Sales, 0) AS Total_Sales,
    COALESCE(R.Returns, 0) AS Total_Returns,
    COALESCE(S.Sales, 0) - COALESCE(R.Returns, 0) AS Net_Sales
FROM TotalSales S
LEFT JOIN TotalReturns R
    ON S.ProductID = R.ProductID;
    
-- Q8: Use a CTE to identify the top 5 customers by total spend.

WITH CustomerSpend AS (
    SELECT
        CustomerID,
        SUM(Amount) AS Total_Spend
    FROM Orders
    GROUP BY CustomerID
)
SELECT
    C.CustomerID,
    C.CustomerName,
    CS.Total_Spend
FROM CustomerSpend CS
JOIN Customers C
    ON CS.CustomerID = C.CustomerID
ORDER BY CS.Total_Spend DESC
LIMIT 5;


-- Q9: Use a recursive CTE to list an employee hierarchy starting from a top-level manager.

WITH RECURSIVE EmployeeHierarchy AS (

    -- Anchor: top-level manager
    SELECT
        EmpID,
        EmpName,
        ManagerID,
        0 AS Level
    FROM Employees
    WHERE ManagerID IS NULL

    UNION ALL

    -- Recursive part
    SELECT
        E.EmpID,
        E.EmpName,
        E.ManagerID,
        EH.Level + 1
    FROM Employees E
    JOIN EmployeeHierarchy EH
        ON E.ManagerID = EH.EmpID
)

SELECT
    EmpID,
    EmpName,
    ManagerID,
    Level
FROM EmployeeHierarchy
ORDER BY Level, EmpID;

-- Q10: Use a CTE to remove duplicate rows, keeping only the first row per group.
WITH RankedEmployees AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY EmpName, Department, Salary
            ORDER BY EmpID
        ) AS Row_Num
    FROM Employees
)
SELECT
    EmpID,
    EmpName,
    Department,
    Salary
FROM RankedEmployees
WHERE Row_Num = 1;

-- Q11: Use a CTE to list products priced above their own category's average price.

WITH CategoryAverage AS (
    SELECT
        CategoryID,
        AVG(Price) AS Avg_Price
    FROM Products
    GROUP BY CategoryID
)
SELECT
    P.ProductID,
    P.ProductName,
    P.CategoryID,
    P.Price,
    CA.Avg_Price
FROM Products P
JOIN CategoryAverage CA
    ON P.CategoryID = CA.CategoryID
WHERE P.Price > CA.Avg_Price;

-- Q12: Use a CTE to clean and prepare data before applying window functions on top of it.

WITH CleanData AS (
    SELECT
        EmpID,
        TRIM(EmpName) AS EmpName,
        Department,
        Salary
    FROM Employees
)

SELECT
    EmpID,
    EmpName,
    Department,
    Salary,

    RANK() OVER (
        PARTITION BY Department
        ORDER BY Salary DESC
    ) AS Salary_Rank

FROM CleanData;

-- Q13: Use a CTE to break a long, nested Day 24 subquery into clear, readable steps.


-- Q14: Combine a CTE with CASE WHEN to build a customer segmentation report.

WITH CustomerSpend AS (
    SELECT
        CustomerID,
        SUM(Amount) AS Total_Spend
    FROM Orders
    GROUP BY CustomerID
)
SELECT
    C.CustomerID,
    C.CustomerName,
    CS.Total_Spend,

    CASE
        WHEN CS.Total_Spend >= 100000 THEN 'Platinum'
        WHEN CS.Total_Spend >= 50000 THEN 'Gold'
        WHEN CS.Total_Spend >= 20000 THEN 'Silver'
        ELSE 'Bronze'
    END AS Customer_Segment

FROM CustomerSpend CS
JOIN Customers C
    ON CS.CustomerID = C.CustomerID
ORDER BY CS.Total_Spend DESC;

-- Q15: Build a sales ranking report using a CTE that ranks products by total revenue - today's main task

WITH ProductRevenue AS (
    SELECT
        ProductID,
        SUM(Quantity * UnitPrice) AS Total_Revenue
    FROM Sales
    GROUP BY ProductID
),

ProductRanking AS (
    SELECT
        ProductID,
        Total_Revenue,
        RANK() OVER (
            ORDER BY Total_Revenue DESC
        ) AS Sales_Rank
    FROM ProductRevenue
)

SELECT
    ProductID,
    Total_Revenue,
    Sales_Rank
FROM ProductRanking
ORDER BY Sales_Rank;