use student;

-- CREATING THE TABLES
CREATE TABLE EMPLOYEES(
EMP_ID INT PRIMARY KEY AUTO_INCREMENT,
EMP_NAME VARCHAR(30) NOT NULL,
AGE INT CHECK (AGE >= 22),
EMP_DEPT VARCHAR(30) NOT NULL,
EMP_EMAIL VARCHAR(100) UNIQUE,
STATUS VARCHAR(20) DEFAULT 'active');

-- INSERTING THE DATA
INSERT INTO EMPLOYEES (EMP_NAME, AGE, EMP_DEPT, EMP_EMAIL)
VALUES ("SRINU", 23, "TRAINEE", "SRINU@GMAIL.COM"),
       ("DEEPU", 24, "HR", "DEEPU@GMAIL.COM"),
       ("BITTU", 23, "SALES", "BITTU@GMAIL.COM"),
       ("RICKY", 22, "MEDICAL", "RICKY@GMAIL.COM");
       
SELECT * FROM EMPLOYEES;


-- USING THE FOREIGN KEY
-- PARENT TABLE
CREATE TABLE departments (
department_id INT PRIMARY KEY AUTO_INCREMENT,
department_name VARCHAR(100) NOT NULL
);
-- Child table with foreign key
CREATE TABLE employees1 (
employee_id INT PRIMARY KEY AUTO_INCREMENT,
employee_name VARCHAR(100) NOT NULL,
department_id INT,
FOREIGN KEY (department_id) REFERENCES departments(department_id));


-- First, insert departments
INSERT INTO departments (department_name) VALUES ('Sales');
INSERT INTO departments (department_name) VALUES ('IT');
INSERT INTO departments (department_name) VALUES ('HR');

-- Now insert employees
INSERT INTO employees1 (employee_name, department_id)
VALUES ('John Doe', 1); 
INSERT INTO employees1 (employee_name, department_id)
VALUES ('Jane Smith', 2);

SELECT * FROM EMPLOYEES1;


-- Foreign Key with CASCADE Options:
CREATE TABLE customers (
customer_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(100) UNIQUE
);


CREATE TABLE orders (
order_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT,
order_date DATE,
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id)
ON DELETE CASCADE
ON UPDATE CASCADE
);

INSERT INTO customers (first_name, last_name, email)
VALUES ('Alice', 'Johnson', 'alice@example.com');
-- customer_id = 1
INSERT INTO customers (first_name, last_name, email)
VALUES ('Bob', 'Williams', 'bob@example.com');


-- Understanding CASCADE:
-- Create sample data
INSERT INTO customers (first_name, last_name, email)
VALUES ('Tom', 'Hardy', 'tom@example.com');
-- Assume this creates customer_id = 10
INSERT INTO orders (customer_id, order_date)
VALUES (10, '2024-01-15');

-- If we delete the customer with CASCADE
DELETE FROM customers WHERE customer_id = 10;
-- The order is AUTOMATICALLY deleted too
-- Without CASCADE, the delete would FAIL to protect data integrity

