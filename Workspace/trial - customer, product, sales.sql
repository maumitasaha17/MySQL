# Under the trail > table > Right click and then select Table Data Import Wizard.
# Now select the file which u want to impot one at a time.
# check create new table > next > next > next > finish.

#IF YOU WNAT TO EXPORT THE DATABASE as a backup
# select the table > right click >table data import wizard


#create database
create database trail;

#use the database
use trail;

#get the data
select * from customer;
select * from product;
select * from sales;


use trail;
show tables;

select fname,lname,customer_id from customer;

select * from customer;

#using where clause
SELECT customer_id,fname, lname, telno 
FROM customer
WHERE customer_id > 50;


SELECT customer_id,fname, lname, telno 
FROM customer
WHERE customer_id > 2000;

select * from customer;
SELECT customer_id,fname, lname, telno , status
FROM customer
WHERE  status = 'A';


SELECT fname, lname, telno 
FROM customer 
WHERE fname like '%J%';


#CUSTOMERS BELONG TO BIG CITY
select * from customer;
SELECT fname, lname,status,address
FROM customer
WHERE status = 'I' AND Address = 'Bigcity|12345';


SELECT fname, lname,status,address
FROM customer
WHERE status = 'I' OR Address='Bigcity|12345';


SELECT * FROM product WHERE packaged_with like 'ata%';


SELECT * FROM product WHERE packaged_with like '%ata%';

SELECT * FROM product WHERE  prod_name like '____T%';

SELECT * FROM product WHERE  prod_name like '%J';

SELECT * FROM product WHERE prod_name like 'DVD%' AND description like '%Tiger Brand%';

SELECT prod_name, description, category FROM product WHERE category IN ('Ram','CPU', 'HD');


SELECT prod_name, description, category FROM product WHERE category NOT IN ('Ram','CPU', 'HD');



SELECT prod_num, prod_name, description, category FROM product
WHERE prod_num BETWEEN 45628 AND 45691;

# WONT WORK
#SELECT prod_num, prod_name, description, category FROM product
#WHERE prod_num  between 45628 OR 45691; 

SELECT prod_num, prod_name, description, category FROM product
WHERE prod_num NOT BETWEEN 45628 AND 45691;

SELECT * FROM sales ORDER BY cust_id, sales_id;

SELECT * FROM product WHERE category = 'RAM'
ORDER BY qty_on_hand DESC;



#Group By
SELECT sum(qty_on_hand), category
FROM product    
GROUP BY category;


SELECT sum(qty_on_hand), category, packaged_with
FROM product    
GROUP BY category
ORDER BY sum(qty_on_hand) DESC;


SELECT PROD_NAME, sum(qty_on_hand) , category,count(*) AS total_Count, packaged_with
FROM product  
WHERE packaged_with like '%manual%'
GROUP BY category
ORDER BY sum(qty_on_hand) DESC;


#Having - only geting particular category
SELECT PROD_NAME, sum(qty_on_hand), category, count(*) AS total_count
FROM product  
GROUP BY category
HAVING category = 'CPU';


SELECT PROD_NAME, sum(qty_on_hand), category, count(*) AS total_count
FROM product  
GROUP BY category
HAVING category = 'RAM';


SELECT PROD_NAME, sum(qty_on_hand) , category, count(*) AS total_Count, packaged_with
FROM product 
WHERE packaged_with like '%manual%'   
GROUP BY category
HAVING sum(qty_on_hand) > 100;


SELECT PROD_NAME, sum(qty_on_hand) , category, count(*) AS total_Count, packaged_with
FROM product WHERE packaged_with like '%manual%'   
GROUP BY category
HAVING sum(qty_on_hand) > 100 AND category= 'RAM';


#Distinct
SELECT DISTINCT category
FROM product  
ORDER BY PROD_NUM;

SELECT DISTINCT prod_num,category
FROM product  
ORDER BY PROD_NUM;


SELECT DISTINCT category, prod_num
FROM product 
WHERE PROD_NUM > 45691
ORDER BY PROD_NUM;


SELECT CUSTOMER_ID,FNAME,LNAME,ADDRESS
FROM CUSTOMER  
ORDER BY (CASE ADDRESS   
WHEN 'Bigcity|12345'   THEN 1   
WHEN 'Mediumcity|67890'   THEN 2  
WHEN 'Smallcity'   THEN 3   
ELSE 100 END) ASC, ADDRESS DESC;


SELECT PROD_NUM, CONCAT(DESCRIPTION,'=>', CATEGORY ) AS Product_With_Category
FROM product
ORDER BY prod_num;



SELECT length(QTY_ON_HAND),  qty_on_hand
FROM product;


SELECT PROD_NUM, CONCAT(DESCRIPTION,'=>', CATEGORY ), QTY_ON_HAND   
FROM product
WHERE LENGTH(QTY_ON_HAND) > 3 ;

SELECT TRIM('  Hello  ') AS test;

SELECT LTRIM('  Hello  ') AS test;

SELECT TRIM(' Hello  ') AS test;

SELECT LTRIM(PROD_NAME) from product;




