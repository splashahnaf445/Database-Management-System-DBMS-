use varsity2;

select * from course;
select * from student;
select * from teaches;
select * from department;
select * from faculty;


-- List all courses of CSE department
select * from course C join department D on C.dept_id = D.dept_id where dept_name='Computer Science';

-- List all students of CSE dept
select name,year from student s join department d on s.major_id = d.dept_id where dept_name='Computer Science';

-- q1 List all courses of fall 2024 along with the faculty who teach them and the department they belong to
SELECT c.course_name, f.name, d.dept_name
FROM teaches t
JOIN course c ON t.course_id = c.course_id
JOIN faculty f ON t.faculty_id = f.faculty_id
JOIN department d ON c.dept_id = d.dept_id
WHERE t.semester = 'Fall' AND t.year = 2024;

-- Get 2nd year students and their department along with the courses offered by their department
select s.name, d.dept_name,c.course_name
from student s join department d on s.major_id = d.dept_id
join course c on c.dept_id = d.dept_id
where year=2;

-- Get 2nd year students along with the departmental courses they can take in fall semester
SELECT 
    s.name AS student_name,
    c.course_name,
    d.dept_name
FROM 
    student s
jOIN 
department d ON s.major_id = d.dept_id
JOIN 
course c ON d.dept_id = c.dept_id
WHERE 
s.year = 2;

-- Get 2nd year students of all departments that offer 3 credit courses
select s.name as student_name,
d.dept_name, c.course_name,c.credits
from student s join department d on s.major_id = d.dept_id
join course c on c.dept_id = d.dept_id
where s.year=2 and c.credits=3;

-- Get faculty list who teaches 3+ credit courses
select f.name as faculty_name,
c.course_name,c.credits
from teaches t join faculty f on t.faculty_id = f.faculty_id
join course c on t.course_id = c.course_id
where c.credits>3;

-- Show how many students have taken each department's courses
select d.dept_name, count(distinct t.student_id) as students_enrolled
from takes t join student s on s.student_id = t.student_id
join department d on t.department_id = d.dept_id
group by d.dept_name;

-- Count how many different courses each faculty member teaches
select f.name as faculty_name, count(t.course_id)
from teaches t join faculty f on t.faculty_id = f.faculty_id
group by f.name;

-- List departments that offer more than 1 course
select d.dept_name
from department d join course c on c.dept_id = d.dept_id
group by d.dept_name having count(course_id)>1;

-- Show faculty who are teaching more than 1 course in Fall 2024
select f.name as faculty_name
from teaches t join faculty f on t.faculty_id = f.faculty_id
where t.semester = 'Fall' and t.year = 2024
group by f.name having count(t.course_id)>1;

-- Find departments where the average number of course credits is greater than 3
select d.dept_name, avg(c.credits) as average_credits
from course c join department d on c.dept_id = d.dept_id
group by d.dept_name having avg(c.credits)>3;

-- Find departments whose students have an average CGPA greater than 3.0 (Not possible here with the data! grade should be numreic)
select d.dept_name, avg(t.grade) as average_CGPA
from takes t join department d on t.department_id = d.dept_id
group by d.dept_name
having avg(t.grade)>3;

-- Show faculty who teach only courses whose avg credit taught is above the average credit
select f.name as faculty_name, avg(c.credits) as avg_credits
from teaches t join faculty f on t.faculty_id = f.faculty_id
join course c on t.course_id = c.course_id
group by f.name
having avg(c.credits)>(select avg(credits) from course);


-- ******Show departments that offer more courses than the average number of courses per department.

SELECT d.dept_name, COUNT(c.course_id) AS total_courses
FROM department d
JOIN course c ON d.dept_id = c.dept_id
GROUP BY d.dept_name
HAVING COUNT(c.course_id) > (
    SELECT AVG(course_count)
    FROM (
        SELECT COUNT(course_id) AS course_count
        FROM course
        GROUP BY dept_id
    ) AS dept_course_counts
);

### Limit and Offset : Limit shows how many tuples to display , Offset sets the starting position
    (e.g : show data from 2 to 4  : LIMIT 3 OFFSET 1)
    

# show last 5 students details
select * from student
order by student_id desc
limit 5;

# show details of faculties who are from department 3 to 8 with their dept name
select * 
from faculty f
join department d on f.dept_id=d.dept_id
limit 6 offset 2;
