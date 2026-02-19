-- Name: Tridev Kumar
-- Roll No: 22410
-- Subject: DBMS Lab
-- Assignment: 2
-- Database: Oracle SQL


   create table department (
    dept_id int primary key,
    dept_name varchar(50),
    office_location varchar(100)
);




create table student (
    student_id int primary key,
    name varchar(50),
    date_of_birth date,
    gender char(1),
    contact_no varchar(13),
    dept_id int,
    foreign key (dept_id) references department(dept_id)
);




create table faculty (
    faculty_id int primary key,
    name varchar(50),
    designation varchar(20),
    email varchar(50),
    dept_id int,
    foreign key (dept_id) references department(dept_id)
);




create table course (
    course_id int primary key,
    course_name varchar(30),
    credits int,
    dept_id int,
    faculty_id int,
    foreign key (dept_id) references department(dept_id),
    foreign key (faculty_id) references faculty(faculty_id)
);




create table enrollment (
    enrollment_id int primary key,
    semester varchar(10),
    grade char(2),
    student_id int,
    course_id int,
    foreign key (student_id) references student(student_id),
    foreign key (course_id) references course(course_id)
);

