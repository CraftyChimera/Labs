mysql> CREATE VIEW Project_DEPT AS (SELECT pno,Department.dno,dname, mgrssn FROM Project LEFT JOIN Department ON Project.dno=Department.dno WHERE plocation='Stafford');
Query OK, 0 rows affected (0.01 sec)

mysql> SELECT pno,dname,lname,bdate,address FROM Project_DEPT LEFT JOIN Employee ON Project_DEPT.mgrssn=Employee.ssn;
+-----+----------+-------+-------+---------+
| pno | dname    | lname | bdate | address |
+-----+----------+-------+-------+---------+
|   1 | Research | NULL  | NULL  | NULL    |
|   3 | HR       | NULL  | NULL  | NULL    |
+-----+----------+-------+-------+---------+
2 rows in set (0.00 sec)