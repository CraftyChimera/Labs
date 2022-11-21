mysql> SELECT fname, lname FROM Employee E JOIN Department D ON E.superssn = D.mgrssn WHERE mgrstartdate > '2012-07-07' AND mgrstartdate < '2012-08-07';
+-------+---------+
| fname | lname   |
+-------+---------+
| Tamas | Whitley |
+-------+---------+
1 row in set (0.00 sec)
