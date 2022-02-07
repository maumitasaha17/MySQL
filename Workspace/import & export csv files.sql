# STEPS
# Create a database trail.
# use the database trail.
# Refresh the schemas
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