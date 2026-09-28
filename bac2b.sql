CREATE DATABASE IF NOT EXISTS bca2b;
USE bca2b;

-- Clean start
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS departments;

-- ============================================================
-- 1. DEPARTMENTS
-- ============================================================

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

INSERT INTO departments (department_id, department_name) VALUES
(1, 'Computer Science'),
(2, 'Data Science'),
(3, 'Information Technology'),
(4, 'Commerce'),
(5, 'Business Analytics');

-- ============================================================
-- 2. STUDENTS
-- ============================================================

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    gender VARCHAR(10),
    department_id INT,
    semester INT NOT NULL,
    marks INT NOT NULL,
    attendance DECIMAL(5,2) NOT NULL,
    city VARCHAR(50),
    status VARCHAR(20) NOT NULL,
    email VARCHAR(150) UNIQUE,
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

INSERT INTO students
(student_id, student_name, age, gender, department_id, semester, marks, attendance, city, status, email)
VALUES
(1, 'Aarav', 20, 'Male',   1, 4, 86, 91.50, 'Bengaluru', 'Active', 'aarav@example.com'),
(2, 'Ananya', 21, 'Female',1, 4, 92, 95.00, 'Mysuru',    'Active', 'ananya@example.com'),
(3, 'Rohan',  19, 'Male',   1, 3, 74, 82.50, 'Bengaluru', 'Active', 'rohan@example.com'),
(4, 'Sneha',  20, 'Female',1, 3, 81, 88.00, 'Tumakuru',  'Active', 'sneha@example.com'),

(5, 'Vikram', 21, 'Male',   2, 4, 95, 96.00, 'Bengaluru', 'Active', 'vikram@example.com'),
(6, 'Priya',  20, 'Female',2, 4, 89, 93.50, 'Mysuru',    'Active', 'priya@example.com'),
(7, 'Kiran',  22, 'Male',   2, 5, 78, 79.00, 'Bengaluru', 'Active', 'kiran@example.com'),
(8, 'Meera',  21, 'Female',2, 5, 91, 94.00, 'Hubballi',  'Active', 'meera@example.com'),

(9,  'Rahul',  20, 'Male',   3, 4, 68, 76.50, 'Bengaluru', 'Active', 'rahul@example.com'),
(10, 'Divya',  22, 'Female',3, 4, 84, 89.00, 'Mangaluru', 'Active', 'divya@example.com'),
(11, 'Arjun',  19, 'Male',   3, 3, 73, 81.00, 'Bengaluru', 'Active', 'arjun@example.com'),
(12, 'Pooja',  21, 'Female',3, 5, 88, 92.00, 'Mysuru',    'Active', 'pooja@example.com'),

(13, 'Nikhil', 22, 'Male',   4, 5, 79, 85.50, 'Bengaluru', 'Active', 'nikhil@example.com'),
(14, 'Kavya',  20, 'Female',4, 4, 87, 90.00, 'Mysuru',    'Active', 'kavya@example.com'),
(15, 'Manoj',  21, 'Male',   4, 5, 65, 72.00, 'Tumakuru',  'Inactive', 'manoj@example.com'),
(16, 'Isha',   20, 'Female',4, 4, 93, 97.00, 'Bengaluru', 'Active', 'isha@example.com'),

(17, 'Aditya', 21, 'Male',   5, 4, 90, 94.50, 'Bengaluru', 'Active', 'aditya@example.com'),
(18, 'Neha',   22, 'Female',5, 5, 83, 87.50, 'Mysuru',    'Active', 'neha@example.com'),
(19, 'Sanjay', 20, 'Male',   5, 3, 71, 80.00, 'Bengaluru', 'Active', 'sanjay@example.com'),
(20, 'Riya',   21, 'Female',5, 4, 96, 98.00, 'Mangaluru', 'Active', 'riya@example.com');

-- ============================================================
-- 3. OPTIONAL TABLE: SUBJECT MARKS
-- Useful for more advanced multi-step CTE practice.
-- ============================================================

CREATE TABLE subject_marks (
    mark_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    subject VARCHAR(50) NOT NULL,
    marks INT NOT NULL,
    FOREIGN KEY (student_id)
        REFERENCES students(student_id)
);

INSERT INTO subject_marks
(mark_id, student_id, subject, marks)
VALUES
(1,  1, 'SQL',       88),
(2,  1, 'Python',    84),
(3,  1, 'Statistics',82),

(4,  2, 'SQL',       95),
(5,  2, 'Python',    91),
(6,  2, 'Statistics',90),

(7,  3, 'SQL',       76),
(8,  3, 'Python',    72),
(9,  3, 'Statistics',74),

(10, 4, 'SQL',       83),
(11, 4, 'Python',    79),
(12, 4, 'Statistics',81),

(13, 5, 'SQL',       97),
(14, 5, 'Python',    94),
(15, 5, 'Statistics',93),

(16, 6, 'SQL',       91),
(17, 6, 'Python',    88),
(18, 6, 'Statistics',89),

(19, 7, 'SQL',       80),
(20, 7, 'Python',    75),
(21, 7, 'Statistics',79),

(22, 8, 'SQL',       93),
(23, 8, 'Python',    90),
(24, 8, 'Statistics',91),

(25, 9, 'SQL',       70),
(26, 9, 'Python',    66),
(27, 9, 'Statistics',68),

(28, 10, 'SQL',      86),
(29, 10, 'Python',   82),
(30, 10, 'Statistics',84),

(31, 11, 'SQL',      75),
(32, 11, 'Python',   71),
(33, 11, 'Statistics',73),

(34, 12, 'SQL',      90),
(35, 12, 'Python',   87),
(36, 12, 'Statistics',88),

(37, 13, 'SQL',      81),
(38, 13, 'Python',   77),
(39, 13, 'Statistics',79),

(40, 14, 'SQL',      89),
(41, 14, 'Python',   85),
(42, 14, 'Statistics',87),

(43, 15, 'SQL',      67),
(44, 15, 'Python',   63),
(45, 15, 'Statistics',65),

(46, 16, 'SQL',      94),
(47, 16, 'Python',   92),
(48, 16, 'Statistics',93),

(49, 17, 'SQL',      92),
(50, 17, 'Python',   89),
(51, 17, 'Statistics',90),

(52, 18, 'SQL',      85),
(53, 18, 'Python',   81),
(54, 18, 'Statistics',83),

(55, 19, 'SQL',      73),
(56, 19, 'Python',   69),
(57, 19, 'Statistics',71),

(58, 20, 'SQL',      98),
(59, 20, 'Python',   95),
(60, 20, 'Statistics',96);

-- ============================================================
-- 4. QUICK CHECKS
-- These are NOT CTE queries.
-- ============================================================

SELECT * FROM departments;
SELECT * FROM students;
SELECT * FROM subject_marks;


