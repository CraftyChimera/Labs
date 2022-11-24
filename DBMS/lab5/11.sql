mysql> CREATE VIEW NAME_SALARY AS SELECT E.fname, E.salary FROM Employee E;
Query OK, 0 rows affected (0.01 sec)

mysql> SELECT * FROM NAME_SALARY; 
+----------+--------+
| fname    | salary |
+----------+--------+
| Tamas    |  60418 |
| Frankie  |  14954 |
| Frankie  | 126772 |
| Dolf     |  58926 |
| Jedediah | 183951 |
+----------+--------+
5 rows in set (0.00 sec)