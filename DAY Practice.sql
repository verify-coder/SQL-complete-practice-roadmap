CREATE DATABASE DAY_Practice;
use DAY_Practice;

CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

INSERT INTO Department (DeptID, DeptName) VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Sales'),
(5, 'Marketing'),
(6, 'Operations');

CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    DeptID INT,
    City VARCHAR(50),
    Salary DECIMAL(10,2),
    ManagerID INT NULL,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

INSERT INTO Employee
(EmpID, Name, DeptID, City, Salary, ManagerID)
VALUES
(101, 'Amit',    1, 'Pune',    75000, NULL),
(102, 'Sneha',   1, 'Mumbai',  65000, 101),
(103, 'Rahul',   1, 'Pune',    55000, 101),
(104, 'Priya',   2, 'Delhi',   60000, NULL),
(105, 'Neha',    2, 'Pune',    45000, 104),
(106, 'Rohit',   3, 'Mumbai',  80000, NULL),
(107, 'Anjali',  3, 'Delhi',   50000, 106),
(108, 'Sagar',   4, 'Pune',    40000, NULL),
(109, 'Pooja',   4, 'Mumbai',  35000, 108),
(110, 'Akash',   5, 'Pune',    30000, NULL),
(111, 'Kiran',   5, 'Delhi',   28000, 110),
(112, 'Vijay',   6, 'Mumbai',  52000, NULL),
(113, 'Sonal',   6, 'Pune',    38000, 112),
(114, 'Arjun',   1, 'Delhi',   90000, 101),
(115, 'Meena',   4, 'Pune',    42000, 108);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50),
    Age INT
);

INSERT INTO Customers
(CustomerID, CustomerName, City, Age)
VALUES
(201, 'Ramesh', 'Pune', 28),
(202, 'Suresh', 'Mumbai', 35),
(203, 'Neha', 'Delhi', 24),
(204, 'Pooja', 'Pune', 42),
(205, 'Karan', 'Mumbai', 31),
(206, 'Snehal', 'Nashik', 27),
(207, 'Asha', 'Pune', 55),
(208, 'Vikas', 'Delhi', 38);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Amount DECIMAL(10,2),
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders
(OrderID, CustomerID, Amount, OrderDate)
VALUES
(301, 201, 5000, '2026-01-10'),
(302, 202, 7500, '2026-01-15'),
(303, 201, 3000, '2026-02-05'),
(304, 203, 9000, '2026-02-12'),
(305, 204, 4500, '2026-03-01'),
(306, 205, 12000, '2026-03-15'),
(307, 202, 6000, '2026-04-10');

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Stock INT
);

INSERT INTO Products
(ProductID, ProductName, Category, Price, Stock)
VALUES
(401, 'Laptop',       'Electronics', 65000, 10),
(402, 'Mobile',       'Electronics', 25000, 25),
(403, 'Keyboard',     'Electronics', 1500, 50),
(404, 'Mouse',        'Electronics', 800, 70),
(405, 'Chair',        'Furniture',   5000, 15),
(406, 'Table',        'Furniture',   9000, 8),
(407, 'T-Shirt',      'Clothing',    1000, 40),
(408, 'Jeans',        'Clothing',    2500, 30);

CREATE TABLE Colors (
    ColorID INT PRIMARY KEY,
    ColorName VARCHAR(30)
);

INSERT INTO Colors (ColorID, ColorName) VALUES
(1, 'Red'),
(2, 'Blue'),
(3, 'Black'),
(4, 'White');

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Amount DECIMAL(10,2),
    SaleDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Sales
(SaleID, ProductID, Amount, SaleDate)
VALUES
(501, 401, 65000, '2026-01-05'),
(502, 402, 25000, '2026-01-10'),
(503, 403, 3000,  '2026-01-15'),
(504, 401, 65000, '2026-02-05'),
(505, 404, 1600,  '2026-02-10'),
(506, 402, 50000, '2026-02-15'),
(507, 405, 10000, '2026-03-05'),
(508, 406, 9000,  '2026-03-10'),
(509, 407, 3000,  '2026-03-15'),
(510, 408, 5000,  '2026-04-05');

SHOW Tables;

