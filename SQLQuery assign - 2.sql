CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100) UNIQUE,
    DepartmentID INT,
    HireDate DATE,
    Salary DECIMAL(10, 2)
);


INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, DepartmentID, HireDate, Salary)
VALUES 
(1, 'John', 'Smith', 'john.smith@example.com', 101, '2021-06-15', 75000.00),
(2, 'Jane', 'Doe', 'jane.doe@example.com', 102, '2020-03-10', 85000.00),
(3, 'Michael', 'Johnson', 'michael.johnson@example.com', 101, '2019-11-22', 95000.00),
(4, 'Emily', 'Davis', 'emily.davis@example.com', 103, '2022-01-05', 68000.00),
(5, 'William', 'Brown', 'william.brown@example.com', 102, '2018-07-19', 80000.00);


select * from Employees

--1) Write a SQL query to find the names of employees who have a salary higher than the average salary of all employees.
select FirstName, LastName from Employees where Salary > (select AVG(salary) as AvgSalary from Employees)


SELECT FirstName, LastName 
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);


--2) Write a SQL query to list the employee names and their departments for employees who were hired after the oldest employee in the company.
select FirstName, LastName, DepartmentID, HireDate from Employees where HireDate > (SELECT MIN(HireDate)  FROM Employees);

--3) Write a SQL query to find the details of the employee(s) with the highest salary.
select * from Employees where Salary = (SELECT max(Salary) FROM Employees);

--4) Write a SQL query to find the names of employees who work in the same department as 'John Smith'.
SELECT FirstName, LastName, DepartmentID FROM Employees WHERE FirstName = 'John' AND LastName = 'Smith'
or 
SELECT FirstName, LastName
FROM Employees
WHERE DepartmentID = (SELECT DepartmentID FROM Employees WHERE FirstName = 'John' AND LastName = 'Smith');

--5) Write a SQL query to find the names of employees who do not belong to the department with the highest average salary.

SELECT FirstName, LastName FROM Employees
WHERE DepartmentID != (SELECT TOP 1 DepartmentID FROM Employees GROUP BY DepartmentID ORDER BY AVG(Salary) DESC);

--6) Write a SQL query to find the names of employees whose first names start with the letter 'J'.
SELECT FirstName FROM Employees where FirstName Like 'J%'

--7) Write a SQL query to find the names of employees whose last names end with the letter 'n'.
SELECT FirstName, LastName FROM Employees where LastName Like '%n'

--8) Write a SQL query to find the email addresses of employees that contain the word "john".

SELECT FirstName, LastName, Email FROM Employees where Email like '%john%'


--9) Write a SQL query to find the names of employees whose first names have exactly 5 characters.
SELECT FirstName, LastName FROM Employees WHERE LEN(FirstName) = 5;


--10) Write a SQL query to find the names of employees whose last names contain the letter 'a' as the second character.
SELECT FirstName, LastName FROM Employees WHERE LastName LIKE '_a%';



