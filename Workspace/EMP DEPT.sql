# use cmd - to slecet any database and create table 
use mydb; #press ctrl + enter

show tables;

#INSERT INTO dept values (501, 'Information Technology');
#INSERT INTO dept values (502, 'Finance');
#INSERT INTO dept values (503, 'Marketing');
#INSERT INTO dept values (504, 'Accounts');
#INSERT INTO dept values (505, 'Human Resource');
#INSERT INTO dept values (506, 'Admin');
#INSERT INTO dept values (507, 'Management');
select * from dept;
#desc dept;
drop table dept;

INSERT INTO employees values (001, 'Avishek', 'Singh', 1600000, '2017-07-21', 501, '7003064710');
INSERT INTO employees values (002, 'Dipankar', 'Chatterjee', 2700000, '2015-10-25', 501, '94335200');
INSERT INTO employees values (003, 'Satish', 'Mishra', 1100000, '201-06-20', 502, '800004567');
INSERT INTO employees values (004, 'Anubhab', 'Goel', 2100000, '2014-03-01', 503, '8777454567');
INSERT INTO employees values (005, 'Tripti', 'Sharma', 1900000, '2012-01-03', 505, '9145678990');
INSERT INTO employees values (006, 'Priyanka', 'Ajisa', 700000, '2015-08-12', 505, '9432456711');
INSERT INTO employees values (007, 'Ruby', 'Singh', 1700000, '2012-10-21', 506, '4567890124');
SELECT * FROM employees;

desc employees;

UPDATE employees SET Dept_id = 507 WHERE emp_id = 005;


DELETE FROM employees WHERE emp_id = 006;
select * from employees;


CREATE TABLE salary(emp_id int not null PRIMARY KEY, salary double(10,2));

INSERT INTO salary (emp_id, salary) SELECT emp_id, salary FROM employees;

select * from salary;


CREATE TABLE employees_bak AS SELECT * FROM employees;

show tables;

select * from employees_bak;