mysql> SELECT bdate, address FROM Employee WHERE dno = (SELECT dno FROM Department WHERE dname='Research');
+------------+-----------------+
| bdate      | address         |
+------------+-----------------+
| 1998-02-19 | 97 Elka Terrace |
+------------+-----------------+
1 row in set (0.00 sec)

mysql> select * from Employee;
+----------+------+-------------+------------+------------+---------------------------+--------+--------+------------+------+
| fname    | mint | lname       | ssn        | bdate      | address                   | sex    | salary | superssn   | dno  |
+----------+------+-------------+------------+------------+---------------------------+--------+--------+------------+------+
| Tamas    | NULL | Whitley     | 1567347415 | 1998-02-19 | 97 Elka Terrace           | MALE   |  60418 | 8237688072 |    1 |
| Frankie  | M    | Haworth     | 5799966668 | 1995-10-13 | 542 Oxford Plaza          | MALE   |  14954 | 1818717339 |    2 |
| Frankie  | T    | Skett       | 8702641882 | 2022-08-27 | 05105 Brickson Park Alley | MALE   | 126772 | 1818717339 |    2 |
| Dolf     | D    | Marlon      | 8995782709 | 1997-04-02 | 2195 Shelley Park         | FEMALE |  58926 | 1449455628 |    3 |
| Jedediah | NULL | Yakobowitch | 9024136483 | 2022-03-24 | 879 Oak Valley Plaza      | MALE   | 183951 | 1449455628 |    3 |
+----------+------+-------------+------------+------------+---------------------------+--------+--------+------------+------+
5 rows in set (0.00 sec)

mysql> select * from Department;
+-------------+-----+------------+--------------+-----------+
| dname       | dno | mgrssn     | mgrstartdate | dlocation |
+-------------+-----+------------+--------------+-----------+
| Research    |   1 | 8237688072 | 2012-07-08   | Stafford  |
| Advertising |   2 | 1818717339 | 2010-01-10   | GreenHall |
| HR          |   3 | 1449455628 | 2011-01-10   | RedVine   |
+-------------+-----+------------+--------------+-----------+
3 rows in set (0.00 sec)