-- Q1: Write a query to select all columns from a table and explain when SELECT * should be avoided.

SELECT EmpID, Name, Salary FROM  Employee;

-- Q2: Write a query using DISTINCT on two columns and explain how it differs from one column.

SELECT DISTINCT DeptID
FROM Employee;

-- Q3: Filter rows using WHERE with AND, OR, and NOT combined in one query.

SELECT *
FROM Employee
WHERE (City='Pune' OR City='Mumbai')
AND NOT Salary>40000;


-- Q4: Write a query using LIKE to match a pattern at the start, end, and middle of a string.

SELECT *
FROM Employee
WHERE Name LIKE 'A%'; -- Start
 
 SELECT *
 FROM Employee
 WHERE Name LIKE '%A'; -- End
 
 SELECT * 
 FROM Employee 
 WHERE Name LIKE 'an%'; -- Middle



-- Q5: Explain and demonstrate the difference between BETWEEN and using >= and <= manually.

SELECT * 
FROM Employee
WHERE Salary BETWEEN 30000 AND 40000;
SELECT * FROM
Employee
WHERE Salary>=40000 AND
Salary<=60000;

-- Q6: Write a query using IN and rewrite the same logic using multiple OR conditions.

SELECT *
FROM Employee
WHERE City IN("pune","Mumbai","Jalna","Solapur");


SELECT *
FROM Employee
WHERE CITY="Pune" OR
City="Mumbai" or
City="Solapur";


-- Q7: Sort a result set by two columns, one ascending and one descending, in the same query.

SELECT Salary
FROM Employee
ORDER BY Salary ASC;

SELECT * 
FROM Employee
ORDER BY EmpID DESC;


-- Q8: Use LIMIT and OFFSET together to fetch a specific 'page' of results.

SELECT * 
FROM Employee
ORDER BY Salary
LIMIT 1 OFFSET 2;

-- Q9: Explain the difference between COUNT(*) and COUNT(column_name).

SELECT COUNT(*) FROM Employee;

SELECT COUNT(Name) FROM Employee;

-- Q10: Write a query that finds the SUM, AVG, MIN, and MAX of a column in one SELECT.

SELECT 
SUM(Salary) AS Sum_Salary,
AVG(Salary) AS Avg_Salary,
MIN(Salary) AS Min_Salary,
MAX(Salary) AS Max_Salary
FROM Employee;

-- Q11: Explain why aggregate functions require GROUP BY when other columns are also selected.

SELECT 
Department,
AVG(Salary) AS Avg_Salary
FROM Employee
GROUP BY Department;

ALTER Table  Employee
ADD Column Department VARCHAR(50);

-- Q12: Write a GROUP BY query and explain when to use WHERE versus HAVING.

SELECT Avg(Salary) AS Avg_Salary,
SUM(Salary) AS Sum_Salary
WHERE Salary<=40000
GROUP BY Department
HAVING Salary>=45000; 

-- Q13: Write a query with GROUP BY and HAVING that filters on an aggregated value.

SELECT Department,COUNT(*) AS Employee_Count
FROM Employee
WHERE Salary >40000
GROUP BY Department 
HAVING COUNT(*)>5;

-- Q14: Explain the difference between INNER JOIN and LEFT JOIN with an example.

SELECT C.CustomerName, 
O.OrderID AS OrderID
FROM Customer C
INNER JOIN Orders O
ON C.CustomerID=O.CustomerID;


SELECT C.Name, O.orderID
FROM Customers C
LEFT JOIN Orders O 
ON  C.CustomerID=O.CustomerID;

-- Q15: Write a query showing unmatched rows using LEFT JOIN and IS NULL.

SELECT c.CustomerID, c.Name
FROM Customer c
LEFT JOIN Orders O
    ON c.CustomerID = o.CustomerID
WHERE o.CustomerID IS NULL;


-- Q16: Explain when a RIGHT JOIN might be preferred over rewriting as a LEFT JOIN.
-- Q17: Explain what a SELF JOIN is and give a real-world example of when to use one.
-- Q18: Explain what a CROSS JOIN produces and when it is actually useful.
-- Q19: Write a subquery inside a WHERE clause and explain how it executes.
-- Q20: Explain the difference between a correlated subquery and a regular subquery