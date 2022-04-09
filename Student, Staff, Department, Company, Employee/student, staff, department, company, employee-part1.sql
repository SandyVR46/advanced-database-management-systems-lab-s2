
CREATE TABLE DEPARTMENT(
DEPTID INT PRIMARY KEY NOT NULL,
NAME VARCHAR(20));

CREATE TABLE STUDENT(
STUDID INT PRIMARY KEY NOT NULL,
NAME VARCHAR(20),
CLASS VARCHAR(10),
CITY VARCHAR(25),
TOTAL_MARKS INT,
PERCENTAGE VARCHAR(5),
DEPTID INT NOT NULL,
FOREIGN KEY(DEPTID) REFERENCES DEPARTMENT(DEPTID)
);

CREATE TABLE STAFF(
STAFFID INT PRIMARY KEY NOT NULL,
NAME VARCHAR(20),
DEPTID INT NOT NULL,
FOREIGN KEY(DEPTID) REFERENCES DEPARTMENT(DEPTID),
DESIGNATION VARCHAR(25),
SALARY INT,
CITY VARCHAR(15));

CREATE TABLE COMPANY(
COMPID INT PRIMARY KEY NOT NULL,
NAME VARCHAR(20) NOT NULL,
CITY VARCHAR(20),
NO_OF_EMPLOYEES INT NOT NULL);

CREATE TABLE EMPLOYEE(
EMPID INT PRIMARY KEY NOT NULL,
NAME VARCHAR(20),
COMPID INT NOT NULL,
FOREIGN KEY(COMPID) REFERENCES COMPANY(COMPID),
DESIGNATION VARCHAR(25),
SALARY INT,
CITY VARCHAR(25));


INSERT INTO DEPARTMENT VALUES(11, 'MCA');
INSERT INTO DEPARTMENT VALUES(12, 'MBA');
INSERT INTO DEPARTMENT VALUES(13, 'MTECH');

INSERT INTO STUDENT VALUES(01, 'T CHALAMET', 'S1', 'KINGSTON', 98, 98, 11);
INSERT INTO STUDENT VALUES(02, 'ZENDAYA', 'S1', 'LA',  89, 89, 12);
INSERT INTO STUDENT VALUES(03, 'DYLAN WANG', 'S1', 'KINGSTON', 70, 70, 11);

INSERT INTO STAFF VALUES(111, 'TOM HOLLAND', 11, 'ASSOCIATE PROFESSOR', 35000, 'KINGSTON');
INSERT INTO STAFF VALUES(112, 'TOBEY MAGUIRE', 12, 'HOD', 46000, 'LA');
INSERT INTO STAFF VALUES(113, 'ANDREW GARFIELD', 13, 'ASSOCIATE PROFESSOR', 34000, 'KINGSTON');

INSERT INTO COMPANY VALUES(600, 'WALT DISNEY', 'ERNAKULAM', 30);
INSERT INTO COMPANY VALUES(601, 'DREAMWORKS', 'TRIVANDRUM', 50);
INSERT INTO COMPANY VALUES(602, 'SONY PICTURES', 'DELHI', 20);

INSERT INTO EMPLOYEE VALUES(200, 'HISOKA', 600, 'CLERK', 50000 , 'ERNAKULAM');
INSERT INTO EMPLOYEE VALUES(201, 'KILLUA', 601, 'GARDENER', 40000 , 'TRIVANDRUM');
INSERT INTO EMPLOYEE VALUES(202, 'GON', 602, 'CLERK', 50000 , 'ERNAKULAM');


      2.a)
SQL> 
SQL> 
SQL> SELECT * FROM DEPARTMENT;

    DEPTID NAME                                                                 
---------- ------------------                                                   
        11 MCA                                                                  
        12 MBA                                                                  
        13 MTECH                                                                

SQL> 
SQL> 
SQL> SELECT * FROM STUDENT;

    STUDID NAME               CLASS      CITY       TOTAL_MARKS PERCE     DEPTID
---------- ------------------ ---------- ---------- ----------- ----- ----------
         1 T CHALAMET         S1         KINGSTON            98 98            11
         2 ZENDAYA            S1         LA                  89 89            12
         3 DYLAN WANG         S1         KINGSTON            70 70            11

SQL> 
SQL> 
SQL> SELECT * FROM STAFF;

   STAFFID NAME                   DEPTID DESIGNATION        SALARY CITY         
---------- ------------------ ---------- -------------- ---------- ----------   
       111 TOM HOLLAND                11 ASSOCIATE PROF      35000 KINGSTON     
                                         ESSOR                                  
                                                                                
       112 TOBEY MAGUIRE              12 HOD                 46000 LA           
       113 ANDREW GARFIELD            13 ASSOCIATE PROF      34000 KINGSTON     
                                         ESSOR                                  
                                                                                

SQL> 
SQL> 
SQL> SELECT * FROM COMPANY;

    COMPID NAME               CITY       NO_OF_EMPLOYEES                        
---------- ------------------ ---------- ---------------                        
       600 WALT DISNEY        ERNAKULAM               30                        
       601 DREAMWORKS         TRIVANDRUM              50                        
       602 SONY PICTURES      DELHI                   20                        

SQL> 
SQL> 
SQL> SELECT * FROM EMPLOYEE;

     EMPID NAME                   COMPID DESIGNATION        SALARY CITY         
---------- ------------------ ---------- -------------- ---------- ----------   
       200 HISOKA                    600 CLERK               50000 ERNAKULAM    
       201 KILLUA                    601 GARDENER            40000 TRIVANDRUM   
       202 GON                       602 CLERK               50000 ERNAKULAM    



SQL>
SQL> 2.b)
SQL> 
SQL> SELECT * FROM STUDENT ORDER BY DEPTID;

    STUDID NAME               CLASS      CITY       TOTAL_MARKS PERCE     DEPTID
---------- ------------------ ---------- ---------- ----------- ----- ----------
         1 T CHALAMET         S1         KINGSTON            98 98            11
         3 DYLAN WANG         S1         KINGSTON            70 70            11
         2 ZENDAYA            S1         LA                  89 89            12

SQL> 
SQL> 2.c)
SQL> 
SQL> SELECT NAME FROM EMPLOYEE;

NAME                                                                            
------------------                                                              
HISOKA                                                                          
KILLUA                                                                          
GON                                                                             

SQL> 
SQL> 2.d)
SQL> 
SQL> SELECT * FROM STAFF WHERE SALARY > 20000;

   STAFFID NAME                   DEPTID DESIGNATION        SALARY CITY         
---------- ------------------ ---------- -------------- ---------- ----------   
       111 TOM HOLLAND                11 ASSOCIATE PROF      35000 KINGSTON     
                                         ESSOR                                  
                                                                                
       112 TOBEY MAGUIRE              12 HOD                 46000 LA           
       113 ANDREW GARFIELD            13 ASSOCIATE PROF      34000 KINGSTON     
                                         ESSOR                                  
                                                                                

SQL> 
SQL> 2.e)
SQL> 
SQL> SELECT * FROM STUDENT
  2  WHERE PERCENTAGE BETWEEN 80 AND 90;

    STUDID NAME               CLASS      CITY       TOTAL_MARKS PERCE     DEPTID
---------- ------------------ ---------- ---------- ----------- ----- ----------
         2 ZENDAYA            S1         LA                  89 89            12


