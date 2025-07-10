drop database MySQL_database;

Create database MySQL_database;
Show databases;
use MySQL_database;

Create table students (
student_id int primary key, 
first_name varchar(12) NOT NULL, 
last_name varchar(12) NOT NULL,
gender enum('M','F') NOT NULL,
date_of_birth int NOT NULL, 
email varchar(30) NOT NULL, 
program varchar(17) NOT NULL,
year_of_study int);
 
 Create table courses (
 course_id int primary key,
 course_name varchar(45) NOT NULL,
 credit_units int NOT NULL,
 instructor varchar(30));
 
 Create table registrations (
 registration_id int primary key,
 student_id int,
 course_id int,
 academic_year int NOT NULL,
 semester enum('1','2'),
 FOREIGN KEY (student_id) REFERENCES students(student_id),
 FOREIGN KEY (course_id) REFERENCES courses(course_id)
 );

 
 Create table grades (
 grade_id int primary key,
 registration_id int,
 marks int NOT NULL,
 grade char(1),
 FOREIGN KEY (registration_id) REFERENCES registrations(registration_id)
 );
 
 Insert into students Values(01, "Morgan", "Otiyema", 'M', 20/04/2004, "otiyemorgan@gmail.com", "BSIT", 2025);
 Insert into students Values(02, "Silver", "Mwaka", 'M', 18/06/2004, "mwakasilver212@gmail.com", "BSIT", 2025);
 Insert into students Values(03, "Michelle", "Owomugisha", 'F', 19/03/2005, "michelleowumu@gmail.com", "BSIT", 2025);
 Insert into students Values(04, "Daisy", "Amutuhaire", 'F', 02/02/2005, "daisyamutuhaire@gmail.com", "BSIT", 2025);
 Insert into students Values(05, "Ricky", "Mudebo", 'M', 10/04/2005, "mudeboricky@gmail.com", "BSIT", 2025);
 Insert into students Values(06, "Joshua", " Emoit", 'M', 04/01/2003, "joshuaemotic801@gmail.com", "BSIT", 2025);
 Insert into students Values(07, "Praise", "Ainembabazi", 'F', 30/03/2005, "mbabazipraise@gmail.com", "BSIT", 2025);
 Insert into students Values(08, "Perry", "Ndharu", 'F', 13/11/2004, "ndharuperry@gmail.com", "BSIT", 2025);
 Insert into students Values(09, "Isaac", "Otai", 'M', 14/12/2004, "otaiisaac@gmail.com", "BSIT", 2025);
 Insert into students Values(10, "Jonathan", "Okwai", 'M', 27/04/2003, "okawaijona727@gmail.com", "BSIT", 2025);
 
 Insert into courses (course_id, course_name, credit_units, instructor) Values
 (1,"INFORMATION SYTEMS", 1, "Mr.Tonny"),
 (2,"FUNDAMENTALS OF COMPUTING", 1, "Mr.Kenneth"),
 (3,"STRUCTURED PROGRAMMING", 1, "Mr.Musaazi"),
 (4,"ESSENTIAL HARDWARE AND SOFTWARE CONCEPTS", 1, "Mr.Christopher"),
 (5,"WRITING AND STUDY SKILLS", 2, "Mrs.Evangelina"),
 (6,"UNDERSTANDING THE OLD TESTAMENT", 2, "Mr.Irumba");
 
 Insert into registrations (registration_id, student_id, course_id, academic_year, semester) Values
 (1, 01, 1, 2025, 1),
 (2, 01, 6, 2025, 1),
 (3, 02, 1, 2025, 1),
 (4, 02, 3, 2025, 1),
 (5, 03, 5, 2025, 1),
 (6, 03, 2, 2025, 1),
 (7, 04, 4, 2025, 1),
 (8, 04, 6, 2025, 1),
 (9, 05, 3, 2025, 1),
 (10, 05, 5, 2025, 1),
 (11, 06, 6, 2025, 1),
 (12, 06, 4, 2025, 1),
 (13, 07, 5, 2025, 1),
 (14, 07, 2, 2025, 1),
 (15, 08, 3, 2025, 1),
 (16, 08, 4, 2025, 1),
 (17, 09, 1, 2025, 1),
 (18, 09, 1, 2025, 1),
 (19, 10, 2, 2025, 1),
 (20, 10, 2, 2025, 1);
 

 Insert into grades (grade_id, registration_id, marks, grade) Values
 (1, 1, 88, "B"),
 (2, 2, 79, "C"),
 (3, 3, 97, "A"),
 (4, 4, 90, "A"),
 (5, 5, 77, "C"),
 (6, 6, 85, "B"),
 (7, 7, 84, "B"),
 (8, 8, 67, "D"),
 (9, 9, 45, "F"),
 (10, 10, 55, "E"),
 (11, 11, 39, "F"),
 (12, 12, 50, "E"),
 (13, 13, 78, "C"),
 (14, 14, 81, "B"),
 (15, 15, 94, "A"),
 (16, 16, 87, "B"),
 (17, 17, 45, "F"),
 (18, 18, 31, "F"),
 (19,19, 98, "A"),
 (20,20, 77, "C");
 
select students. *from students
join registrations on students.student_id = registrations.student_id
group by students.student_id
having count(registrations.course_id) >2;

select students.first_name, students.last_name, courses.course_name, grades.grade
from students
join registrations on students.student_id = registrations.student_id
join courses on courses.course_id = registrations.course_id
join grades on grades.registration_id = registrations.registration_id;


select courses.course_name, avg(marks) as averagemark
from courses 
join registrations on registrations.course_id = courses.course_id
join grades on grades.registration_id = registrations.registration_id
group by courses.course_id;

select students.first_name, last_name, courses.course_name, grades.marks
from students
join registrations on students.student_id = registrations.student_id
join courses on registrations.course_id = courses.course_id
join grades on registrations.registration_id = grades.registration_id
where grades.marks < 50;

create view student_performance as
select students.student_id, students.first_name, students.last_name, registrations.academic_year, registrations.semester, courses.course_name, grades.marks, grades.grade
from students
join registrations on students.student_id = registrations.student_id
join courses on registrations.course_id = courses.course_id
join grades on registrations.registration_id = grades.registration_id;

select courses.course_name, count(registrations.student_id) as total_enrollments
from courses
join registrations on courses.course_id = registrations.course_id
group by courses.course_id;

 

 
 
 


 
 
 
 
 
 