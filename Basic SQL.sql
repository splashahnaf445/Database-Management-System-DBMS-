create database db1;
use db1;
show tables;

create table instructor2410540(
id int,
name varchar(50),
deptname varchar(50),
salary numeric,
primary key(id)

);

create table course2410540(
courseid varchar(50),
title varchar(50),
dept_name varchar(50),
credits int,
primary key(courseid)

);

insert into instructor2410540 values (10101,'Srinivasan','Comp. Sci.',65000.50);
insert into instructor2410540 values (12121,'Wasif','Finance',90000);
insert into instructor2410540 values (15151,'Mozart','Music',40000);
insert into instructor2410540 values (222222,'Einstein','Physics',95000);
insert into instructor2410540 values (32343,'El Said','History',60000);
insert into instructor2410540 values (33456,'Goblin','Physics',87000.50);
insert into instructor2410540 values (45565,'Katz','Comp. Sci.',75000);
insert into instructor2410540 values (58583,'Califieri','History',62000);

#select * from instructor2410540;

insert into course2410540 values ('BIO-101','Intro. to Biology','Biology',4);
insert into course2410540 values ('BIO-301','Genetics','Biology',4);
insert into course2410540 values ('BIO-399','Computational Biology','Biology',3);
insert into course2410540 values ('CS-101','Intro. to Computer Science','Comp. Sci.',4);
insert into course2410540 values ('CS-190','Game Design','Comp. Sci.',4);
insert into course2410540 values ('CS-319','Image Processing','Comp. Sci.',3);
insert into course2410540 values ('CS-347','Database System Concepts','Comp. Sci.',3);
insert into course2410540 values ('EE-181','Intro. to Digital Systems','Elec. Eng.',3);
insert into course2410540 values ('FIN-201','Investment Banking','Finance',3);

select * from course2410540;
# QUERIES:
#i. Show the names of all instructors

select name from instructor2410540;
#ii. Show the course ID and title of all courses.
select courseid,title from course2410540;

#iii. Find the name and department of the instructor whose ID is 22222.
select name,deptname from instructor2410540 where id=222222;

#iv. Find the titles and credits of courses offered by the 'Comp. Sci.' department.
select title,credits from course2410540 where dept_name like 'Comp. Sci.';

#Find the names and departments of instructors who have a salary greater than 70,000
select name,deptname from instructor2410540 where salary>70000;

#vi. Find the titles of courses that have credits not less than 4
select title from course2410540 where credits>=4;

#vii. Find the names and departments of instructors who have a salary between 80,000 and 100,000
select name,deptname from instructor2410540 where salary>=80000 AND salary<=100000;

#viii. Find the titles and credits of courses not offered by the 'Comp. Sci.' department
select title, credits from course2410540 where dept_name NOT LIKE 'Comp. Sci.';

#ix. Display all records from the instructor table.
select * from instructor2410540;

#x. Find all courses (show all columns) that are offered by the 'Biology' department and have credits not equal to 4
select * from course2410540 where dept_name LIKE 'Biology' AND credits !=4;

#xi. Show unique department names only from the course table.
select DISTINCT dept_name from course2410540;
