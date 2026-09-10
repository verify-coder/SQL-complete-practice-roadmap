CREATE DATABASE DAY_3;

USE DAY_3;


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


-- Q1: Select all products ordered by Price in ascending order.

SELECT *
FROM Products
ORDER BY Price ASC;

-- Q2: Select all products ordered by Price in descending order.

SELECT *
FROM Products
ORDER BY Price DESC;

-- Q3: Select the top 10 most expensive products using ORDER BY and LIMIT.

 SELECT *
FROM Products
ORDER BY Price DESC
LIMIT 10 ;

-- Q4: Select the 5 cheapest products.

SELECT *
FROM Products
ORDER BY Price ASC
LIMIT 5 ;

-- Q5: Select products ordered by Category, then by Price within each category.

SELECT *
FROM Products
ORDER BY Category ,Price ASC;

-- Q6: Select products with Price between 500 and 2000 using BETWEEN.

SELECT *
FROM Products
WHERE Price BETWEEN 500 AND 2000;

-- Q7: Select products whose Category is in ('Electronics', 'Furniture', 'Clothing') using IN.
SELECT *
FROM PRODUCTS
WHERE CATEGORY IN ('Electronics', 'Furniture', 'Clothing');

-- Q8: Select products that are NOT IN the 'Clothing' category.

SELECT *
FROM Products
WHERE Category NOT IN ("Clothing");

-- Q9: Select products with Stock between 10 and 50.

SELECT *
FROM Products
WHERE Stock BETWEEN 10 AND 50;

-- Q10: Select the 3 products with the lowest stock.

SELECT *
FROM Products
ORDER BY Stock ASC
LIMIT 3;

-- Q11: Select products ordered alphabetically by ProductName.

SELECT *
FROM Products
ORDER BY ProductName ASC;

-- Q12: Select 10 products while skipping the first 5, using LIMIT with OFFSET.

SELECT *
FROM Products
LIMIT 10 OFFSET 5;

-- Q13: Select products priced between 1000 and 5000, in Category IN ('Electronics', 'Mobiles').

SELECT *
FROM Products
WHERE Price BETWEEN 1000 AND 5000
AND Category IN ('Electronics','Mobiles') ;

-- Q14: Select products with Price NOT BETWEEN 100 and 500.

 SELECT *
FROM Products
WHERE Price  NOT BETWEEN 100 AND 500;

-- Q15: Select the 2nd highest-priced product using ORDER BY with LIMIT and OFFSET.

SELECT *
FROM Products 
ORDER BY Price DESC
LIMIT 1 OFFSET 2;

-- Q16: Select all products ordered by Stock descending, then Price ascending as a tiebreaker.

SELECT *
FROM PRODUCTS
ORDER BY STOCK DESC, PRICE ASC;

-- Q17: Select products whose ProductID is IN a specific list of 5 IDs you choose.

SELECT *
FROM Products 
WHERE ProductID IN (101,104,114,122,112);

-- Q18: Select the 10 most recently added products using ORDER BY DateAdded DESC LIMIT 10.
SELECT *
FROM PRODUCTS
ORDER BY DATEADDED DESC
LIMIT 10;

-- Q19: Select the top 10 products from Category IN ('Electronics', 'Mobiles') ordered by Price DESC 

SELECT *
FROM Products
WHERE Category IN ('Electronics', 'Mobiles')
ORDER BY Price DESC
LIMIT 10;

-- Q20: Select the bottom 5 products by Stock for a restocking report.
SELECT *
FROM Products
ORDER BY Stock ASC
LIMIT 5;







