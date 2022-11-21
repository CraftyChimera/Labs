DROP DATABASE University;
CREATE DATABASE University;
USE University;


CREATE TABLE Employee (
	fname VARCHAR(50) NOT NULL ,
	mint CHAR(1),
	lname VARCHAR(50) NOT NULL,
	ssn VARCHAR(10) NOT NULL,
	bdate DATE NOT NULL,
	address VARCHAR(100),
	sex ENUM ('MALE','FEMALE','NOT SAY'),
	salary INT,
	superssn VARCHAR(10),
	dno INT,
	PRIMARY KEY(ssn)
);

CREATE TABLE Department (
	dname VARCHAR(50) NOT NULL ,
	dno INT,
	mgrssn VARCHAR(10) NOT NULL,
	mgrstartdate DATE NOT NULL ,
	dlocation VARCHAR(100) NOT NULL,
	PRIMARY KEY(dno)
);


CREATE TABLE Project (
	pname  VARCHAR(100) NOT NULL,
	pno INT,
	plocation VARCHAR(100),
	dno INT NOT NULL,
	PRIMARY KEY(pno),
	FOREIGN KEY(dno) REFERENCES Department(dno)
);

CREATE TABLE Workson (
	essn VARCHAR(10) NOT NULL,
	pno INT,
	hoursperweek INT,
	FOREIGN KEY(pno) REFERENCES Project(pno),
	FOREIGN KEY(essn) REFERENCES Employee(ssn)
);

CREATE TABLE Dependent (
	essn VARCHAR(10) NOT NULL,
	depessn VARCHAR(10) NOT NULL,
	sex ENUM ('MALE','FEMALE','NOT SAY'),
	bdate DATE NOT NULL,
	relationship VARCHAR(10),
	FOREIGN KEY(essn) REFERENCES Employee(ssn),
	FOREIGN KEY(depessn) REFERENCES Employee(ssn)
);

INSERT INTO Department VALUES
('Research',1,'8237688072','2012-07-08','Stafford'),
('Advertising',2,'1818717339','2010-01-10','GreenHall'),
('HR',3,'1449455628','2011-01-10','RedVine');

INSERT INTO Project VALUES
('Better Productivity',1,'Stafford',1),
('Eco-friendly image',2,'GreenHall',2),
('LGBTQ+ Month',3,'Stafford',3);

INSERT INTO Employee VALUES
('Tamas',NULL, 'Whitley','1567347415','1998-02-19','97 Elka Terrace','MALE',60418,'8237688072',1),
('Frankie','M','Haworth','5799966668','1995-10-13','542 Oxford Plaza','MALE',14954,'1567347415',2),
('Dolf','D','Marlon','8995782709','1997-04-02','2195 Shelley Park','FEMALE',58926,'1449455628',3),
('Frankie','T','Skett','8702641882','2022-08-27','05105 Brickson Park Alley','MALE',126772,'1818717339',2),
('Jedediah',NULL,'Yakobowitch','9024136483','2022-03-24','879 Oak Valley Plaza','MALE',183951,'1449455628',3);

INSERT INTO Workson VALUES
('1567347415',1,70),
('5799966668',2,50),
('8702641882',2,80),
('8995782709',3,75),
('9024136483',3,95);

INSERT INTO Dependent VALUES
('5799966668','8702641882','MALE','1998-03-19','Child'),
('8995782709','9024136483','FEMALE','1995-11-13','GrandChild');
