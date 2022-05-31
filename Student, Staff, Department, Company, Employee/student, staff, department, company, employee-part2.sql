
SQL>
SQL> 3.a)
SQL>
SQL> SELECT S.NAME, D.NAME
  2  FROM STUDENT S, DEPARTMENT D
  3  WHERE S.DEPTID=D.DEPTID
  4  AND D.NAME='MCA';

NAME                 NAME                                                       
-------------------- --------------------                                       
T CHALAMET           MCA                                                        
DYLAN WANG           MCA                                                        



SQL> 
SQL> 3.b)
SQL> 

  1  UPDATE STAFF
  2  SET SALARY=SALARY+(SALARY*10/100)
  3 WHERE DESIGNATION='ASSOCIATE PROFESSOR';
2 rows updated.

SQL> SELECT * FROM STAFF;

   STAFFID|NAME                |    DEPTID|DESIGNATION              |    SALARY|CITY                                                                                                                                                                            
----------|--------------------|----------|-------------------------|----------|---------------                                                                                                                                                                 
       111|TOM HOLLAND         |        11|ASSOCIATE PROFESSOR      |     38500|KINGSTON                                                                                                                                                                        
       112|TOBEY MAGUIRE       |        12|HOD                      |     46000|LA                                                                                                                                                                              
       113|ANDREW GARFIELD     |        13|ASSOCIATE PROFESSOR      |     37400|KINGSTON                                                                                                                                                                        

SQL> 
SQL> 
SQL> 3.c)
SQL> 
  1  SELECT C.NAME, E.NAME, C.CITY
  2  FROM COMPANY C, EMPLOYEE E
  3  WHERE C.COMPID=E.COMPID
  4  AND C.CITY=E.CITY;


NAME                |NAME                |CITY                                                                                                                                                                                                                  
--------------------|--------------------|--------------------                                                                                                                                                                                                  
WALT DISNEY         |HISOKA              |ERNAKULAM                                                                                                                                                                                                             
DREAMWORKS          |KILLUA              |TRIVANDRUM                                                                                                                                                                                                            

SQL> 
SQL> 
SQL> 3.d)
SQL> 
SQL> SELECT COUNT(NAME), DEPTID
  2  FROM STAFF STAFF GROUP BY DEPTID;

COUNT(NAME)|    DEPTID                                                                                                                                                                                                                                          
-----------|----------                                                                                                                                                                                                                                          
          1|        11                                                                                                                                                                                                                                          
          1|        13                                                                                                                                                                                                                                          
          1|        12                                                                                                                                                                                                                                          

SQL> 
SQL> 
SQL> 

