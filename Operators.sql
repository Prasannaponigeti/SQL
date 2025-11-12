-- creating new database
CREATE DATABASE university;
use university;

-- creating new table
create table Ece_students (
	std_id int auto_increment primary key, 
    name varchar(50) unique,
    s1_marks tinyint unsigned not null,
    s2_marks tinyint unsigned not null,
    s3_marks tinyint unsigned not null,
    age int
);
describe Ece_students;
insert into Ece_students(name, s1_marks, s2_marks, s3_marks, age)
values ('Prasanna', 80, 86, 99, 22),
		('Mallika', 85, 75, 96, 25),
        ('Sailu', 70, 89, 99, 16);
        
insert into Ece_students(name, s1_marks, s2_marks, s3_marks, age)
values ('Bittu', 85, 66, 72, 23),
		('Sam', 70, 69, 96, 22),
        ('Uma', 55, 65, 73, 20);
 
 
 -- adding constraints
alter table ece_students modify column  s1_marks tinyint unsigned not null check(s1_marks<(101));
alter table ece_students modify column  s2_marks tinyint unsigned not null check(s2_marks<(101));
alter table ece_students modify column  s3_marks tinyint unsigned not null check(s3_marks<(101));
select * from ece_students;

-- add 5 marks to s1_marks for each student
-- variable defination
set @bonus_marks = 5;
-- turn off the safe updates mode
set sql_safe_updates = 0;
update ece_students set s1_marks = s1_marks + @bonus_marks;

-- select all records
select * from ece_students;

-- computed column percentage
Alter table ece_students add  column percentage float(4,2) 
generated always as (((s1_marks + s2_marks + s3_marks)/300) * 100);

-- seelct all records
select * from ece_students;

-- Relational operators
-- operators: =, <, >, <=, >=, != or <>

-- find all records where student age is 19
select * from ece_students where age = 19;

-- find all records where s1_marks morethan 75 marks
select * from ece_students where s1_marks > 75;

-- find all records where percentage lesserthan 70
select * from ece_students where percentage < 70;

-- find all records where percentage morethan or equal to 65
select * from ece_students where percentage >= 65;

-- find all records where percentage lesserthan or equal to 70
select * from ece_students where percentage <= 70;   -- or
select * from ece_students where not percentage > 70;

-- find all records where age not equal to 19
select * from ece_students where age != 22;
select * from ece_students where not age = 16;

-- Logical operators: AND, OR, NOT

-- return all records both s1_marks and s2_marks are morethan 75 and sort by s1_marks in descending order
select * from ece_students where s1_marks > 75 and s2_marks > 60 order by s1_marks desc;

-- select records either s3_marks lesserthan 75 or percentage morethan 75 sort by name in ascending order
select * from ece_students where s3_marks < 60 or percentage > 75 order by name asc;

-- Bitwise operators : &, |, ^, <<, >>, ~
select 10 & 2 as Bitwise_AND,
		10 | 2 as Bitwise_OR,
        10 ^ 2 as Bitwise_Xor,
        10 << 3 as leftshift,
        10 >> 2 as rightshift,
        cast(~10 as signed) as Bitwise2s_com;
        
-- String operators : LIKE, NOT LIKE, RLIKE
-- '%' - IT selects zero or more characters
-- '_' - it selects exactly one character

select * from ece_students;

-- return all records where name starts with 's'
select * from ece_students where name LIKE 's%';
 
 -- return all records where name ends with 'a'
select * from ece_students where name LIKE '%a';

-- return all records where name ends with 'a' and length is 6
select * from ece_students where name LIKE '_______a';

-- return all records where name second character is 'i'
select * from ece_students where name LIKE '_a%';

-- return all records if name contains 'i' 
select * from ece_students where name LIKE '%a%i%';

select * from ece_students where name RLIKE '[M]';

-- RETURN records if name starts with 's' and ends 'i'
select * from ece_students where name RLIKE '^p[a-z]+a$';

-- return records if name endswith 'i'
select * from ece_students where name RLIKE 'a$';

-- return records if name length is 4
select * from ece_students where name RLIKE '^[a-z]{8}$';

-- return records if name length is 4-6 and starts with 's'
select * from ece_students where name RLIKE '^s[a-z]{3,5}$';

-- returns records if name not starts with 's'
select * from ece_students where name RLIKE '^[^s]';

-- if name contains either 's' or 'a'
select * from ece_students where name RLIKE '[sa]';


