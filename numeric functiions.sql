use dql_database;

-- creating new table
create table market_items (
	ID int auto_increment primary key,
    item_name varchar(30) unique,
    price  float unsigned not null,
    discount float signed
);
describe market_items;

-- inserting values
insert into market_items (item_name, price, discount)
values ('Pen', 50.45, -2.49),
		('Ball', 85.99, 8.3215),
        ('Notebook', 49.656,6.5467),
        ('Pencil', 5.001, -0.001),
        ('Bottle', 99.9965, -6.0235),
        ('Drawing book', 125.652, -6.0235);
        
select * from market_items;
update market_items set discount = 0 where item_name = 'Drawing book';

-- find all records actual price (i.e after discount)
select ID,(price - ABS(discount)) as 'actual_price' from market_items;

-- return all records price, value with 2 decimal places
select * , round(price,2) FROM market_items;

-- return records  yes if the discount available
alter table market_items add column discount_available varchar(3) Generated always as(if(discount <> 0, 'Yes', 'No'))stored;

-- return the records where discount > average discount
select item_name, price, discount
from market_items
where discount > (select avg(discount) from market_items);

-- find the modulus of price divides by 10
select item_name, mod(price, 10) as remainder from market_items;

-- find the square root of price
select item_name, sqrt(price) as sqrt_price from market_items;

-- find the highest and lowest prices
select max(price) as highest_price, min(price) as lowest_price from market_items;

-- find the average discount and total discount
select avg(discount) as avg_discount, sum(discount) as total_discount from market_items;

-- find the power of each items price
select item_name, price, power(price, 2) as square_price from market_items;

-- find whether the discount is positive, negative, or zero using sign
select item_name, discount, sign(discount) as sign_value from market_items;

select item_name, price, truncate(price, 2) as price_1_decimal from market_items;