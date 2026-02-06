-- Name: Tridev Kumar
-- Roll No: 22410
-- Subject: DBMS Lab
-- Assignment: 2
-- Database: Oracle SQL

-- Department Table
CREATE TABLE Department (
    DeptID NUMBER PRIMARY KEY,
    DeptName VARCHAR2(50),
    OfficeLocation VARCHAR2(50)
);

-- Student Table
CREATE TABLE Student (
    StudentID NUMBER PRIMARY KEY,
    Name VARCHAR2(50),
    DOB DATE,
    Gender VARCHAR2(10),
    Contact VARCHAR2(15),
    DeptID NUMBER,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

-- Faculty Table
CREATE TABLE Faculty (
    FacultyID NUMBER PRIMARY KEY,
    Name VARCHAR2(50),
    Designation VARCHAR2(30),
    Email VARCHAR2(50),
    DeptID NUMBER,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

-- Course Table
CREATE TABLE Course (
    CourseID NUMBER PRIMARY KEY,
    CourseName VARCHAR2(50),
    Credits NUMBER,
    DeptID NUMBER,
    FacultyID NUMBER,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID),
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
);

-- Enrollment Table (M:N relationship)
CREATE TABLE Enrollment (
    EnrollmentID NUMBER PRIMARY KEY,
    StudentID NUMBER,
    CourseID NUMBER,
    Semester NUMBER,
    Grade VARCHAR2(5),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);
