

CREATE TABLE STUDENT(
ROLL_NO INT NOT NULL PRIMARY KEY,
S_NAME VARCHAR(20),
S_ADDRESS VARCHAR(20)
);

CREATE TABLE MARKSHEET(
ROLL_NO INT NOT NULL,
FOREIGN KEY (ROLL_NO) REFERENCES STUDENT(ROLL_NO),
SUB1 INT,
SUB2 INT,
SUB3 INT);


INSERT INTO STUDENT VALUES(1, 'RAHUL', 'PATTOM');
INSERT INTO STUDENT VALUES(2, 'SACHIN', 'AMBALAM MUKKU');
INSERT INTO STUDENT VALUES(3, 'SAURAV', 'NALANCHIRA');

INSERT INTO MARKSHEET VALUES(1, 78, 89, 94);
INSERT INTO MARKSHEET VALUES(2, 54, 65, 77);
INSERT INTO MARKSHEET VALUES(3, 23, 78, 46);

SELECT * FROM STUDENT;

   ROLL_NO S_NAME               S_ADDRESS                                       
---------- -------------------- --------------------                            
         1 RAHUL                PATTOM                                          
         2 SACHIN               AMBALAM MUKKU                                   
         3 SAURAV               NALANCHIRA                                      

SELECT * FROM MARKSHEET;

   ROLL_NO       SUB1       SUB2       SUB3                                     
---------- ---------- ---------- ----------                                     
         1         78         89         94                                     
         2         54         65         77                                     
         3         23         78         46                                     

SQL> 
SQL> 3.a)
SQL> 
SQL> ALTER TABLE MARKSHEET
  2  ADD GRADE VARCHAR(5);

Table altered.

SQL> 
SQL> 3.b)
SQL> 
SQL> ALTER TABLE MARKSHEET
  2  DROP COLUMN SUB2;

Table altered.

SQL> SELECT * FROM MARKSHEET;

   ROLL_NO       SUB1       SUB3 GRADE                                          
---------- ---------- ---------- -----                                          
         1         78         94                                                
         2         54         77                                                
         3         23         46                                                

SQL> 
SQL> 3.c)
SQL> 
SQL> ALTER TABLE STUDENT
  2  ADD PHN INT
  3  CHECK(PHN >=10 );

Table altered.

SQL> 
SQL> UPDATE STUDENT
  2  SET PHN =9022033011
  3  WHERE  ROLL_NO=1;

1 row updated.

SQL> UPDATE STUDENT
  2  SET PHN =9022033012
  3  WHERE  ROLL_NO=2;

1 row updated.

SQL> UPDATE STUDENT
  2  SET PHN =9022033013
  3  WHERE  ROLL_NO=3;

1 row updated.

SQL> SELECT * FROM STUDENT;

   ROLL_NO S_NAME               S_ADDRESS                   PHN                 
---------- -------------------- -------------------- ----------                 
         1 RAHUL                PATTOM               9022033011                 
         2 SACHIN               AMBALAM MUKKU        9022033012                 
         3 SAURAV               NALANCHIRA           9022033013                 

SQL> 
SQL> 4.a)
SQL> 
SQL> SELECT * FROM STUDENT WHERE S_ADDRESS='PATTOM';

   ROLL_NO S_NAME               S_ADDRESS                   PHN                 
---------- -------------------- -------------------- ----------                 
         1 RAHUL                PATTOM               9022033011                 

SQL> 
SQL> 4.b)
SQL> 
SQL> SELECT SUM(SUB1+SUB3)
  2  FROM MARKSHEET WHERE ROLL_NO=2;

SUM(SUB1+SUB3)                                                                  
--------------                                                                  
           131                                                                  

SQL> 
SQL> 4.c)
SQL> 
SQL> SELECT DISTINCT S_NAME
  2  FROM STUDENT
  3  WHERE ROLL_NO=3;

S_NAME                                                                          
--------------------                                                            
SAURAV                                                                          

SQL> 
SQL> 4.d)
SQL> 
SQL> SELECT PHN FROM STUDENT WHERE S_NAME='SACHIN';

       PHN                                                                      
----------                                                                      
9022033012                                                                      


