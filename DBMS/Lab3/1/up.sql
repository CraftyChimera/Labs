DROP DATABASE banks;
CREATE DATABASE banks;
use banks;

CREATE TABLE Employee(
e_name varchar(255),
street varchar(255),
city varchar(255)
);

CREATE TABLE Bank(
b_name varchar(255),
city varchar(255)
);

CREATE TABLE Works(
e_name varchar(255),
b_name varchar(255),
salary int
);

CREATE TABLE Managers(
e_name varchar(255),
m_name varchar(255)
);

INSERT INTO Employee VALUES
	('John','A street','Chennai'),
	('Alice','A street','Chennai'),
	('Bob','C street','Chennai'),
	('Dennis','D street','Mumbai'),
	('Edritch','E street','Delhi'),
	('Fridge','D street','Mumbai');

INSERT INTO Bank VALUES
	('SBI','Chennai'),
	('ICICI','Delhi'),
	('HDFC','Chennai'),
	('Canara','Mumbai');

INSERT INTO Works VALUES
	('John','SBI',100000),
	('Alice','SBI',10000),
	('Bob','HDFC',3445),
	('Dennis','Canara',64560),
	('Edritch','ICICI',3423),
	('Fridge','Canara',2134);
	
INSERT INTO Managers VALUES
	('Alice','John'),
	('Fridge','Dennis');
