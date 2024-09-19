-- Creating the Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100) UNIQUE,
    DepartmentID INT,
    HireDate DATE,
    Salary DECIMAL(10, 2)
);

-- Creating the Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(100)
);


-- Inserting data into the Employees table
INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, DepartmentID, HireDate, Salary)
VALUES 
(1, 'John', 'Smith', 'john.smith@example.com', 101, '2021-06-15', 75000.00),
(2, 'Jane', 'Doe', 'jane.doe@example.com', 102, '2020-03-10', 85000.00),
(3, 'Michael', 'Johnson', 'michael.johnson@example.com', 101, '2019-11-22', 95000.00),
(4, 'Emily', 'Davis', 'emily.davis@example.com', 103, '2022-01-05', 68000.00),
(5, 'William', 'Brown', 'william.brown@example.com', 102, '2018-07-19', 80000.00);

-- Inserting data into the Departments table
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
(101, 'Human Resources'),
(102, 'Finance'),
(103, 'IT');
-- Creating the Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100) UNIQUE,
    DepartmentID INT,
    HireDate DATE,
    Salary DECIMAL(10, 2)
);

-- Creating the Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(100)
);


-- Inserting data into the Employees table
INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, DepartmentID, HireDate, Salary)
VALUES 
(1, 'John', 'Smith', 'john.smith@example.com', 101, '2021-06-15', 75000.00),
(2, 'Jane', 'Doe', 'jane.doe@example.com', 102, '2020-03-10', 85000.00),
(3, 'Michael', 'Johnson', 'michael.johnson@example.com', 101, '2019-11-22', 95000.00),
(4, 'Emily', 'Davis', 'emily.davis@example.com', 103, '2022-01-05', 68000.00),
(5, 'William', 'Brown', 'william.brown@example.com', 102, '2018-07-19', 80000.00);

-- Inserting data into the Departments table
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
(101, 'Human Resources'),
(102, 'Finance'),
(103, 'IT');

--Write a SQL query to list the names of employees along with the names of the departments they work in.
SELECT E.FirstName, E.LastName, D.DepartmentName
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID;

--Write a SQL query to list all the departments and the employees working in them, including departments with no employees.
SELECT D.DepartmentName, E.FirstName, E.LastName
FROM Departments D
LEFT JOIN Employees E ON D.DepartmentID = E.DepartmentID;

--Write a SQL query to find the names of employees who do not belong to any department (i.e., no matching department ID).
SELECT FirstName, LastName
FROM Employees
WHERE DepartmentID NOT IN (SELECT DepartmentID FROM Departments);

--Write a SQL query to list the names of employees who work in the same department as 'Jane Doe'.
SELECT FirstName, LastName
FROM Employees
WHERE DepartmentID NOT IN (SELECT DepartmentID FROM Departments);

or
SELECT E2.FirstName, E2.LastName
FROM Employees E1
JOIN Employees E2
ON E1.DepartmentID = E2.DepartmentID
WHERE E1.FirstName = 'Jane' AND E1.LastName = 'Doe'
AND E2.EmployeeID <> E1.EmployeeID;

--Write a SQL query to find the department with the highest total salary paid to its employees.

SELECT TOP 1 D.DepartmentName, SUM(E.Salary) AS TotalSalary
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName
ORDER BY TotalSalary DESC;

or 
SELECT TOP 1 D.DepartmentName
FROM Departments D
JOIN Employees E
ON D.DepartmentID = E.DepartmentID
GROUP BY D.DepartmentName
ORDER BY SUM(E.Salary) DESC;

--Write a SQL query to select all columns and rows from the Employees table.
SELECT * 
FROM Employees;

--Write a SQL query to find the names and email addresses of all employees who work in the department with DepartmentID = 101.
SELECT FirstName, LastName, Email
FROM Employees
WHERE DepartmentID = 101;

--Write a SQL query to find the total number of employees in the Employees table.
SELECT COUNT(*) AS TotalEmployees
FROM Employees;

--Write a SQL query to find the details of employees who were hired in the year 2020.
SELECT *
FROM Employees
WHERE YEAR(HireDate) = 2020;

--Write a SQL query to update the salary of 'Jane Doe' to 90,000.
UPDATE Employees
SET Salary = 90000
WHERE FirstName = 'Jane' AND LastName = 'Doe';
