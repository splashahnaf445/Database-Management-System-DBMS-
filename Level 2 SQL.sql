use db1;

select * from instructor2410540;
select * from course2410540;

select distinct O.name,O.deptname, O.salary from instructor2410540 as O,instructor2410540 as C where O.salary>C.salary and C.deptname='Comp. Sci.';

#Example:  Find the names of all instructors with salary between $80,000 and $100,000
select name,salary from instructor2410540 where salary between 80000 and 100000;

#Find instructors that in CSE dept or in Physics dept
select name,deptname from instructor2410540 where deptname='Comp. Sci.' union
select name,deptname from instructor2410540 where deptname='Physics';

#Find instructors who have higher salary than 65k but not from CSE dept
select name,deptname,salary from instructor2410540 where salary>65000 and deptname!='Comp. Sci.';

#Find the average salary of instructors in the physics department
select avg(salary) as avg_salary from instructor2410540 where deptname='Physics';

#Find the total number of instructors in the table
select count(id) from instructor2410540;

#Find the sorted highest average salary of instructors in each department
select avg(salary) as avg_salary, deptname from instructor2410540 group by deptname order by avg_salary desc;

#Find the sorted highest average salary of instructors in each department having avg salary higher than 65k
select avg(salary) as avg_salary,deptname from instructor2410540 group by deptname having avg(salary)>65000 order by avg_salary desc;

#concept of SubQueries
#find the salaries of instructors whose avg salary is higher than avg salary of instructors from CSE department
#so have to find avg salary of CSE dept: 
select avg(salary) from instructor2410540 where deptname='Comp. Sci.';
select avg(salary) as average_salary, deptname from instructor2410540 where salary>(select avg(salary) from instructor2410540 where deptname='Comp. Sci.') group by deptname;


