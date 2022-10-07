DROP DATABASE covid;
CREATE DATABASE covid;
use covid;

CREATE TABLE Patient(
P_id int,
Patient_Name varchar(255),
Sex enum('F','M','O'),
Age int,
Area varchar(255),
City varchar(255),
H_id int,
PRIMARY KEY(P_id)
);

CREATE TABLE Test_Report(
	T_id int,
	P_id int,
	H_id int,
	Reporting_date datetime,
	Test_result boolean,
	Discharge_date datetime,
	PRIMARY KEY(T_id)
);

CREATE TABLE Hospital(
	H_id int,
	Hospital_name varchar(255),
	Location varchar(50),
	State varchar(50),
	T_id int,
	PRIMARY KEY(H_id)
	);

ALTER TABLE Patient ADD FOREIGN KEY(H_id) references Hospital(H_id);
ALTER TABLE Test_Report ADD FOREIGN KEY(P_id) references Patient(P_id);
ALTER TABLE Test_Report ADD FOREIGN KEY(H_id) references Hospital(H_id);
ALTER TABLE Hospital ADD FOREIGN KEY(T_id) references Test_Report(T_id);

INSERT INTO Hospital(H_id,Hospital_name,Location,State) VALUES
	(1,"Apollo","Chennai","Tamil Nadu"),
	(2,"Rama","Chennai","Tamil Nadu"),
	(3,"Apollo","Kovai","Tamil Nadu"),
	(4,"Be Well","Erode","Tamil Nadu"),
	(5,"Apollo","Mumbai","Maharashtra"),
	(6,"Ganesha","Nagpur","Maharasthra");
	
INSERT INTO Patient(P_id,Patient_Name,Sex,Age,Area,City) VALUES
	(1,"Shivan",'M',21,"Ambattur","Chennai"),
	(2,"Xavier",'M',18,"VadaPalani","Mumbai"),
	(3,"Lokammitran",'M',20,"Kolathur","Kovai"),
	(4,"Skanny",'M',18,"Anna Nagar","Nagpur"),
	(5,"Maya",'F',12,"T Nagar","Erode"),
	(6,"Mayamal",'F',13,"Erode","Erode"),
	(7,"Madhumita",'F',22,"Anna Nagar","Nagpur");

INSERT INTO Test_Report(T_id,P_id,H_id,Reporting_date,Test_result,Discharge_date) VALUES
	(1,1,1,'2022-09-01',false,'2022-09-11'),
	(2,2,2,'2022-09-02',false,'2022-09-13'),
	(3,3,1,'2022-09-03',true,'2022-09-13'),
	(4,4,3,'2022-09-04',false,'2022-09-15'),
	(5,5,5,'2022-09-05',true,'2022-09-15'),
	(6,6,2,'2022-09-06',false,'2022-09-17');
	
UPDATE Patient SET H_id = (SELECT H_id from Test_Report WHERE Patient.P_id=Test_Report.P_id);
UPDATE Hospital SET T_id = (SELECT T_id from Test_Report WHERE Hospital.H_id=Test_Report.H_id);
