create database sample;

-- use database
use sample;

create table table1(
tinyint_col tinyint,
smallint_col smallint unsigned,
mediumint_col mediumint,
int_col int,
bigint_col bigint,
float_col float,
double_col double,
decimal_col decimal(5,2)
);

describe table1;

-- insert values into table
INSERT INTO table1(tinyint_col, smallint_col, mediumint_col, int_col, bigint_col, 
float_col, double_col, decimal_col) VALUES(10,100,1554,15421,545424848,125.967,12.967,129.99);

-- TO SEE INSERT DATA
select * from table1;

