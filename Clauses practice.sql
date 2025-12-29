-- CREATING THE DATABASE
-- CREATE DATABASE STUDENT

USE STUDENT;

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Age INT ,
    Salary DECIMAL(10,2),
    DeptID INT ,
    ManagerID INT,
    JoinDate DATE
);


INSERT INTO Employees (EmpID, EmpName, Age, Salary, DeptID, JoinDate, ManagerID) VALUES
(1, 'John Doe', 29, 55000, 101, '2020-01-15', 1),
(2, 'Sarah Lee', 34, 68000, 102, '2019-09-30', 1),
(3, 'Mike Ross', 41, 82000, 103, '2018-03-12', 1),
(4, 'Emma Stone', 27, 48000, 104, '2021-07-22', 4),
(5, 'Kevin Hart', 31, 60000, 103, '2020-11-01', 4),
(6, 'Olivia King', 38, 75000, 102, '2017-05-10', 4),
(7, 'Liam Smith', 25, 45000, 101, '2022-02-14', 4),
(8, 'Ava Brown', 30, 70000, 104, '2020-08-05', 9),
(9, 'David Park', 44, 92000, 103, '2016-12-19', 9),
(10, 'Nora Green', 33, 65000, 101, '2021-04-03', 9);

SELECT * FROM EMPLOYEES;

-- USING CLAUSES
SELECT * FROM EMPLOYEES WHERE SALARY > 65000;

SELECT EMPNAME, SALARY FROM EMPLOYEES ORDER BY SALARY DESC;

select deptid, count(*) from employeeS group by deptid;

select salary, count(*) from employees group by salary having count(*) > 1;

SELECT DISTINCT MANAGERID FROM EMPLOYEES;

-- SQL PREDICATES
SELECT * FROM EMPLOYEES WHERE SALARY BETWEEN 40000 AND 60000;

SELECT * FROM EMPLOYEES WHERE MANAGERID IN (1, 4);

SELECT salary * 12 AS annual_salary FROM employees;

SELECT * FROM EMPLOYEES WHERE MANAGERID IS NULL;

SELECT * FROM EMPLOYEES WHERE MANAGERID IS NOT NULL;