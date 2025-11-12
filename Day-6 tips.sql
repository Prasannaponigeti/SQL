-- create new databbase
create database dql_database;

-- select the database
use dql_database;
select * from tips;
describe tips;


-- DDL commands
-- change column name of sex to gender
ALTER TABLE tips RENAME COLUMN SEX TO GENDER;

-- DQL COMMANDS
-- SELECT size, time, day, tip
SELECT size, time, day, tip from tips;

-- fetch records which one has smoker is yes
select  * from tips where smoker = 'yes';

-- fetch record which one is smoker amd size = 3
select * from tips where smoker = 'yes' and size = 3;

-- fetch records which are size in (2,3,4)
select * from tips where size in (2,3,4);

-- fetch records which are tip in betweeen(10-20)
select  * from tips where tip >=10 and tip<20;

-- fetch records which are day in (sun, mon, sat) and smoker = yes
select * from tips where smoker = 'yes' and day in ('tuesday', 'saturday');

-- fetch records which are non smoker with gender is male
select * from tips where smoker = 'no' and gender = 'male';

-- fetch records count of non smoker with dinner time
select * from tips where smoker = 'no' and time = 'dinner';

-- fetch records average of non smoker within the size not in(2,3,6)
select avg(total_bill) from tips where smoker = 'no' and size not in (2,3,6);

-- fetch records which are size =3 and gender is female
select * from tips where size =3 and gender = 'female';

-- fetch records which are dinner time amd gender is female
select * from tips where time = 'dinner' and gender = 'female';

-- fetch records whichb are gender is male amd size in (2,3,4)
select * from tips where gender = 'male' and size in (2,3,4);

-- fetch records which are total bill in range of 20 to 30
select * from tips where total_bill between 20 and 30;

-- fetch records  which are size = 3
select * from tips where size = 3;

-- select all columns from tips table 
SELECT * from  tips;

-- total records count of day in (fri, sat, sun) with dinner time
select count(*) from tips where time = 'dinner' and day in ('fri', 'sat', 'sun');

-- total records count of day is sun with size 3 and day is sat with size 4
select * from tips where  (day = 'sun' and size = 3 or day = 'sat' and size = 4);

-- fetch the following details to all size with specified one 
                    -- records count as 'total records of size 2'
                    -- total bill as total bill of size 2
                    -- Min bill as Minimum bill of size 2'
                    -- Max bill as Maximum bill of size 2
select count(*) as "total_records_of_size_2",
               sum(total_bill) as "Total_bill_of_size_2",
               min(total_bill) as "Minimum_bill_of_size_2",
               max(total_bill) as "Maximum_bill_of_size_2"
               from tips
               where size =2;
               
-- count the Null value in size column
select count(*) from tips where size is null;
select count(*) from tips where size is not null;
select count(*) from tips where day is not null;

-- fetch records of aggregate values of size 2
select count(*) as "total records",
min(total_bill) "minimum bill",
max(total_bill) "maximum bill"
from tips
where size = 2;

-- group by clause queries

-- find the total records of each size
select size, count(*) from tips group by size;
select size, count(*), sum(total_bill) from tips group by size;

-- find the average total bill of gender
select gender, avg(total_bill) from tips group by gender;
select gender, round(avg(total_bill),2) as average_bill from tips group by gender;

-- find the sum of total bill, average of total for gender
select gender, sum(total_bill) as total_bill, round(avg(total_bill),2) as average_bill from tips group by gender;

-- find the sum of total bill, average of total of combination size and gender
select size, gender, round(avg(total_bill),2) as average_bill from tips group by size, gender order by size;

select size, gender, count(*) as total_records from tips
group by size, gender
order by size asc, total_records desc;

-- find the total records of size in (2,3,4) with respect to gender
select  gender, count(*) as total_records from tips
where size in (2,3,4)
group by  gender 
order by total_records desc;

select  size, gender, count(*) as total_records_of_2_3_4 from tips
where size in (2,3,4)
group by  size, gender 
order by  size asc, total_records_of_2_3_4 desc;

-- find min total bill , max total bill of day wise for size 2
select size, day, min(total_bill), max(total_bill) from tips 
where size = 2 
group by day;

select  size, gender, count(*) as total_records_of_2_3_4 from tips
where size in (2,3,4)
group by  size, gender 
having count(*) > 20
order by  size asc, total_records_of_2_3_4 desc;

select  size, gender, count(*) as total_records_of_2_3_4, avg(total_bill) from tips
where size in (2,3,4)
group by  size, gender 
having avg(total_bill) > 20
order by  size asc, total_records_of_2_3_4 desc;