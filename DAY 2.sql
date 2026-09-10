CREATE DATABASE DAY_2;
USE DAY_2;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    City VARCHAR(30),
    Country VARCHAR(30),
    Email VARCHAR(100)
);

INSERT INTO Customers (CustomerID, Name, Age, City, Country, Email)
VALUES
(1, 'Amit', 28, 'Mumbai', 'India', 'amit@gmail.com'),
(2, 'Anita', 35, 'Pune', 'India', 'anita@yahoo.com'),
(3, 'Rahul', 22, 'Delhi', 'India', 'rahul@gmail.com'),
(4, 'Sneha', 40, 'Mumbai', 'India', 'sneha@hotmail.com'),
(5, 'Akash', 19, 'Chennai', 'India', 'akash@gmail.com'),
(6, 'Priya', 31, 'Pune', 'India', 'priya@yahoo.com'),
(7, 'Suresh', 45, 'Delhi', 'India', 'suresh@gmail.com'),
(8, 'Rohan', 26, 'Mumbai', 'India', 'rohan@gmail.com'),
(9, 'Neha', 50, 'Bangalore', 'India', 'neha@yahoo.com'),
(10, 'Arjun', 24, 'Pune', 'India', 'arjun@gmail.com'),
(11, 'Karan', 38, 'Delhi', 'India', 'karan@gmail.com'),
(12, 'Asha', NULL, 'Mumbai', 'India', 'asha@gmail.com'),
(13, 'Meera', 29, 'Hyderabad', 'India', 'meera@yahoo.com'),
(14, 'Sachin', 60, 'Mumbai', 'India', 'sachin@gmail.com'),
(15, 'Rita', NULL, 'Pune', 'India', 'rita@hotmail.com'),
(16, 'Ajay', 21, 'Delhi', 'India', 'ajay@gmail.com'),
(17, 'Smith', 27, 'London', 'UK', 'smith@gmail.com'),
(18, 'John', 33, 'New York', 'USA', 'john@yahoo.com'),
(19, 'Sarah', 41, 'Sydney', 'Australia', 'sarah@gmail.com'),
(20, 'Zoya', 23, 'Mumbai', 'India', 'zoya@yahoo.com');

-- Q1: Select all customers who live in 'Mumbai' using WHERE. 

SELECT * 
FROM Customers
WHERE City = "Mumbai";

-- Q2: Select all customers whose Age is greater than 30.

SELECT *
FROM Customers
WHERE Age > 30;

-- Q3: Select all customers who are NOT from 'Delhi' using NOT

SELECT * 
FROM Customers
where City != "Delhi";

-- Q4: Select customers from 'Mumbai' AND with Age greater than 25.

SELECT *
FROM Customers
WHERE City = "Mumbai" AND Age >25;

-- Q5: Select customers from 'Mumbai' OR 'Pune'.

SELECT *
FROM Customers
WHERE City = "Mumbai" OR City ="Pune";

-- Q6: Select customers whose Name starts with 'A' using LIKE 'A%'.

SELECT * 
FROM Customers
Where Name LIKE "A%";

 -- Q7: Select customers whose Name ends with 'a' using LIKE '%a'.
 
SELECT * 
FROM Customers
Where Name LIKE "%a";

-- Q8: Select customers whose Name contains 'an' anywhere using LIKE '%an%'.

SELECT * 
FROM Customers
Where Name LIKE "%an%";

-- Q9: Select customers whose Email ends with '@gmail.com'.

SELECT * 
FROM Customers
WHERE Email LIKE "%@gmail.com";

-- Q10: Select customers with Age between 20 and 40 using AND (without BETWEEN).

SELECT *
FROM Customers
WHERE Age > 20 and Age <= 40;

-- Q11: Select customers who are NOT from 'India'.

SELECT * 
FROM Customers 
WHERE Country != "India";

-- Q12: Select customers from 'Mumbai' AND NOT older than 50.

SELECT *
FROM Customers
WHERE City = "Mumbai" AND Age <= 50;

-- Q13: Select customers whose City is 'Mumbai', 'Pune', or 'Delhi' using multiple OR conditions.

SELECT *
FROM Customers
WHERE City = "Mumbai" OR City = "Delhi" OR City = "Pune";

-- Q14: Select customers whose Name is exactly 5 characters long using LIKE '_____'.

SELECT * 
FROM Customers 
WHERE Name LIKE "_____";

-- Q15: Select customers where Age IS NULL.

SELECT * 
FROM Customers 
WHERE Age IS NULL;

-- Q16: Select customers where Age IS NOT NULL.

SELECT * 
FROM Customers 
WHERE Age IS NOT NULL;

-- Q17: Select customers from 'Mumbai' with Age > 25, OR from 'Pune' with Age > 30.

SELECT *
FROM Customers
WHERE (City = "Mumbai" AND Age > 25) 
	OR (City = "Pune" AND Age > 30);
	

-- Q18: Select customers whose second letter of the name is 'a' using LIKE '_a%'.

SELECT * 
FROM Customers
WHERE NAME LIKE "_a%";

-- Q19: Select customers who do NOT live in 'Mumbai' or 'Pune'.

SELECT *
FROM Customers
WHERE City != "Mumbai" AND City != "PUNE";

-- Q20: Select customers where Country is 'India' AND City is NOT 'Delhi'.

SELECT *
FROM Customers
WHERE Country= "INDIA" AND City != "DELHI";

-- Q21: Select customers whose Email does not contain 'yahoo'.

SELECT *
FROM Customers
WHERE Email NOT LIKE "%YAHOO%";

-- Q22: Select customers where Age is greater than 18, less than 60, AND City is 'Mumbai'.

SELECT *
FROM Customers
WHERE AGE > 18 AND AGE < 60 AND City = "MUMBAI";

-- Q23: Select customers whose name starts with 'S' and ends with 'h'.

SELECT *
FROM Customers
WHERE NAME LIKE "S%" AND NAME LIKE "%h";

-- Q24: Select all customers except those whose Age is exactly 25.

SELECT *
FROM Customers
WHERE AGE != 25;

-- Q25: Combine WHERE, AND, OR, NOT, and LIKE in one query: customers from 'Mumbai' or 'Pune', aged above 21, whose name does not start with 'Z'.

SELECT *
FROM CUSTOMERS 
WHERE (CITY = "MUMBAI" OR CITY = "PUNE")
AND AGE > 21
AND NAME NOT LIKE "Z%";




