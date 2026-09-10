CREATE DATABASE day_6;
use day_6;

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

INSERT INTO Departments VALUES
(1,'HR'),
(2,'IT'),
(3,'Sales'),
(4,'Finance'),
(5,'Marketing');

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Salary INT,
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

INSERT INTO Employees VALUES
(101,'Amit',45000,1),
(102,'Priya',60000,2),
(103,'Rahul',55000,2),
(104,'Sneha',70000,3),
(105,'Vikas',80000,3),
(106,'Neha',50000,4),
(107,'Arjun',90000,2),
(108,'Pooja',40000,1),
(109,'Karan',75000,5),
(110,'Riya',65000,5),
(111,'Deepak',95000,4),
(112,'Anjali',35000,1),
(113,'Sahil',68000,3),
(114,'Meera',58000,2),
(115,'Rohan',52000,5);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50)
);

INSERT INTO Customers VALUES
(1,'Rohit','Pune'),
(2,'Akash','Mumbai'),
(3,'Simran','Delhi'),
(4,'Anita','Nagpur'),
(5,'Kunal','Pune'),
(6,'Nisha','Jaipur'),
(7,'Raj','Hyderabad'),
(8,'Tina','Surat'),
(9,'Ajay','Chennai'),
(10,'Sara','Bangalore');

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    Price INT
);

INSERT INTO Products VALUES
(1,'Laptop','Electronics',70000),
(2,'Mouse','Electronics',800),
(3,'Keyboard','Electronics',1500),
(4,'Chair','Furniture',4500),
(5,'Table','Furniture',8000),
(6,'Notebook','Stationery',100),
(7,'Pen','Stationery',50),
(8,'Phone','Electronics',40000),
(9,'Printer','Electronics',12000),
(10,'Cupboard','Furniture',15000);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderAmount INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders VALUES
(1001,1,2500),
(1002,2,15000),
(1003,3,7000),
(1004,1,12000),
(1005,4,5000),
(1006,5,22000),
(1007,6,3000),
(1008,2,4500),
(1009,7,18000),
(1010,9,10000);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY(ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Sales VALUES
(1,1,2),
(2,2,15),
(3,3,10),
(4,4,5),
(5,5,3),
(6,8,7),
(7,9,2),
(8,1,1),
(9,2,6),
(10,4,2);

-- Q1: Find the employee with the highest salary using a subquery inside WHERE.

SELECT * FROM Employees
WHERE Salary = (SELECT MAX(Salary) FROM Employees);

-- Q2: Find employees earning more than the average salary using a subquery.

SELECT * 
 FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM EMPLOYEES);

-- Q3: Find the second-highest salary using a subquery combined with LIMIT and OFFSET.

SELECT * 
FROM Employees
WHERE Salary=(SELECT distinct salary
				FROM Employees
				ORDER BY Salary DESC
				LIMIT 1 OFFSET 1);

-- Q5: Find customers who have placed at least one order using a subquery with IN.

SELECT *
FROM CUSTOMERS 
WHERE CUSTOMERID IN 
	(SELECT CUSTOMERID 
	FROM ORDERS);

-- Q6: Find customers who have never placed an order using a subquery with NOT IN

SELECT * 
FROM CUSTOMERS 
WHERE CustomerID  NOT IN (SELECT CustomerID 
						     FROM Orders);
                             
-- Q7: Find the department with the highest total salary using a subquery.

SELECT D.deptname,E.salary
FROM Departments D 
JOIN Employees E
ON D.DeptID=E.DeptID
WHERE Salary=(SELECT AVG(Salary)
			   FROM Employees);


-- Q8: Use a subquery inside SELECT to show each employee's salary next to the company-wide average.

SELECT EmpID,EmpName,Salary,
(SELECT AVG(Salary) 
    FROM Employees
)
AS Average_Salary
FROM Employees;

-- Q9: Find products that have never been sold using a subquery with NOT IN on the Sales table.
SELECT *
FROM PRODUCTS
WHERE PRODUCTID NOT IN (
	SELECT PRODUCTID
    FROM SALES
);    

-- Q10: Use a correlated subquery to find employees earning more than the average salary of their own department.
SELECT *
FROM EMPLOYEES AS E
WHERE SALARY > (
	SELECT AVG(SALARY) AS AVG_SALARY
    FROM EMPLOYEES
    WHERE DEPTID = E.DEPTID
);

-- Q11 Use EXISTS to find customers who have placed at least one order.

SELECT * FROM Customers AS C
WHERE exists( SELECT * From Orders as O
             WHERE C.CustomerID= O.CustomerID
              );
              
-- Q12: Use NOT EXISTS to find products with zero recorded sales.

SELECT *
FROM Products AS P 
WHERE NOT EXISTS (
	SELECT *
    FROM Sales AS S 
	WHERE P.PRODUCTID = S.PRODUCTID
);

-- Q13: Find the lowest-paid employee in each department using a correlated subquery.

SELECT *
FROM Employees AS E
WHERE Salary =( 
	SELECT MIN(Salary)
    FROM  Employees
    WHERE DEPTID = E.DEPTID
);

-- Q14: Use a subquery to find orders with an amount greater than the average order amount.

SELECT *
FROM Orders
WHERE OrderAmount > ( 
	SELECT AVG(OrderAmount)
    FROM Orders
);

-- Q15: Find categories where the average price is higher than the overall average price using a subquery.

SELECT Category, AVG(Price) AS AVG_CATEGORY_PRICE
FROM Products  
GROUP BY Category
HAVING AVG(Price) > (
	SELECT AVG(Price) 
    FROM Products
);

-- Q17: Use a subquery to count how many employees earn above the company-wide average salary.

SELECT COUNT(EMPNAME)
FROM Employees
WHERE Salary > ( 
	SELECT AVG(Salary)
    FROM Employees
);

-- Q18: Use a subquery inside FROM to first summarize sales by category, then filter that summary.

SELECT Category, Total_Quantity
FROM (
    SELECT P.Category, SUM(s.Quantity) AS Total_Quantity
    FROM sales S
    JOIN products p
    ON S.ProductID = p.ProductID
    GROUP BY p.Category
) AS Category_Summary
WHERE Total_Quantity > 10;

-- Q19: Find the customer who has spent the most in total using a subquery.

SELECT *
FROM Customers
WHERE CustomerID = (
    SELECT CustomerID
    FROM (
        SELECT CustomerID, SUM(OrderAmount) AS TotalSpent
        FROM Orders
        GROUP BY CustomerID
        ORDER BY TotalSpent DESC
        LIMIT 1
    ) AS HighestSpender
);

-- Q20: Find the employee with the highest salary in the entire company, along with their department name 

SELECT E.EmpID,
       E.EmpName,
       E.Salary,
       D.DepTName
FROM Employees E
JOIN Departments D
ON E.DeptID = D.DeptID
WHERE E.Salary = (
    SELECT MAX(Salary)
    FROM Employees
);


