CREATE DATABASE DAY_10;
USE DAY_10;


CREATE TABLE MonthlySales (
    SaleMonth DATE,
    Sales DECIMAL(12,2)
);

INSERT INTO MonthlySales (SaleMonth, Sales) VALUES
('2026-01-01', 10000),
('2026-02-01', 12000),
('2026-03-01', 11500),
('2026-04-01', 14000),
('2026-05-01', 15000),
('2026-06-01', 13500),
('2026-07-01', 16000),
('2026-08-01', 17500);

CREATE TABLE ProductSales (
    ProductID INT,
    ProductName VARCHAR(50),
    SaleMonth DATE,
    Sales DECIMAL(12,2)
);

INSERT INTO ProductSales
(ProductID, ProductName, SaleMonth, Sales)
VALUES
(1, 'Laptop', '2026-01-01', 50000),
(1, 'Laptop', '2026-02-01', 55000),
(1, 'Laptop', '2026-03-01', 52000),
(1, 'Laptop', '2026-04-01', 60000),

(2, 'Mobile', '2026-01-01', 30000),
(2, 'Mobile', '2026-02-01', 35000),
(2, 'Mobile', '2026-03-01', 33000),
(2, 'Mobile', '2026-04-01', 40000),

(3, 'Tablet', '2026-01-01', 20000),
(3, 'Tablet', '2026-02-01', 22000),
(3, 'Tablet', '2026-03-01', 25000),
(3, 'Tablet', '2026-04-01', 24000);

CREATE TABLE CustomerOrders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    CustomerName VARCHAR(50),
    OrderDate DATE,
    OrderAmount DECIMAL(10,2)
);

INSERT INTO CustomerOrders
(OrderID, CustomerID, CustomerName, OrderDate, OrderAmount)
VALUES
(101, 1, 'Amit',   '2026-01-05', 2500),
(102, 1, 'Amit',   '2026-02-15', 3000),
(103, 1, 'Amit',   '2026-04-10', 2000),

(104, 2, 'Rahul',  '2026-01-10', 1500),
(105, 2, 'Rahul',  '2026-03-20', 2200),

(106, 3, 'Priya',  '2026-02-05', 3500),

(107, 4, 'Sneha',  '2026-01-15', 1800),
(108, 4, 'Sneha',  '2026-02-25', 2700),
(109, 4, 'Sneha',  '2026-05-05', 3200);

CREATE TABLE SalaryHistory (
    EmployeeID INT,
    EmployeeName VARCHAR(50),
    SalaryDate DATE,
    Salary DECIMAL(10,2)
);

INSERT INTO SalaryHistory
(EmployeeID, EmployeeName, SalaryDate, Salary)
VALUES
(101, 'Amit',  '2024-01-01', 40000),
(101, 'Amit',  '2025-01-01', 45000),
(101, 'Amit',  '2026-01-01', 50000),

(102, 'Rahul', '2024-01-01', 35000),
(102, 'Rahul', '2025-01-01', 40000),
(102, 'Rahul', '2026-01-01', 46000),

(103, 'Priya', '2024-01-01', 45000),
(103, 'Priya', '2025-01-01', 48000),
(103, 'Priya', '2026-01-01', 55000);



CREATE TABLE DailyStock (
    StockDate DATE,
    StockLevel INT
);

INSERT INTO DailyStock
(StockDate, StockLevel)
VALUES
('2026-08-01', 1000),
('2026-08-02', 950),
('2026-08-03', 1100),
('2026-08-04', 900),
('2026-08-05', 850),
('2026-08-06', 1200);

CREATE TABLE RegionalSales (
    Region VARCHAR(50),
    SaleMonth DATE,
    Sales DECIMAL(12,2)
);

INSERT INTO RegionalSales
(Region, SaleMonth, Sales)
VALUES
('West', '2026-01-01', 50000),
('West', '2026-02-01', 55000),
('West', '2026-03-01', 52000),
('West', '2026-04-01', 60000),

('East', '2026-01-01', 40000),
('East', '2026-02-01', 45000),
('East', '2026-03-01', 48000),
('East', '2026-04-01', 46000),

('North', '2026-01-01', 30000),
('North', '2026-02-01', 32000),
('North', '2026-03-01', 35000),
('North', '2026-04-01', 38000);





-- Q1: Use LAG() to show each month's sales alongside the previous month's sales.

SELECT 
SaleMonth,
Sales AS Current_sales,
LAG(Sales) OVER(
				ORDER BY SaleMonth
                )AS Previous_sale
FROM MonthlySales;
 
-- Q2: Use LEAD() to show each month's sales alongside the next month's sales.

SELECT
    SaleMonth,
    Sales AS Current_Month_Sales,

    LAG(Sales) OVER (
        ORDER BY SaleMonth
    ) AS Previous_Month_Sales,

    ROUND(
        (
            Sales - LAG(Sales) OVER (
                ORDER BY SaleMonth
            )
        )
        /
        LAG(Sales) OVER (
            ORDER BY SaleMonth
        ) * 100,
        2
    ) AS MoM_Growth_Percent

FROM MonthlySales;


-- Q4: Use LAG() with PARTITION BY to compare each product's sales to its own previous month.

SELECT
    ProductID,
    ProductName,
    SaleMonth,
    Sales AS Current_Sales,

    LAG(Sales) OVER (
        PARTITION BY ProductID
        ORDER BY SaleMonth
    ) AS Previous_Month_Sales

FROM ProductSales
ORDER BY ProductID, SaleMonth;

-- Q5: Use LEAD() to find the next order date placed by each customer.

SELECT 
CustomerID,
CustomerName,
OrderId,
Orderdate,
LEAD(Orderdate) OVER(
				PARTITION BY CustomerID
                ORDER BY Orderdate
                ) AS Next_Order
                
