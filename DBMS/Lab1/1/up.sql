CREATE DATABASE university;
use university;

CREATE TABLE Department(dept_id int,dept_name varchar(255));
CREATE TABLE Student(rollno varchar(9),name varchar(255),gender enum('M','F','O'),mark1 int,mark2 int,mark3 int,total int,average double,dept_id int);
CREATE TABLE Staff(staff_id int,name varchar(255),designation varchar(255),qualification varchar(255),dept_id int);
CREATE TABLE Tutor(rollno varchar(9),staff_id int);

INSERT INTO Department VALUES(1,'cse');
INSERT INTO Department VALUES(2,'ece');
INSERT INTO Department VALUES(3,'ice');
INSERT INTO Department VALUES(4,'eee');

INSERT INTO Student VALUES('106120054','John','M',70,70,60,NULL,NULL,1);
INSERT INTO Student VALUES('106120074','Ann','F',80,70,90,NULL,NULL,3);
INSERT INTO Student VALUES('106120089','Melo','M',60,40,30,NULL,NULL,4);
INSERT INTO Student VALUES('106120095','Aap','M',90,90,100,NULL,NULL,2);
INSERT INTO Student VALUES('106120001','Meno','F',20,30,50,NULL,NULL,3);
INSERT INTO Student VALUES('106120005','Acks','M',40,40,60,NULL,NULL,4);
INSERT INTO Student VALUES('106120007','Bob','F',70,60,50,NULL,NULL,1);
INSERT INTO Student VALUES('106120009','Loko','M',100,90,100,NULL,NULL,1);
INSERT INTO Student VALUES('106120011','Skan','M',100,100,100,NULL,NULL,2);
INSERT INTO Student VALUES('106120015','Don','M',99,99,100,NULL,NULL,1);

INSERT INTO Staff VALUES(1,'Charlie','Asst. Prof','M.Tech',1);
INSERT INTO Staff VALUES(2,'Danny','Prof','PhD',1);
INSERT INTO Staff VALUES(3,'Elizabeth','Asst. Prof','M.Tech',3);
INSERT INTO Staff VALUES(4,'Fan','Associate Prof','M.Tech',4);
INSERT INTO Staff VALUES(5,'Gerald','Asst. Prof','M.Tech',1);
INSERT INTO Staff VALUES(6,'Jackie','Associate Prof','M.Tech',1);

INSERT INTO Tutor VALUES('106120054',1);
INSERT INTO Tutor VALUES('106120074',3);
INSERT INTO Tutor VALUES('106120015',5);
INSERT INTO Tutor VALUES('106120007',6);
INSERT INTO Tutor VALUES('106120005',4);
