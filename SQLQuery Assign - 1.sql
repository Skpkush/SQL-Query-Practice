
--Step 1) Create Table
CREATE TABLE EmployeeSales (
    SaleID INT PRIMARY KEY,
    EmployeeID INT,
    Department VARCHAR(50),
    SaleAmount DECIMAL(10, 2),
    SaleDate DATE
);

--Step 2) Insert records into the table
INSERT INTO EmployeeSales (SaleID, EmployeeID, Department, SaleAmount, SaleDate)
VALUES 
(1, 101, 'Electronics', 500.00, '2023-08-01'),
(2, 102, 'Electronics', 300.00, '2023-08-03'),
(3, 101, 'Furniture', 150.00, '2023-08-02'),
(4, 103, 'Electronics', 250.00, '2023-08-04'),
(5, 104, 'Furniture', 200.00, '2023-08-02'),
(6, 101, 'Furniture', 450.00, '2023-08-05'),
(7, 102, 'Electronics', 700.00, '2023-08-05'),
(8, 103, 'Furniture', 100.00, '2023-08-06');


--***********************************************************************************
--Column Definitions

SaleID (INT PRIMARY KEY): Unique identifier for each sale.
EmployeeID (INT): Identifier for the employee who made the sale.
Department (VARCHAR(50)): Name of the department where the sale was made.
SaleAmount (DECIMAL(10, 2)): Total amount of the sale.
SaleDate (DATE): Date when the sale occurred.
--***********************************************************************************

Select * from EmployeeSales



-- 1) Write a query to calculate the total sales amount for each department in the EmployeeSales table.
Select Department, Sum(SaleAmount) as [Totalsales] from EmployeeSales 
group by Department

-- 2) Write a query to count the number of sales made by each employee.
select EmployeeID, count(EmployeeID) as [CountSales] from EmployeeSales
group by EmployeeID

-- 3) Write a query to calculate the average sale amount for each department.
select Department, AVG(SaleAmount) as [AVGSales] from EmployeeSales
group by Department


-- 4) Write a query to find the total sales amount for each employee, but only include employees who have made more than one sale.
select EmployeeID, Sum(SaleAmount) as [TotalSales] from EmployeeSales 
group by EmployeeID
having COUNT(EmployeeID) > 1

--5) Write a query to find the total sales for each month in 2023.
SELECT FORMAT(SaleDate, 'yyyy-MM') AS SaleMonth, SUM(SaleAmount) AS TotalSales
FROM EmployeeSales
WHERE YEAR(SaleDate) = 2023
GROUP BY FORMAT(SaleDate, 'yyyy-MM');

or 
SELECT MONTH(SaleDate) AS Month, SUM(SaleAmount) AS TotalSales
FROM EmployeeSales
WHERE YEAR(SaleDate) = 2023
GROUP BY MONTH(SaleDate);
