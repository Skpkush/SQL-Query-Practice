

create database [SQL Questions]

use [SQL Questions]

-- Create the Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Country VARCHAR(50)
);

-- Insert data into Customers table
INSERT INTO Customers (CustomerID, CustomerName, Country)
VALUES 
(1, 'Alice', 'USA'),
(2, 'Bob', 'UK'),
(3, 'Charlie', 'Canada'),
(4, 'David', 'USA'),
(5, 'Eve', 'Australia');

-- Create the Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    ProductID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert data into Orders table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, ProductID)
VALUES 
(101, 1, '2024-08-01', 1001),
(102, 1, '2024-08-03', 1002),
(103, 2, '2024-08-04', 1001),
(104, 3, '2024-08-05', 1003),
(105, 5, '2024-08-06', 1004);

-- Create the Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10, 2)
);

-- Insert data into Products table
INSERT INTO Products (ProductID, ProductName, Price)
VALUES 
(1001, 'Laptop', 1000),
(1002, 'Smartphone', 700),
(1003, 'Tablet', 500),
(1004, 'Headphones', 200),
(1005, 'Smartwatch', 300);





select * from Customers

select * from Orders

select * from Products


--1) Write an SQL query to find the names of customers who have placed an order.
select distinct CustomerName from customers c inner join Orders o on o.CustomerID = c.CustomerID

--2) Find the list of customers who have not placed any orders.
select distinct CustomerName from Customers c left join Orders o on O.CustomerID = C.CustomerID where o.OrderID is null

--3) List all orders along with the product name and price.
select distinct ProductName,Price from Orders o join Products p on o.ProductID = p.ProductID  


--4) Find the names of customers and their orders, including customers who haven't placed any orders.
select distinct CustomerName,OrderID from Customers c left join Orders o on o.CustomerID = c.CustomerID

--5) Retrieve a list of products that have never been ordered.
select distinct p.ProductID,ProductName from Products p left join Orders o on p.ProductID = o.ProductID where o.OrderDate is null

--6) Find the total number of orders placed by each customer.
select customername,count(orderid) [Number of Orders] from Customers c inner join Orders o on c.CustomerID = o.CustomerID
group by customername

--OR 
select customername,count(orderid) [Number of Orders] from Customers c LEFT join Orders o on c.CustomerID = o.CustomerID
group by customername

--7) Display the customers, the products they've ordered, and the order date. Include customers who haven't placed any orders.
select distinct CustomerName,p.ProductID,ProductName,OrderDate
from Customers c left join Orders o on c.CustomerID = o.CustomerID left join Products p on o.ProductID = p.ProductID


--8) Identify pairs of customers who live in the same county 
select x.CustomerName, y.CustomerName
from Customers x join Customers y on x.Country = y.Country and x.CustomerID <> y.CustomerID and x.CustomerID>y.CustomerID



--9) Find the  cutomer who has spent the most on their orders
select CustomerName from 
(Select CustomerName, SUM(price) [amount spent], DENSE_RANK() over(order by sum(price) desc) [DR]
from Customers c inner join 
Orders o on c.CustomerID = o.CustomerID inner join Products p on o.ProductID = p.ProductID
group by CustomerName) m where DR = 1

--10) find customer who have ordered more than one type of products
Select CustomerName from Customers c join Orders o on c.CustomerID = o.CustomerID
group by CustomerName
having COUNT(productid) > 1 

--11) list all products and their corresponding orders, using a Right join , including products that have never been ordered.
select orderid, p.ProductID,ProductName from Orders o right join Products p on o.ProductID = p.ProductID


-- 12) Retrieve all the orders placed by customer from the usa 
Select OrderID from Customers c inner join orders o on c.customerid = o.customerid where country in ('USA')


--13) Find the name of customers who have ordered a product priced above $ 500.
select distinct CustomerName 
from Customers c inner join Orders o on o.CustomerID = c.CustomerID inner join products p on p.ProductID = o.ProductID
where price > 500

-- 14) find customer who have ordered the same product more than once.
select distinct m.CustomerName from
(select CustomerName, ProductID, COUNT(orderid) [count] from customers c inner join orders o on c.CustomerID = o.CustomerID
group by CustomerName, ProductID
having COUNT(OrderID)>1) m
