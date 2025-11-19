use DQL_DATABASE;
SELECT * FROM EMPLOYEES;

-- 1. select emp_id and firstname and lastname as fullname
select EMPLOYEE_ID, concat(FIRST_NAME, ' ', LAST_NAME) AS FULLNAME FROM EMPLOYEES;

-- 2. return all records fullname as firstname first character followed by '. ' and lastname
select EMPLOYEE_ID, concat(LEFT(FIRST_NAME,1), '. ', LAST_NAME) AS FULLNAME FROM EMPLOYEES;

-- 3. remove the '.' in mobile number
select EMPLOYEE_ID, concat(FIRST_NAME, ' ', LAST_NAME) AS FULLNAME,
REPLACE(PHONE_NUMBER, '.', '')  FROM EMPLOYEES;
 
-- 4. return all records email id follows as first character in firstname and lastname sort by fullname
select EMPLOYEE_ID, concat(LEFT(FIRST_NAME,1), LAST_NAME) AS FULLNAME, EMAIL FROM EMPLOYEES
WHERE concat(LEFT(FIRST_NAME,1), LAST_NAME) = EMAIL;

 
-- 5. Returns all records empid, fullname, emailid as email@gmail.com
select EMPLOYEE_ID, CONCAT(FIRST_NAME, ' ', LAST_NAME) AS FULLNAME, concat(email, '@gmail.com') as email from employees;
-- 6. return top 5 records as per salary
SELECT * FROM EMPLOYEES  ORDER BY SALARY DESC LIMIT 5;

-- 7. return all records if length of fullname is morethan 15 characters
select EMPLOYEE_ID, concat(LEFT(FIRST_NAME,1), LAST_NAME) AS FULLNAME, EMAIL FROM EMPLOYEES
where char_length(concat(FIRST_NAME, LAST_NAME)) > 15;

-- 8. return all records empid,
              -- email as (email + first 3 characters in mobile + @gmail.com 
			-- for department id are in 10, 20, 50, 90
			-- sort by email id
                            
SELECT EMPLOYEE_ID, CONCAT(FIRST_NAME, ' ', LAST_NAME) AS FULLNAME,
CONCAT(EMAIL, LEFT(PHONE_NUMBER, 3), '@gmail.com') as EMAIL, PHONE_NUMBER
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (10,20,50,90)
order by EMAIL;