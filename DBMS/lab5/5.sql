mysql> SELECT P.pno, P.pname FROM Project P, Department D, Employee E WHERE P.dno=D.dno AND D.dno=E.dno AND E.lname='Skett';
+-----+--------------------+
| pno | pname              |
+-----+--------------------+
|   2 | Eco-friendly image |
+-----+--------------------+
1 row in set (0.00 sec)