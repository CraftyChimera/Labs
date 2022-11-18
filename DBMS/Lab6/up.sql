drop database workplace;
create database workplace;
use workplace;

create table Employee(
    emp_no int,
    emp_name varchar(255),
    sex enum('M','F','O'),
    salary int,
    addr varchar(255),
    dept_no int,
    primary key(emp_no)
);

create table Department(
    dept_no int,
    dept_name varchar(255),
    addr varchar(100),
    primary key(dept_no)
);

INSERT INTO Employee VALUES
(1, 'John', 'M', 100000, 'ad', 3),
(2, 'Manny', 'F', 80000, 'bf', 1),
(3, 'Ashish', 'F', 75000, 'cc', 2),
(4, 'Rohan', 'F', 50000, 'de', 4),
(5, 'Xina', 'M', 45000, 'cc', 2),
(6, 'Wok', 'M', 40000, 'de', 4);

INSERT INTO Department VALUES
(1, 'frontend', 'ad'),
(2, 'data science', 'cc'),
(3, 'ml', 'bf'),
(4, 'backend', 'de');
