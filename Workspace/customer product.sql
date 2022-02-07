use assignment1;
show tables;

#add one more column 'country' in 'Customer Address' tables.
ALTER TABLE customer_address ADD country varchar(30) not null;
select * from customer_address;

#Insert atleast 3 values to each tables.
INSERT INTO customer VALUES ('abc@gmail.com', 'rohan', 987654321 , 98789, 001 );
INSERT INTO customer VALUES ('def@gmail.com', 'mohit', 987776432 , 67890, 002 );
INSERT INTO customer VALUES ('ghi@gmail.com', 'kriti', 987654321 , 97580, 003 );
select * from customer;


INSERT INTO customer_address VALUES ('karol bagh', 93458, 'delhi', 'india' );
INSERT INTO customer_address VALUES ('t nagar', 67890, 'chennai', 'india' );
INSERT INTO customer_address VALUES ('rr nagar', 97580, 'banglore', 'india');
select * from customer_address;

INSERT INTO product VALUES (001, 'soap', 321);
INSERT INTO product VALUES (002, 'handwash', 432);
INSERT INTO product VALUES (003, 'cup', 351);
select * from product;


#create a duplicate table of 'customer' table using SELECT statement.
CREATE TABLE customer1 AS SELECT * FROM customer;

show tables;

#Drop the column 'state' from 'Customer_Address' table.
ALTER TABLE customer_address
DROP COLUMN state;
select * from customer_address;


#Rename the table 'Customer_Address' to 'Address'.
ALTER TABLE customer_address RENAME To address;   

show tables; 


