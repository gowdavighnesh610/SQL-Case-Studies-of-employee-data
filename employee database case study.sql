CREATE DATABASE EmployeeProject;

USE EmployeeProject;

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Age INT,
    Gender VARCHAR(10),
    Salary DECIMAL(10,2),
    DeptID INT
);
INSERT INTO Employees VALUES
(1, 'Rahul', 25, 'Male', 30000, 101),
(2, 'Priya', 28, 'Female', 35000, 102),
(3, 'Amit', 30, 'Male', 40000, 103),
(4, 'Sneha', 26, 'Female', 32000, 101),
(5, 'Kiran', 29, 'Male', 45000, 104),
(6, 'Pooja', 24, 'Female', 28000, 102),
(7, 'Arjun', 32, 'Male', 50000, 103),
(8, 'Divya', 27, 'Female', 38000, 104),
(9, 'Vikas', 31, 'Male', 42000, 105),
(10, 'Anjali', 23, 'Female', 27000, 101),
(11, 'Rohit', 29, 'Male', 36000, 102),
(12, 'Kavya', 26, 'Female', 33000, 103),
(13, 'Manoj', 35, 'Male', 55000, 104),
(14, 'Neha', 28, 'Female', 39000, 105),
(15, 'Suresh', 33, 'Male', 48000, 101),
(16, 'Meena', 25, 'Female', 31000, 102),
(17, 'Ajay', 30, 'Male', 44000, 103),
(18, 'Rashmi', 27, 'Female', 37000, 104),
(19, 'Naveen', 34, 'Male', 52000, 105),
(20, 'Swathi', 24, 'Female', 29000, 103);

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50),
    Location VARCHAR(50)
);

INSERT INTO Departments VALUES
(101, 'HR', 'Bangalore'),
(102, 'Finance', 'Mysore'),
(103, 'IT', 'Mangalore'),
(104, 'Marketing', 'Hubli'),
(105, 'Sales', 'Bangalore');

SELECT * FROM Employees;

SELECT EmpName, Salary
FROM Employees;

SELECT *
FROM Employees
WHERE Salary > 40000;

SELECT *
FROM Employees
WHERE Gender = 'Female';

SELECT EmpName, Salary
FROM Employees
ORDER BY Salary DESC;

SELECT E.EmpName, D.DeptName
FROM Employees E
INNER JOIN Departments D
ON E.DeptID = D.DeptID;

SELECT E.EmpName, E.Salary, D.Location
FROM Employees E
INNER JOIN Departments D
ON E.DeptID = D.DeptID;

SELECT E.EmpName, E.Salary
FROM Employees E
INNER JOIN Departments D
ON E.DeptID = D.DeptID
WHERE D.DeptName = 'IT';

SELECT E.EmpName, D.DeptName, D.Location
FROM Employees E
INNER JOIN Departments D
ON E.DeptID = D.DeptID
WHERE D.Location = 'Bangalore';

SELECT E.EmpName, D.DeptName
FROM Employees E
LEFT JOIN Departments D
ON E.DeptID = D.DeptID;

SELECT D.DeptName, AVG(E.Salary) AS AverageSalary
FROM Employees E
INNER JOIN Departments D
ON E.DeptID = D.DeptID
GROUP BY D.DeptName;

SELECT D.DeptName, COUNT(E.EmpID) AS TotalEmployees
FROM Departments D
LEFT JOIN Employees E
ON D.DeptID = E.DeptID
GROUP BY D.DeptID, D.DeptName;

SELECT D.DeptName, MAX(E.Salary) AS HighestSalary
FROM Employees E
INNER JOIN Departments D
ON E.DeptID = D.DeptID
GROUP BY D.DeptName;

SELECT EmpName, Salary
FROM Employees
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
);