SELECT PROD_NUM, UPPER(CONCAT(DESCRIPTION,'=>', CATEGORY )), QTY_ON_HAND
FROM product
WHERE LENGTH(QTY_ON_HAND) > 3 ;



SELECT PROD_NUM, LOWER(category), QTY_ON_HAND
FROM product
WHERE category = 'CPU' ;



select * from product;



SELECT PROD_NUM, REPLACE(category, 'HD', 'Hard Disk Drive'), QTY_ON_HAND
FROM product
WHERE category = 'HD';



SELECT DESCRIPTION, CATEGORY   
FROM product
WHERE CATEGORY REGEXP '^Opt'; 



SELECT DESCRIPTION, CATEGORY
FROM product
WHERE DESCRIPTION REGEXP 'Brand$';



SELECT description, CATEGORY
FROM product
WHERE category REGEXP '[a-c]';




SELECT description, CATEGORY
FROM product
WHERE description REGEXP '[0-9]'; 




SELECT SUBSTRING(DESCRIPTION, 1,6) AS PROD_DESC,CATEGORY
FROM product;



select * from product;

SELECT SUBSTRING(DESCRIPTION, 1,5) AS PROD_DESC,CATEGORY
FROM product
WHERE category = 'RAM';


SELECT INSTR(DESCRIPTION, 'D') AS PROD_DESC,description,CATEGORY   
FROM product;


SELECT INSTR(DESCRIPTION, 'DVD') AS PROD_DESC,description,CATEGORY
FROM product
WHERE CATEGORY REGEXP '^Opt';








SELECT prod_num, category AS prod_category, AVG(qty_on_hand) avg_qty_available
FROM product
GROUP BY category
ORDER BY prod_num;  



SELECT category AS prod_category, AVG(qty_on_hand) avg_available_qty
FROM product
WHERE category = 'RAM' 
GROUP BY category;


SELECT prod_num, category, COUNT(*) AS total
FROM product
GROUP BY category                                  
ORDER BY prod_num;


SELECT COUNT(category) AllCount, 
COUNT(DISTINCT category) SingleCount
FROM product;


SELECT prod_num, category, sum(qty_on_hand) AS Total_Count
FROM product
GROUP BY category
ORDER BY prod_num DESC;


SELECT prod_num, category, sum(qty_on_hand) AS Total_Count 
FROM product
WHERE category ='RAM'
GROUP BY category;



SELECT prod_num,category, sum(qty_on_hand) AS Total_Count, sales_id, date
FROM product 
INNER JOIN
sales USING (prod_num)
GROUP BY category  
ORDER BY prod_num;


SELECT category, max(qty_on_hand) Max_Qty 
FROM product;


SELECT category, max(qty_on_hand) Max_Qty
FROM product
GROUP BY category
ORDER BY max(qty_on_hand) DESC; 


SELECT category, max(qty_on_hand) Max_Qty
FROM product
WHERE category='CPU'
GROUP BY category;


SELECT category, min(qty_on_hand) Min_Qty
FROM product
GROUP BY category
ORDER BY min(qty_on_hand);



SELECT RANK() 
OVER(ORDER BY customer_id) 
AS Customer_grades,
customer_id, fname, lname
FROM customer;


SELECT RANK() 
OVER(ORDER BY qty_on_hand) 
AS Total_Qty,Qty_On_Hand, prod_name, category
FROM product;


SELECT
DENSE_RANK() OVER(ORDER BY qty_on_hand) AS Total_Qty,
Qty_On_Hand, prod_name, category
FROM product;


SELECT
ROW_NUMBER() 
OVER(ORDER BY qty_on_hand) AS Total_Qty,
Qty_On_Hand, 
prod_name, category
FROM product;


SELECT RANK() 
OVER(PARTITION BY category ORDER BY qty_on_hand ) 
AS Total_Qty,
Qty_On_Hand, prod_name, category
FROM product;



SELECT prod_name, category, Qty_On_Hand,
SUM(Qty_On_Hand) 
OVER(PARTITION BY category ORDER BY qty_on_hand) 
AS Total_Qty   
FROM product;



create table college1
(
stud_id int not null,
stud_name varchar(35),
stud_branch varchar(20)
);
insert into college1 values(1, 'avishek', 'CSE');
insert into college1 values(2, 'dipankar', 'IT');
insert into college1 values(3, 'Ranjan', 'ECE');
insert into college1 values(7, 'Anirudha', 'EEE');

create table college2
(
lect_id int not null,
lect_hometown varchar(30),
lect_salary int(12)
);
insert into college2 values(1,'kolkata', 60000);
insert into college2 values(2,'Ranchi', 50000);
insert into college2 values(3,'Delhi', 65000);
insert into college2 values(6,'Mumbai', 70000);
insert into college2 values(9,'Chennai', 55000);


show tables;
select * from college1;
select * from college2;


#INNER JOIN
SELECT college1.stud_id, college1.stud_branch, college2.lect_hometown
FROM college1
INNER JOIN
college2
ON college1.stud_id = college2.lect_id;


