USE it_company;

-- creating new table
CREATE TABLE employee(
emp_id int AUTO_INCREMENT,   -- colum level constraint
Name VARCHAR(40) NOT NULL,
Age TINYINT,
Department VARCHAR(20),
Salary INT UNSIGNED NOT NULL,
Gender ENUM("Male", "Female", "Other"),
Location VARCHAR(25) DEFAULT "INDIA",
PRIMARY KEY(emp_id),   -- table level constraint
CHECK(Age > 18)   -- table level constraint
);

-- description of table
desc employee;

-- insert rows into  a table
INSERT INTO employee(Name, Age, Department, Salary, Gender, Location)
Values("prasanna", 22, "IT", 50000, "Female", "USA"),
("Mallika", 25, "DEVELOPMENT", 95000, "Female", default),
("Bittu", 24, "HR", 85000, "Male", default);

select * from employee;

-- inserting name as null
INSERT INTO employee(Name, Age, Department, Salary, Gender, Location)
Values(" ", 22, "IT", 50000, "Female", "USA");

-- inserting age as below 18
INSERT INTO employee(Name, Age, Department, Salary, Gender, Location) values("Prasanna", 16, "IT", 55000, "Female", "INDIA");
ALTER TABLE employee add branch varchar(30);
ALTER TABLE employee add education varchar(30) default"BTECH";
