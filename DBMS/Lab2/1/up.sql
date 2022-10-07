CREATE DATABASE elections;

use elections;

CREATE TABLE Party(
	pid int,
	pname varchar(255) PRIMARY KEY,
	leader varchar(255)
);

CREATE TABLE Constituency(
	cid int,
	cname varchar(255) PRIMARY KEY
);

CREATE TABLE Contestant(
	ctid int PRIMARY KEY,
	ctname varchar(255),
	ctaddr varchar(255)
);

CREATE TABLE Election(
	ctid int,
	number_of_votes int,
	pname varchar(255),
	cname varchar(255),
	FOREIGN KEY(ctid) references Contestant(ctid),
	FOREIGN KEY(pname) references Party(pname),
	FOREIGN KEY(cname) references Constituency(cname),
	CHECK (number_of_votes >= 0)
);

INSERT INTO Party Values
	(1,"A","Ad"),
	(2,"B","Be"),
	(3,"C","Cf"),
	(4,"D","Dg"),
	(5,"E","Eh");

INSERT INTO Constituency Values
	(1,"X"),
	(2,"Y"),
	(3,"Z"),
	(4,"W");

INSERT INTO Contestant Values
	(1,"Fs","Ga"),
	(2,"Gh","gr"),
	(3,"Hd","gru");

INSERT INTO Election Values
	(1,10050,"A","X"),
	(2,3145,"A","Y"),
	(2,8456,"B","Z"),
	(3,13455,"C","W"),
	(3,313,"E","W"),
	(1,4234,"D","X");
