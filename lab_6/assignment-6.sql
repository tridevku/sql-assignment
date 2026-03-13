-- DB Lab-6
-- Topic: Data Aggregation using GROUP BY and HAVING
-- name: Tridev Kumar

---

## -- PART A: BASIC AGGREGATE QUERIES

-- Q1: Display total number of students
SELECT COUNT(*) AS TOTAL_STUDENTS
FROM STUDENT;

-- Q2: Display total number of faculty members
SELECT COUNT(*) AS TOTAL_FACULTY
FROM FACULTY;

-- Q3: Display total number of courses
SELECT COUNT(*) AS TOTAL_COURSES
FROM COURSE;

-- Q4: Display maximum credits among courses
SELECT MAX(CREDITS) AS MAX_CREDITS
FROM COURSE;

-- Q5: Display minimum credits among courses
SELECT MIN(CREDITS) AS MIN_CREDITS
FROM COURSE;

---

## -- PART B: GROUP BY ON SINGLE TABLES

-- Q6: Number of students in each department
SELECT DEPT_ID, COUNT(*) AS NUMBER_OF_STUDENTS
FROM STUDENT
GROUP BY DEPT_ID;

-- Q7: Number of faculty members in each department
SELECT DEPT_ID, COUNT(*) AS NUMBER_OF_FACULTY
FROM FACULTY
GROUP BY DEPT_ID;

-- Q8: Number of courses offered by each department
SELECT DEPT_ID, COUNT(*) AS NUMBER_OF_COURSES
FROM COURSE
GROUP BY DEPT_ID;

-- Q9: Number of enrollments in each semester
SELECT SEMESTER, COUNT(*) AS TOTAL_ENROLLMENTS
FROM ENROLLMENT
GROUP BY SEMESTER;

-- Q10: Number of students for each grade
SELECT GRADE, COUNT(*) AS TOTAL_STUDENTS
FROM ENROLLMENT
GROUP BY GRADE;

---

## -- PART C: GROUP BY WITH HAVING

-- Q11: Departments having more than 3 students
SELECT DEPT_ID, COUNT(*) AS TOTAL_STUDENTS
FROM STUDENT
GROUP BY DEPT_ID
HAVING COUNT(*) > 3;

-- Q12: Semesters having more than 2 enrollments
SELECT SEMESTER, COUNT(*) AS TOTAL_ENROLLMENTS
FROM ENROLLMENT
GROUP BY SEMESTER
HAVING COUNT(*) > 2;

-- Q13: Grades assigned to more than one student
SELECT GRADE, COUNT(*) AS TOTAL_STUDENTS
FROM ENROLLMENT
GROUP BY GRADE
HAVING COUNT(*) > 1;

-- Q14: Departments having more than one course
SELECT DEPT_ID, COUNT(*) AS TOTAL_COURSES
FROM COURSE
GROUP BY DEPT_ID
HAVING COUNT(*) > 1;

---

## -- PART D: AGGREGATION WITH JOIN

-- Q15: Number of students enrolled in each course
SELECT COURSE_ID, COUNT(STUDENT_ID) AS ENROLLED_STUDENTS
FROM ENROLLMENT
GROUP BY COURSE_ID;

-- Q16: Course name and number of students enrolled
SELECT C.COURSE_NAME, COUNT(E.STUDENT_ID) AS ENROLLED_STUDENTS
FROM COURSE C
JOIN ENROLLMENT E
ON C.COURSE_ID = E.COURSE_ID
GROUP BY C.COURSE_NAME;

-- Q17: Department and number of students
SELECT DEPT_ID, COUNT(STUDENT_ID) AS TOTAL_STUDENTS
FROM STUDENT
GROUP BY DEPT_ID;

-- Q18: Faculty name and number of courses taught
SELECT F.NAME, COUNT(C.COURSE_ID) AS COURSES_TAUGHT
FROM FACULTY F
JOIN COURSE C
ON F.FACULTY_ID = C.FACULTY_ID
GROUP BY F.NAME;

---

## -- PART E: ANALYTICAL QUERIES

-- Q19: Course name and maximum grade obtained
SELECT C.COURSE_NAME, MAX(E.GRADE) AS MAX_GRADE
FROM COURSE C
JOIN ENROLLMENT E
ON C.COURSE_ID = E.COURSE_ID
GROUP BY C.COURSE_NAME;

-- Q20: Department and total number of courses
SELECT DEPT_ID, COUNT(COURSE_ID) AS TOTAL_COURSES
FROM COURSE
GROUP BY DEPT_ID;

-- Q21: Semester and total number of students
SELECT SEMESTER, COUNT(STUDENT_ID) AS TOTAL_STUDENTS
FROM ENROLLMENT
GROUP BY SEMESTER;

-- Q22: Courses having more than 2 students enrolled
SELECT COURSE_ID, COUNT(STUDENT_ID) AS TOTAL_STUDENTS
FROM ENROLLMENT
GROUP BY COURSE_ID
HAVING COUNT(STUDENT_ID) > 2;
