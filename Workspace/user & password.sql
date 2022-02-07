#creating user 
create user 'maumita'@'localhost' identified by 'Maumita@123456';


desc.mysql.user;

select user from mysql.user;

select * from mysql.user;

# if the password expired u can set a new passwor using this
create user 'dipankar'@'localhost' identified by 'Dipankar@123' PASSWORD EXPIRE ;

select * from mysql.user;


create USER 'raj'@'localhost' 
IDENTIFIED WITH caching_sha2_password BY 'Raj@123' 
PASSWORD EXPIRE INTERVAL 180 DAY
FAILED_LOGIN_ATTEMPTS 3  PASSWORD_LOCK_TIME 1;


select user from mysql.user WHERE USER = 'raj';

ALTER USER  'raj'@'localhost' ACCOUNT UNLOCK;

create user 'amit'@'localhost' 
identified with caching_sha2_password by 'Amit@123' 
PASSWORD EXPIRE INTERVAL 180 DAY
FAILED_LOGIN_ATTEMPTS  2 PASSWORD_LOCK_TIME 1;



#unlock
alter user 'maumita'@'localhost' account unlock;

#lock
alter user 'maumita'@'localhost' account lock;


#grant
grant create, alter, drop on test.* to 'maumita'@'localhost';
select * from mysql.user;



revoke create, alter, drop on test1.* from 'avishek'@'localhost';

create table test(id int);

alter table test add name varchar(30);

use test1;

desc test1;

select * from test;


insert into test1 values(001);

create table testing(id varchar(20));
insert into test1 values('mau');

select * from testing;


CREATE ROLE 'dba1', 'developer', 'app_user';
create user 'utpal'@'localhost' identified by 'Utpal@123';
create user 'ranjan'@'localhost' identified by 'Ranjan@123';