FROM CustomerOrders
ORDER BY Orderdate,CustomerID;

-- Q6: Use LAG() to find an employee's previous salary from a salary history table.

SELECT
    EmployeeID,
    EmployeeName,
    SalaryDate,
    Salary AS Current_Salary,

    LAG(Salary) OVER (
        PARTITION BY EmployeeID
        ORDER BY SalaryDate
    ) AS Previous_Salary

FROM SalaryHistory
ORDER BY EmployeeID, SalaryDate;

-- Q7: Calculate the difference between the current and previous day's stock levels using LAG().

SELECT
    StockDate,
    StockLevel AS Current_Stock,

    LAG(StockLevel) OVER (
        ORDER BY StockDate
    ) AS Previous_Stock,

    StockLevel -
    LAG(StockLevel) OVER (
        ORDER BY StockDate
    ) AS Stock_Difference

FROM DailyStock
ORDER BY StockDate;

-- Q8: Use LAG() with a default value to handle the first row, which has no previous value.
SELECT
    SaleMonth,
    Sales,

    LAG(
        Sales,
        1,
        0
    ) OVER (
        ORDER BY SaleMonth
    ) AS Previous_Month_Sales

FROM MonthlySales
ORDER BY SaleMonth;

-- Q9: Use LEAD() to spot customers who placed no further orders after a given order (a churn signal).
SELECT
    CustomerID,
    CustomerName,
    OrderID,
    OrderDate,

    LEAD(OrderDate) OVER (
        PARTITION BY CustomerID
        ORDER BY OrderDate
    ) AS Next_Order_Date,

    CASE
        WHEN LEAD(OrderDate) OVER (
            PARTITION BY CustomerID
            ORDER BY OrderDate
        ) IS NULL
        THEN 'Potential Churn'
        ELSE 'Has Future Order'
    END AS Customer_Status

FROM CustomerOrders
ORDER BY CustomerID, OrderDate;

-- Q10: Combine LAG() and LEAD() in one query to show previous, current, and next month's sales together.

SELECT
    SaleMonth,

    LAG(Sales) OVER (
        ORDER BY SaleMonth
    ) AS Previous_Month_Sales,

    Sales AS Current_Month_Sales,

    LEAD(Sales) OVER (
        ORDER BY SaleMonth
    ) AS Next_Month_Sales

FROM MonthlySales
ORDER BY SaleMonth;

-- Q11: Use LAG() to flag any month where sales dropped compared to the previous month.

SELECT
    SaleMonth,
    Sales AS Current_Sales,

    LAG(Sales) OVER (
        ORDER BY SaleMonth
    ) AS Previous_Sales,

    CASE
        WHEN Sales < LAG(Sales) OVER (
            ORDER BY SaleMonth
        )
        THEN 'Sales Dropped'
        ELSE 'No Drop'
    END AS Sales_Status

FROM MonthlySales
ORDER BY SaleMonth;

-- Q12: Use LAG() with PARTITION BY Region to compare each region's month-over-month performance.

SELECT
    Region,
    SaleMonth,
    Sales AS Current_Sales,

    LAG(Sales) OVER (
        PARTITION BY Region
        ORDER BY SaleMonth
    ) AS Previous_Month_Sales,

    Sales -
    LAG(Sales) OVER (
        PARTITION BY Region
        ORDER BY SaleMonth
    ) AS Sales_Difference

FROM RegionalSales
ORDER BY Region, SaleMonth;

-- Q13: Use LEAD() to calculate the number of days until each customer's next order.

SELECT
    CustomerID,
    CustomerName,
    OrderID,
    OrderDate,

    LEAD(OrderDate) OVER (
        PARTITION BY CustomerID
        ORDER BY OrderDate
    ) AS Next_Order_Date,

    DATEDIFF(
        LEAD(OrderDate) OVER (
            PARTITION BY CustomerID
            ORDER BY OrderDate
        ),
        OrderDate
    ) AS Days_Until_Next_Order

FROM CustomerOrders
ORDER BY CustomerID, OrderDate;

-- Q14: Use LAG() to build a 3-month moving comparison: current month vs previous vs two months ago.

SELECT
    SaleMonth,

    Sales AS Current_Month_Sales,

    LAG(Sales, 1) OVER (
        ORDER BY SaleMonth
    ) AS Previous_Month_Sales,

    LAG(Sales, 2) OVER (
        ORDER BY SaleMonth
    ) AS Two_Months_Ago_Sales

FROM MonthlySales
ORDER BY SaleMonth;

-- Q15: Build a previous month sales comparison report using LAG() - today's main task

SELECT
    SaleMonth,

    Sales AS Current_Month_Sales,

    LAG(Sales) OVER (
        ORDER BY SaleMonth
    ) AS Previous_Month_Sales,

    Sales -
    LAG(Sales) OVER (
        ORDER BY SaleMonth
    ) AS Sales_Difference,

    ROUND(
        (
            Sales -
            LAG(Sales) OVER (
                ORDER BY SaleMonth
            )
        )
        /
        NULLIF(
            LAG(Sales) OVER (
                ORDER BY SaleMonth
            ),
            0
        ) * 100,
        2
    ) AS Growth_Percentage,

    CASE
        WHEN LAG(Sales) OVER (
            ORDER BY SaleMonth
        ) IS NULL
        THEN 'First Month'

        WHEN Sales >
             LAG(Sales) OVER (
                 ORDER BY SaleMonth
             )
        THEN 'Sales Increased'

        WHEN Sales <
             LAG(Sales) OVER (
                 ORDER BY SaleMonth
             )
        THEN 'Sales Decreased'

        ELSE 'No Change'
    END AS Sales_Status

FROM MonthlySales
ORDER BY SaleMonth;