

-- 3. Create Student table
CREATE TABLE Student (
    RollNo NUMBER PRIMARY KEY,
    Name VARCHAR2(50),
    Dept VARCHAR2(20),
    Age NUMBER,
    Phone VARCHAR2(15)
);

-- 4. Create Course table
CREATE TABLE Course (
    CourseID NUMBER PRIMARY KEY,
    CourseName VARCHAR2(50),
    Credits NUMBER
);

-- 5. Add City column
ALTER TABLE Student ADD City VARCHAR2(30);

-- 6. Add Semester column
ALTER TABLE Student ADD Semester NUMBER;

-- 7. Rename Phone to MobileNo (Oracle-safe method)
ALTER TABLE Student ADD MobileNo VARCHAR2(15);
UPDATE Student SET MobileNo = Phone;
ALTER TABLE Student DROP COLUMN Phone;

-- 8. Drop Course table
DROP TABLE Course;
-- 9. Insert 5 records
INSERT INTO Student VALUES
(101, 'Rahul', 'CSE', 20, 'Gaya', 3, '9876543210');

INSERT INTO Student VALUES
(102, 'Amit', 'CSE', 21, 'Patna', 3, '9876543211');

INSERT INTO Student VALUES
(103, 'Neha', 'IT', 19, 'Delhi', 2, '9876543212');

INSERT INTO Student VALUES
(104, 'Priya', 'ECE', 22, 'Kolkata', 4, '9876543213');

INSERT INTO Student VALUES
(105, 'Rohit', 'ME', 23, 'Ranchi', 5, '9876543214');

-- 10. Display all records
SELECT * FROM Student;

-- 11. Display RollNo and Name only
SELECT RollNo, Name FROM Student;

-- 12. Display students from CSE department
SELECT * FROM Student WHERE Dept = 'CSE';

-- 13. Display students whose age > 20
SELECT * FROM Student WHERE Age > 20;

-- 14. Update department of RollNo = 101 to ECE
UPDATE Student SET Dept = 'ECE' WHERE RollNo = 101;

-- 15. Update city of Rahul to Patna
UPDATE Student SET City = 'Patna' WHERE Name = 'Rahul';

-- 16. Increase age of all students by 1
UPDATE Student SET Age = Age + 1;

-- 17. Delete record of RollNo = 105
DELETE FROM Student WHERE RollNo = 105;

-- 18. Delete all records (table remains)
DELETE FROM Student;

COMMIT;
