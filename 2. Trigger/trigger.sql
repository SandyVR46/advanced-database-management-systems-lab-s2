
# 1. trigger created to raise application error while deleting a field from the table.

SQL> 
SQL> 
SQL> SELECT * FROM CUSTOMERS;

        ID NAME                        AGE ADDRESS                       SALARY 
---------- -------------------- ---------- ------------------------- ---------- 
         1 Ramesh                       32 Ahmedabad                       2000 
         2 Khilan                       25 Delhi                           1500 
         3 kaushik                      23 Kota                            2000 
         4 Chaitali                     25 Mumbai                          6500 
         5 Hardik                       27 Bhopal                          8500 
         6 Komal                        22 MP                              4500 

6 rows selected.

SQL> CREATE OR REPLACE TRIGGER EMPTY_TRIGG
  2  BEFORE DELETE ON CUSTOMERS
  3  FOR EACH ROW
  4  BEGIN
  5  RAISE_APPLICATION_ERROR(-20101,'DELETION NOT POSSIBLE');
  6  END;
  7  /

Trigger created.

SQL> DELETE FROM CUSTOMERS WHERE ID=1;
DELETE FROM CUSTOMERS WHERE ID=1
            *
ERROR at line 1:
ORA-20101: DELETION NOT POSSIBLE 
ORA-06512: at "ANONYMOUS.EMPTY_TRIGG", line 2 
ORA-04088: error during execution of trigger 'ANONYMOUS.EMPTY_TRIGG' 


# 2. trigger created to insert a tuple in customers while updating a field id with less than 50 in managers

SQL> 
SQL> 
SQL> 
SQL> 
SQL> SELECT * FROM CUSTOMERS;

        ID NAME                        AGE ADDRESS                       SALARY 
---------- -------------------- ---------- ------------------------- ---------- 
         1 Ramesh                       32 Ahmedabad                       2000 
         2 Khilan                       25 Delhi                           1500 
         3 kaushik                      23 Kota                            2000 
         4 Chaitali                     25 Mumbai                          6500 
         5 Hardik                       27 Bhopal                          8500 
         6 Komal                        22 MP                              4500 
  

6 rows selected.

SQL> SELECT * FROM MANAGERS;

        ID NAME                        AGE ADDRESS                       SALARY 
---------- -------------------- ---------- ------------------------- ---------- 
         1 Ram                          32 Ahmedabad                       2000 
         2 Dev                          25 Delhi                           1500 
         3 Karan                        23 Kota                            2000 
         4 Rijoy                        25 Mumbai                          6500 
         5 Ben                          27 Bhopal                          8500 
         6 Sharukh                      22 MP                              4500 

6 rows selected.



SQL> CREATE OR REPLACE TRIGGER TR2
  2  AFTER UPDATE ON MANAGERS
  3  REFERENCING NEW AS NEWROW
  4  FOR EACH ROW WHEN(NEWROW.ID<=50)
  5  BEGIN
  6  INSERT INTO CUSTOMERS VALUES
  7  (:NEWROW.ID,:NEWROW.NAME,:NEWROW.AGE,:NEWROW.ADDRESS,:NEWROW.SALARY);
  8  END;
  9  /

Trigger created.

SQL> SET SERVEROUTPUT ON
SQL> UPDATE MANAGERS SET ID=20 WHERE NAME='Sharukh';

1 row updated.

SQL> SELECT * FROM CUSTOMERS;

        ID NAME                        AGE ADDRESS                       SALARY 
---------- -------------------- ---------- ------------------------- ---------- 
         1 Ramesh                       32 Ahmedabad                       2000 
         2 Khilan                       25 Delhi                           1500 
         3 kaushik                      23 Kota                            2000 
         4 Chaitali                     25 Mumbai                          6500 
         5 Hardik                       27 Bhopal                          8500 
         6 Komal                        22 MP                              4500 
        20 Sharukh                      22 MP                              4500 

7 rows selected.

SQL> SELECT * FROM MANAGERS;

        ID NAME                        AGE ADDRESS                       SALARY 
---------- -------------------- ---------- ------------------------- ---------- 
         1 Ram                          32 Ahmedabad                       2000 
         2 Dev                          25 Delhi                           1500 
         3 Karan                        23 Kota                            2000 
         4 Rijoy                        25 Mumbai                          6500 
         5 Ben                          27 Bhopal                          8500 
        20 Sharukh                      22 MP                              4500 

6 rows selected.

SQL> 
