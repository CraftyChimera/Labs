mysql> DROP VIEW DEPENDANT;
Query OK, 0 rows affected (0.01 sec)

mysql> DROP VIEW DEPENDEE;
Query OK, 0 rows affected (0.00 sec)

mysql> CREATE VIEW DEPENDANT AS 
    -> SELECT E.fname, D.essn, D.depessn
    -> FROM Employee E, Dependent D
    -> WHERE E.ssn=D.essn AND E.sex = D.sex;
Query OK, 0 rows affected (0.00 sec)

mysql> 
mysql> CREATE VIEW DEPENDEE AS 
    -> SELECT E.fname, D.essn, D.depessn
    -> FROM Employee E, Dependent D
    -> WHERE E.ssn=D.depessn AND E.sex=D.sex;
Query OK, 0 rows affected (0.00 sec)

mysql> 
mysql> SELECT D1.fname
    -> FROM DEPENDANT D1, DEPENDEE D2
    -> WHERE D1.essn=D2.essn AND D1.depessn=D2.depessn AND D1.fname=D2.fname ;
+---------+
| fname   |
+---------+
| Frankie |
+---------+
1 row in set (0.00 sec)
