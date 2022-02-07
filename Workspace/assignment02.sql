#(1)  Suppose 'Amit Jaiswal' is Hired as Database Developer in IBM, 
#You working there as a DBA. 
#Your manager assigned a ticket to you to crrate a user
#account on behalf of Amit where his password is expired 
#at first login and he will be able to set his new password. 
#Please write down the SQL query to perform the same Task.

create user 'amit'@'localhost' identified by 'Amit@123' PASSWORD EXPIRE ;


#(2) Assign the privileges to Amit where he will only able to 
#query on the production databse to generate reports but able 
#to perform all DDL and DML operations on UAT database. 
#where the name of production database and UAT database is 
#'prod' and 'uat' respectively.(You need to create databases prod & uat)

create database prod;
create database uat;
GRANT SELECT,CREATE,ALTER, DROP,INSERT,UPDATE,DELETE ON uat.* to 'amit'@'localhost';


# (3) Suppose, Amit try to breach some confidential policies of 
#company and as result company make decision to fired him. 
#As a DBA you are responsible to revoke all privileges 
#assigned to him and drop his user account from your database 
#after the specified period of time as per company policy.

REVOKE SELECT ON prod.* FROM 'amit'@'localhost';
REVOKE ALL PRIVILEGES ON uat.* FROM 'amit'@'localhost';
DROP USER 'amit'@'localhost';
