-- creating new database
-- syntax: CREATE DATABASE database_name;
CREATE DATABASE IT_Company;


-- creates the new database if database not exists
CREATE DATABASE IF NOT EXISTS IT_Company;

CREATE DATABASE IF NOT EXISTS NON_IT_Company;


-- use database syntax: USE Database_name
USE IT_Company;

-- creating new table
-- syntax: CREATE TABLE Tablename(col_name1 datatype, col_name2 datatype);
CREATE TABLE employee(
emp_id INT,
Name CHAR(30),
Age int
);

select * from employee;
-- it describes the table structure
DESCRIBE employee;

-- add new column to an existing table
-- syntax: ALTER TABLE Table_name ADD COLUMN col_name datatype;
ALTER TABLE employee ADD COLUMN salary int;
DESCRIBE employee;

ALTER TABLE employee ADD salary2 int;
DESCRIBE employee;

-- Droping the column from an existing table
-- Syntax: ALTER TABLE table_name DROP COLUMN col_name;
ALTER TABLE employee DROP COLUMN salary2;
DESCRIBE employee;

-- Renaming the table_name
-- syntax: RENAME TABLE old_table_name TO New_table_name
RENAME TABLE Employee TO Employees_info;

-- Renaming the column name in the table
-- syntax: ALTER TABLE Table_name RENAME COLUMN old_col_name To New_col_name
ALTER TABLE Employees_info
RENAME COLUMN NAME TO EMP_NAME;
DESCRIBE employees_info;

-- Modify the column datatype
-- syntax: ALTER TABLE table_name MODIFY col_name New_datatype;
ALTER TABLE employees_info MODIFY EMP_NAME VARCHAR(50);
DESCRIBE employees_info;

-- drops the database if exists
DROP DATABASE IF EXISTS non_it_company;
