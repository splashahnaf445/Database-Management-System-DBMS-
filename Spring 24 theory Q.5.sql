#Create the following tables:
#Publishers (id, name, country)
#Magazines (id, title, publisher_id(fk), frequency, price)
#Subscriptions (id, customer_id(fk), magazine_id(fk), start_date, end_date)
#i. Create tables/entities mentioned above (with the primary key & foreign keys).
#ii. Add an attribute 'website' to the Publishers table.
#iii. Remove 'id' from the Publishers table and make 'name' the primary key. Show the necessary steps in SQL

use db1;
create table Publishers(
	id int,
    name varchar(50),
    country varchar(50),
    primary key (id)
);

create table Magazines(
	id int,
    title varchar(50),
    publisher_id int,
    frequency int,
    price decimal(6,2),
    primary key(id),
    foreign key(publisher_id) references Publishers(id)
);

create table Subscriptions(
	id int,
    customer_id int,
    magazine_id int,
    start_date date,
    end_date date,
    primary key(id),
    foreign key(magazine_id) references Magazines(id)
    
);
select * from Publishers;

alter table Publishers add column Website varchar(50);

alter table Magazines drop foreign key publisher_id; #first, remove referencing foreign key, then drop the primary key

alter table Publishers drop id; 
