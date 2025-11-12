USE it_company;
select * from employee2;

-- creating new table from an existing table
-- syntax
-- create table new_table name
CREATE TABLE employee2_backup AS
SELECT * from employee2;

-- select the employee2_backup table
select * from employee2_backup;

-- creating new table using an existing table and select particular column
CREATE table EMP_ids as 
select Id, dept from employee2;

-- checking the newly created table records
select * from EMP_ids;
describe employee2_backup;
describe employee2;

-- creating  new table and selecting some records from an existing table
create table IT_employees as
select * from employee2
where dept = "it";
select * from IT_employees;

-- copy the structure of table
create table employee2_structure
select * from employee2
where 1=0;

-- checking the structure
select * from employee2_structure;

-- approach 2 for copying the structure of table
create table employee2_structure1
select * from employee2;

-- to delete all records from table
truncate table employee2_structure1;
select count(*) from employee2_structure1;

-- computed column - a column value which is derived from existed column values
create table orders(
id int auto_increment,
price int unsigned not null,
quantity int unsigned not null,
total_price int generated always as (price * quantity) stored,
primary key(id)
);

-- inserting values for price and quantity 
insert into orders(price, quantity)
values(10, 2), (20, 4), (19, 4);

-- select records in orders table
select * from orders;

create table operators_table(
val1 int,
val2 int,
totalsum int generated always as(val1+val2)stored,
totalsub int generated always as(val1-val2)stored,
totalmul int generated always as(val1*val2) stored,
totaldiv int generated always as(val1/val2) stored,
totalmod int generated always as(val1%val2)stored);

insert into operators_table(val1,val2)
values(10,2), (20,3),(13,5);

-- adding new column to orders table
ALTER TABLE orders add summ_to_numbers int generated always as (price+quantity)stored;

