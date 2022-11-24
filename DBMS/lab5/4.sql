mysql> SELECT E.fname, E.mint, E.lname, E.ssn, E.bdate, E.address, E.sex, E.salary, D.dno, D.dname, D.mgrssn, D.mgrstartdate, D.dlocation
    -> FROM Employee E
    -> LEFT JOIN Department D
    -> ON E.dno=D.dno
    -> WHERE D.dname='Research';
+-------+------+---------+------------+------------+-----------------+------+--------+------+----------+------------+--------------+-----------+
| fname | mint | lname   | ssn        | bdate      | address         | sex  | salary | dno  | dname    | mgrssn     | mgrstartdate | dlocation |
+-------+------+---------+------------+------------+-----------------+------+--------+------+----------+------------+--------------+-----------+
| Tamas | NULL | Whitley | 1567347415 | 1998-02-19 | 97 Elka Terrace | MALE |  60418 |    1 | Research | 8237688072 | 2012-07-08   | Stafford  |
+-------+------+---------+------------+------------+-----------------+------+--------+------+----------+------------+--------------+-----------+
1 row in set (0.00 sec)