#LEFT JOIN
SELECT college1.stud_id, college1.stud_branch, college2.lect_hometown
FROM college1
LEFT JOIN
college2
ON 
college1.stud_id = college2.lect_id;


#RIGHT JOIN
SELECT college1.stud_id, college1.stud_branch, college2.lect_hometown
FROM college1
RIGHT JOIN
college2
ON 
college1.stud_id = college2.lect_id;

#For full outter join

SELECT college1.stud_id, college2.stud_id, college1.stud_branch, college2.lect_hometown
FROM college1
LEFT JOIN
college2
ON 
college1.stud_id = college2.lect_id
UNION
SELECT college1.stud_id, college1.stud_branch, college2.lect_hometown
FROM college1
RIGHT JOIN
college2
ON 
college1.stud_id = college2.lect_id;

select* from college2;




SELECT customer.customer_id, customer.status, customer.Address,sales.cust_id, sales.qty, sales.date
FROM customer
INNER JOIN
sales 
ON customer.customer_id = sales.cust_id
ORDER BY customer.customer_id;


select count(*) from customer;
select count(*) from sales;


SELECT customer.customer_id, customer.status, customer.Address,sales.qty, sales.date, count(*)
FROM customer
INNER JOIN
sales 
ON customer.customer_id = sales.cust_id
ORDER BY customer.customer_id; 




SELECT customer.customer_id, customer.status, customer.Address,sales.qty, sales.date
FROM customer
INNER JOIN 
sales   
ON customer.customer_id = sales.cust_id
WHERE Address like '%Bigcity%'
ORDER BY customer_id;



SELECT customer.customer_id, customer.status, customer.Address,sales.cust_id,sales.qty, sales.date
FROM customer
LEFT JOIN
sales 
ON customer.customer_id = sales.cust_id
ORDER BY customer.customer_id;


SELECT customer.customer_id, customer.status, customer.Address,sales.cust_id,sales.qty, sales.date
FROM customer
RIGHT JOIN
sales 
ON customer.customer_id = sales.cust_id
ORDER BY customer.customer_id;



SELECT customer.customer_id, customer.status, customer.Address,sales.cust_id,sales.qty, sales.date
FROM customer   
LEFT JOIN
sales 
ON customer.customer_id = sales.cust_id
UNION
SELECT customer.customer_id, customer.status, customer.Address,sales.cust_id,sales.qty, sales.date
FROM customer
RIGHT JOIN
sales 
ON customer.customer_id = sales.cust_id;




SELECT * FROM
(
SELECT customer.customer_id, customer.status, customer.Address,sales.cust_id,sales.qty, sales.date
FROM customer
LEFT JOIN
sales 
ON customer.customer_id = sales.cust_id
UNION
SELECT customer.customer_id, customer.status, customer.Address,sales.cust_id,sales.qty, sales.date
FROM customer
RIGHT JOIN
sales 
ON customer.customer_id = sales.cust_id
   ) x
ORDER BY x.customer_id;    



Select * FROM
(
SELECT customer.customer_id, customer.status, customer.Address,sales.cust_id,sales.qty, sales.date
FROM customer
LEFT JOIN
sales 
ON customer.customer_id = sales.cust_id
UNION
SELECT customer.customer_id, customer.status, customer.Address,sales.cust_id,sales.qty, sales.date
FROM customer
RIGHT JOIN
sales 
ON customer.customer_id = sales.cust_id
   ) x
WHERE x.address LIKE 'Bigcity%' AND x.status = 'I' AND x.cust_id IS NOT NULL; 




SELECT customer.customer_id,customer.fname,customer.Address, product.description, product.category 
FROM 
customer
CROSS JOIN 
product;



select count(*) from products;



SELECT customer.customer_id,customer.fname,customer.Address, product.description, product.category
FROM 
customer
CROSS JOIN 
product
WHERE product.category = 'RAM';



SELECT c1.customer_id,c1.fname,c1.Address, c2.prod_num, c2.cust_id 
FROM 
customer c1, sales c2
WHERE c1.customer_id=c2.cust_id;



SELECT 
prod_name,
category,
(SELECT count(*) FROM sales WHERE sales.prod_num = product.prod_num  ) AS Number_of_Sales
FROM product 
WHERE category = 'HD';


SELECT prod_num,category,
(SELECT count(*) 
FROM sales 
WHERE
prod_num=product.prod_num GROUP BY prod_num) AS number_of_sales
FROM product  WHERE category='HD';




SELECT prod_num, category, description, qty_on_hand
FROM product
WHERE qty_on_hand = (SELECT MAX(qty_on_hand) FROM product );



SELECT p.prod_num,p.prod_name,p.category
FROM product p
WHERE p.prod_num=(
SELECT s.prod_num
FROM sales s WHERE s.prod_num = 87659);

SELECT * FROM 
(SELECT fname, lname, address AS city  FROM customer) AS Cust_Details
WHERE city like '%Big%';




CREATE TABLE Cust_Addr AS SELECT * FROM 
(SELECT fname, lname, address AS city  FROM customer) AS Cust_Details
WHERE city like '%Big%';


SELECT *
FROM product
WHERE prod_num NOT IN (SELECT prod_num FROM sales);
