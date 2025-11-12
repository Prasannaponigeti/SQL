USE it_company;
-- create new table
create table employee2(
Id int auto_increment,
Name varchar(40) Not null,
Gender enum('Male', 'Female') Not null,
Dept varchar(20) Not null,
Salary int unsigned Not null,
primary key(Id)
);

-- adding new column
ALTER TABLE employee2 ADD Age tinyint NOT NULL;

-- DESCRIPTION OF TABLE
DESCRIBE employee2;

-- inserting records
INSERT INTO employee2(Name, Age, Gender, Dept, Salary)
values("Prasanna", 22, "Female", "IT", 45000),
("Mallika", 24, "Female", "IT", 47000),
("Bittu", 23, "Male", "SALES", 40000),
("Uma", 21, "Female", "SALES", 39000),
("Sailu", 20, "Female", "IT", 45000);
SELECT * from employee2;

-- select the name and dept from employee2 table
select name, dept from employee2;

-- select only it dept records
select Id, Name, Salary from employee2;

-- select the it and sales dept records
select * from employee2 where dept = "IT" or dept = "SALES";

-- UPDATE salary whose id is 5
update employee2 SET salary = 55000
where id = 5;
select * from employee2;
