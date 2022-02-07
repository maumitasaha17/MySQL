# To create Database
create DATABASE library;

#To use the database
use library;

# To show my database
show databases;

# To drop the particular database
drop database library;

# To create a table
create table readers
	(
		reader_id varchar(6),
        fname varchar(30),
        mname varchar(30),
        lname varchar(30),
        city varchar(15),
        mobileno varchar(10),
        occupation varchar(10),
        dob DATE,
        constraint readers_pk primary key(reader_id)
	);
    
    insert into readers value('001', 'Ram', 'S', 'Chandra','Delhi', '8876895434', 'HR', '1996-01-10');
    insert into readers value('002', 'Devi', 'K', 'Maurya','Noida', '9823974098', 'IT', '1991-05-06');
    insert into readers value('003', 'Radhika', null, 'Dutta','Bangalore', '9848490876', 'Developer', '1999-12-20');
    insert into readers value('004', 'Deep', null, 'Das','Kerla', '9835121111', 'Publisher', '2000-06-08');
    insert into readers value('005', 'Manav', 'Kumar', 'Nair','Chennai', '9840687007', 'IT', '1993-10-24');
    insert into readers value('006', 'Brishti', null, 'Mondal','Gujarat', '9896094868', 'HR', '1990-10-12');
    
    # To fetch data from the database
    select * from readers;
    
    
    # To create new table
    create table book
		(
			bid varchar(6),
            bname varchar(40),
			bdomain varchar(30),
			constraint book_bid_pk primary key(bid)
        
        );
        
	
    insert into book value('B0001', 'Charlie and the Chocolate Factory', 'Story');
	insert into book value('B0002', 'The Cat in the Hat', 'Story');
	insert into book value('B0003', 'Little Red Riding Hood', 'Story');
		
	# To fetch data from the database
    select * from book;
    
    # To use primary key and foreign key
    Create table active_readers
		(
			account_id varchar(6),
            reader_id varchar(6),
            bid varchar(6),
            atype varchar(10),
			astatus varchar(10),
			constraint activereaders_acnumber_pk primary key(account_id),
            constraint account_readerid_fk foreign key(reader_id) references readers(reader_id),
			constraint account_bid_fk foreign key(bid)references book(bid)
        );

insert into active_readers value('A0001', '001', 'B0001', 'Premium', 'Active');
insert into active_readers value('A0002', '002', 'B0002', 'Regular', 'Active');
insert into active_readers value('A0003', '003', 'B0003', 'Premium', 'Deactivated');
insert into active_readers value('A0004', '004', 'B0004', 'Premium', 'Active');

select * from active_readers;