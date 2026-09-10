CREATE DATABASE DAY_5;

USE DAY_5;
  --  -Q1: Create an Employee table that includes a ManagerID column referencing EmpID
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Department VARCHAR(50),
    City VARCHAR(50),
    Salary INT,
    ManagerID INT,
FOREIGN KEY (ManagerID) REFERENCES Employee(EmpID)
);

INSERT INTO Employees VALUES
(101,'Amit Sharma','IT','Pune',90000,NULL),
(102,'Priya Verma','IT','Pune',65000,101),
(103,'Rahul Patil','IT','Mumbai',95000,101),
(104,'Sneha Joshi','HR','Delhi',60000,105),
(105,'Vikas Singh','HR','Delhi',80000,NULL),
(106,'Neha Gupta','Sales','Mumbai',55000,107),
(107,'Rohan Mehta','Sales','Mumbai',75000,NULL),
(108,'Karan Patel','Marketing','Ahmedabad',62000,109),
(109,'Anjali Shah','Marketing','Ahmedabad',85000,NULL),
(110,'Asha Rao','Finance','Pune',70000,111),
(111,'Raj Malhotra','Finance','Pune',95000,NULL),
(112,'Sameer Khan','IT','Pune',70000,101),
(113,'Pooja Patil','IT','Pune',50000,101),
(114,'Rahul Patil','Sales','Mumbai',58000,107),
(115,'Divya Nair','HR','Delhi',45000,105);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50)
);

INSERT INTO Products VALUES
(1,'Laptop'),
(2,'Mobile'),
(3,'Headphones'),
(4,'Shoes'),
(5,'Watch');

CREATE TABLE Colors (
    ColorID INT PRIMARY KEY,
    ColorName VARCHAR(30)
);


INSERT INTO Colors VALUES
(1,'Black'),
(2,'White'),
(3,'Blue'),
(4,'Red');

CREATE TABLE Sizes (
    SizeID INT PRIMARY KEY,
    SizeName VARCHAR(10)
);

INSERT INTO Sizes VALUES
(1,'S'),
(2,'M'),
(3,'L'),
(4,'XL');

CREATE TABLE Months (
    MonthID INT PRIMARY KEY,
    MonthName VARCHAR(20)
);

INSERT INTO Months VALUES
(1,'January'),
(2,'February'),
(3,'March'),
(4,'April'),
(5,'May'),
(6,'June'),
(7,'July'),
(8,'August'),
(9,'September'),
(10,'October'),
(11,'November'),
(12,'December');


-- Q2: Write a SELF JOIN to display each employee's name alongside their manager's name

SELECT
E.EmpName AS Employee,
M.EmpName AS Manager
FROM Employees E
LEFT JOIN Employees M
ON E.ManagerID = M.EmpID;

-- Q3: Find employees who have no manager (the top of the hierarchy) using SELF JOIN with IS NULL.

SELECT
E.EmpName
FROM Employees E
LEFT JOIN Employees M
ON E.ManagerID=M.EmpID
WHERE M.EmpID IS NULL;

-- Q4: Find all employees who report directly to one specific manager.

SELECT
E.EmpName,
M.EmpName AS Manager
FROM Employees E
JOIN Employees  
ON E.ManagerID=M.EmpID
WHERE M.EmpID=1;

-- Q5: Count how many employees report to each manager using SELF JOIN with GROUP BY.

SELECT M.EmpName as Manager,
COUNT(E.EmpID) as Count_Employees
FROM   Employees M
JOIN Employees E
ON  M.EmpID= E.ManagerID
GROUP BY M.EmpID, E.managerID;

-- Q6: Find pairs of employees who work in the same department using SELF JOIN

SELECT E1.EmpName,
E2.EmpName,
E1.Department
FROM EMPLOYEES E1
JOIN Employees E2
ON E1.Department=E2.Department
WHERE  E1.EmpID < E2.EmpID;

-- Q7: Find employees who earn more than their own manager using SELF JOIN

SELECT
E.EmpName,
E.Salary,
M.EmpName AS Manager,
M.Salary
FROM Employees E
JOIN Employees M
ON E.ManagerID=M.EmpID
WHERE E.Salary>M.Salary;

-- Q8: Write a CROSS JOIN between Products and Colors to generate every possible product-color combination.

SELECT 
ProductName,
ColorName
FROM Products
CROSS JOIN COLORS;

-- Q9: Use CROSS JOIN to create every Employee-Month combination for an attendance tracker

SELECT 
EmpName,
monthname
FROM Employees
CROSS JOIN  Months;

-- Q10: Compare the row count of an INNER JOIN versus a CROSS JOIN on the same two small tables.

SELECT *
FROM Sizes A
INNER JOIN Sizes B
ON A.SizeID=B.SizeID;

SELECT *
FROM Sizes A
CROSS JOIN Sizes B;

-- Q11: Use SELF JOIN to find employees who were hired in the same city as another employee.

SELECT E1.EmpName,
E2.EmpName,
E1.City
FROM Employees E1
JOIN Employees E2
ON E1.City=E2.City
AND E1.EmpID<E2.EmpID;

-- Q12: Build a 2-level hierarchy report - employee, manager, and manager's manager - using SELF JOIN twice

SELECT
E.EmpName AS Employee,
M.EmpName AS Manager,
MM.EmpName AS Managers_Manager
FROM Employees E
LEFT JOIN Employees M
ON E.ManagerID=M.EmpID
LEFT JOIN Employees MM
ON M.ManagerID=MM.EmpID;

-- Q13: Use CROSS JOIN to generate a price list for every Product-Size combination in a store

SELECT
ProductName,
SizeName
FROM Products
CROSS JOIN Sizes;

-- Q14: Find duplicate employee names in the table using SELF JOIN.

SELECT
E1.EmpName,
E1.EmpID,
E2.EmpID
FROM Employees E1
JOIN Employees E2
ON E1.EmpName=E2.EmpName
AND E1.EmpID<E2.EmpID;

-- Q15: Build the complete organization hierarchy report using SELF JOIN - today's main task

SELECT
E.EmpID,
E.EmpName AS Employee,
M.EmpName AS Manager,
MM.EmpName AS Senior_Manager
FROM Employees E
LEFT JOIN Employees M
ON E.ManagerID=M.EmpID
LEFT JOIN Employees MM
ON M.ManagerID=MM.EmpID
ORDER BY E.EmpID;