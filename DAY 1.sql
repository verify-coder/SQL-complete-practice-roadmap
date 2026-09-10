create database Day_1;

use Day_1;

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


-- Q2: Create a database named 'company' using CREATE DATABASE.

create database company;
show databases;

use company;

-- Q3: Create an Employee table with columns EmpID, Name, Department, City, Salary 

create table Employee(
	Emp_ID int,
    Name varchar(20),
    Department varchar(30),
    City varchar(30),
    Salary decimal(15,2)
    
    );
    
 
    
    DESCRIBE  Employee;
    
-- Q4: Insert 10 sample rows into the Employee table using INSERT INTO.


SELECT * FROM Employee;

-- Q5: Write a query to select all columns and all rows from Employee using SELECT *.

SELECT * FROM employee;

-- Q6: Select only the Name and Salary columns from Employee.

SELECT NAME ,Salary FROM Employee;


-- Q7: Select all unique Department values from Employee using SELECT DISTINCT.

SELECT  DISTINCT Department
FROM Employee;


-- Q8: Select all unique combinations of Department and City together.

SELECT  DISTINCT Department,City
FROM Employee;

-- Q9: Select all unique City values where employees are based.

SELECT DISTINCT City
FROM Employee;

-- Q10: Count how many distinct departments exist using COUNT(DISTINCT Department).

SELECT COUNT(DISTINCT Department) AS Total_Departments
FROM Employee;

-- Q11: Select Name and Department, aliasing them as EmployeeName and Team using AS.

SELECT Name AS EmployeeName,
	Department AS Team
    FROM Employee;
    
-- Q12: Use DESCRIBE Employee to view the table's column structure.

DESCRIBE Employee;

-- Q13: Select all columns from Employee but show only the first 5 rows using LIMIT.

SELECT * 
FROM Employee 
LIMIT 5;

-- Q14: Create a Department table with DeptID and DeptName columns.

CREATE TABLE Department1(
	DeptID int,
    DeptName varchar(20)
);
    
SHOW Tables;

-- Q15: Select DISTINCT Salary values from Employee to check for repeated pay values

SELECT DISTINCT Salary
FROM Employee;


-- Q16: Add a calculated column to your SELECT: Salary * 12 AS AnnualSalary.

SELECT Emp_ID,
	Name,
	Salary,
	Salary * 12 AS Annual_Salary
	FROM Employee;
    
-- Q17: Add a new column Age to the Employee table using ALTER TABLE.

ALTER TABLE Employee
ADD Age int;

SELECT * FROM Employee;

-- Q18: Update every row to set a default Age value using UPDATE ... SET.

UPDATE Employee
SET Age = 25;

-- Q19: Select DISTINCT City values and manually note how many employees are in each.

SELECT DISTINCT City
FROM Employee;

-- Q20: Write one query combining SELECT and DISTINCT to list every unique Department, in the order MySQL returns them. 

SELECT DISTINCT Department 
FROM Employee;



