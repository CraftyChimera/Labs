CREATE DATABASE college;

use college;

CREATE TABLE Hostel(
	hno int PRIMARY KEY,
	hname varchar(255),
	gender enum('M','F','O')
);

CREATE TABLE Menu(
	hno int,
	day varchar(255),
	breakfast varchar(255),
	lunch varchar(255),
	dinner varchar(255),
	FOREIGN KEY(hno) references Hostel(hno));

CREATE TABLE Warden(
	wname varchar(255),
	qual varchar(255),
	hno int,
	FOREIGN KEY(hno) references Hostel(hno));

CREATE TABLE Student(
	sid int PRIMARY KEY,
	sname varchar(255),
	gender enum('M','F','O'),
	syear int,
	hno int,
	FOREIGN KEY(hno) references Hostel(hno));

INSERT INTO Hostel Values
	(1,"AmberA",'M'),
	(2,"AmberB",'M'),
	(3,"OpalA",'F'),
	(4,"OpalB",'F'),
	(5,"Beryl",'M');

INSERT INTO Menu Values
	(1,"Monday","Idli","Sambar","Chutney"),
	(2,"Monday","Dosa","Aloo","Sambar"),
	(3,"Monday","Pongal","Sambar","Chutney"),
	(4,"Tuesday","Rosemilk","Coconut","Lemon"),
	(5,"Monday","Idli","Pickle","Chutney");

INSERT INTO Warden Values
	("A","Senior",1),
	("B","Junior",2),
	("C","Senior",3),
	("D","Senior",4),
	("E","Junior",5);

INSERT INTO Student Values
	(101,"AAB",'M',4,1),
	(102,"AAC",'M',3,3),
	(103,"AAD",'F',2,2),
	(104,"AAE",'M',4,4),
	(105,"AAF",'F',3,5),
	(106,"AAG",'M',3,2);
