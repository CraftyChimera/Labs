mysql> CREATE VIEW EMP_Project AS (SELECT E.fname, E.dno, P.pno FROM Employee E LEFT JOIN Project P ON E.dno=P.dno);
Query OK, 0 rows affected (0.01 sec)

mysql> SELECT * FROM EMP_Project; 
+----------+------+------+
| fname    | dno  | pno  |
+----------+------+------+
| Tamas    |    1 |    1 |
| Frankie  |    2 |    2 |
| Frankie  |    2 |    2 |
| Dolf     |    3 |    3 |
| Jedediah |    3 |    3 |
+----------+------+------+
5 rows in set (0.00 sec)

