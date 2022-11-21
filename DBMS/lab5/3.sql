mysql> SELECT E1.fname AS Employee_First, E1.lname AS Employee_Last, E2.fname AS Manager_First, E2.lname AS Manager_First FROM Employee E1, Employee E2 WHERE E1.superssn=E2.ssn;
+----------------+---------------+---------------+---------------+
| Employee_First | Employee_Last | Manager_First | Manager_First |
+----------------+---------------+---------------+---------------+
| Frankie        | Haworth       | Tamas         | Whitley       |
+----------------+---------------+---------------+---------------+
1 row in set (0.00 sec)