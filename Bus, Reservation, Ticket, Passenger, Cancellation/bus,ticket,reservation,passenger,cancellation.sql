SQL> CREATE TABLE BUS(
  2  BUS_NO INT NOT NULL PRIMARY KEY,
  3  SOURCE VARCHAR(25) NOT NULL,
  4  DESTINATION VARCHAR(25) NOT NULL,
  5  COUCH_TYPE VARCHAR(25) NOT NULL);

Table created.

SQL> CREATE TABLE RESERVATION(
  2  PNR_NO INT PRIMARY KEY,
  3  JOURNEY_DATE DATE,
  4  NO_OF_SEAT VARCHAR(25),
  5  ADDRESS VARCHAR(50),
  6  CONTACT_NO VARCHAR(20),
  7  BUS_NO INT NOT NULL,
  8  FOREIGN KEY(BUS_NO) REFERENCES BUS(BUS_NO),
  9  SEAT_NO VARCHAR(10));

Table created.

SQL> CREATE TABLE TICKET(
  2  TICKET_NO INT PRIMARY KEY,
  3  JOURNEY_DATE DATE,
  4  AGE INT,
  5  SEX CHAR(6),
  6  SOURCE VARCHAR(25),
  7  DESTINATION VARCHAR(25),
  8  DEST_TIME VARCHAR(20),
  9  BUS_NO VARCHAR(10));

Table created.

SQL> CREATE TABLE PASSENGER(
  2  PNR_NO INT,
  3  TICKET_NO INT,
  4  FOREIGN KEY(TICKET_NO) REFERENCES TICKET(TICKET_NO),
  5  NAME CHAR(20),
  6  AGE INT,
  7  SEX CHAR(6),
  8  CONTACT_NO VARCHAR(15));

Table created.

SQL> CREATE TABLE CANCELLATION(
  2  PNR_NO INT,
  3  JOURNEY_DATE DATE,
  4  SEAT_NO NUMBER(8),
  5  CONTACT_NO VARCHAR(15));

Table created.

SQL> 
SQL> INSERT INTO BUS VALUES(200, 'TVM', 'KOCHI', 'MINI-COACH');
1 row created.

SQL> INSERT INTO BUS VALUES(201, 'DELHI', 'MYSORE', 'DOUBLE-DECKER');
1 row created.

SQL> INSERT INTO BUS VALUES(202, 'PATNA', 'COIMBATORE', 'VOLVO');
1 row created.

SQL> 
SQL> INSERT INTO RESERVATION VALUES(181, '01-JAN-2022', 4, '33 3rd Ave, New York, NY 10003, USA', '(518)473-2492', 200, 'A13');
1 row created.

SQL> INSERT INTO RESERVATION VALUES(182, '10-MAR-2022', 2, '371 7th Ave, New York, NY 10001', '(518)473-6648', 201, 'Z25');
1 row created.

SQL> INSERT INTO RESERVATION VALUES(183, '03-NOV-1999', 4, '221b Baker St, London NW1 6XE, United Kingdom', '(518)473-6458', 202, 'F05');
1 row created.

SQL> 
SQL> INSERT INTO TICKET VALUES('0122', '01-JAN-2022', '26', 'F', 'TVM', 'KOCHI', '09:26:50', '200');
1 row created.

SQL> INSERT INTO TICKET VALUES('1119', '10-MAR-2022', '38', 'M', 'DELHI', 'MYSORE', '08:57:12', '202');
1 row created.

SQL> INSERT INTO TICKET VALUES('3489', '03-NOV-1999', '10', 'F', 'PATNA', 'COIMBATORE', '01:00:12', '202');
1 row created.

SQL> 
SQL> INSERT INTO PASSENGER VALUES('181', '0122', 'SARABETH', '26', 'F', '(518)473-2492');
1 row created.

SQL> INSERT INTO PASSENGER VALUES('182', '1119', 'BAPHOMETH', '40', 'M', '(518)473-6648');
1 row created.

SQL> INSERT INTO PASSENGER VALUES('183', '3489', 'LUCIFER', '10', 'M', '(518)473-6658');
1 row created.

SQL> 
SQL> INSERT INTO CANCELLATION VALUES('181', '11-OCT-2019', '20020020', '(518)473-2492');
1 row created.

SQL> INSERT INTO CANCELLATION VALUES('182', '10-OCT-2019', '20120120', '(518)473-6648');
1 row created.

SQL> INSERT INTO CANCELLATION VALUES('183', '10-OCT-2019', '20220220', '(518)473-6658');
1 row created.

SQL> SELECT * FROM BUS;

    BUS_NO SOURCE                    DESTINATION               COUCH_TYPE                                                                                                                               
---------- ------------------------- ------------------------- -------------------------                                                                                                                
       200 TVM                       KOCHI                     MINI-COACH                                                                                                                               
       201 DELHI                     MYSORE                    DOUBLE-DECKER                                                                                                                            
       202 PATNA                     COIMBATORE                VOLVO                                                                                                                                    


SQL> SELECT * FROM RESERVATION;

    PNR_NO JOURNEY_D NO_OF_SE ADDRESS                                            CONTACT_NO           BUS_NO SEAT_NO                                                                                    
---------- --------- -------- -------------------------------------------------- ---------------- ---------- ----------                                                                                 
       181 01-JAN-22 4        33 3rd Ave, New York, NY 10003, USA                (518)473-2492           200 A13                                                                                        
       182 10-MAR-22 2        371 7th Ave, New York, NY 10001                    (518)473-6648           201 Z25                                                                                        
       183 03-NOV-99 4        221b Baker St, London NW1 6XE, United Kingdom      (518)473-6458           202 F05                                                                                        

SQL> SELECT * FROM TICKET;

 TICKET_NO JOURNEY_D        AGE SEX    SOURCE                    DESTINATION               DEST_TIME            BUS_NO                                                                                  
---------- --------- ---------- ------ ------------------------- ------------------------- -------------------- ----------                                                                              
       122 01-JAN-22         26 F      TVM                       KOCHI                     09:26:50             200                                                                                     
      1119 10-MAR-22         38 M      DELHI                     MYSORE                    08:57:12             202                                                                                     
      3489 03-NOV-99         10 F      PATNA                     COIMBATORE                01:00:12             202                                                                                     

SQL> SELECT * FROM PASSENGER;

    PNR_NO  TICKET_NO NAME                        AGE SEX    CONTACT_NO                                                                                                                                 
---------- ---------- -------------------- ---------- ------ ----------------                                                                                                                           
       181        122 SARABETH                     26 F      (518)473-2492                                                                                                                              
       182       1119 BAPHOMETH                    40 M      (518)473-6648                                                                                                                              
       183       3489 LUCIFER                      10 M      (518)473-6658                                                                                                                              

SQL> SELECT * FROM CANCELLATION;

    PNR_NO JOURNEY_D    SEAT_NO CONTACT_NO                                                                                                                                                              
---------- --------- ---------- ----------------                                                                                                                                                        
       181 11-OCT-19   20020020 (518)473-2492                                                                                                                                                           
       182 10-OCT-19   20120120 (518)473-6648                                                                                                                                                           
       183 10-OCT-19   20220220 (518)473-6658      

SQL> 
SQL> SELECT TICKET_NO, NAME FROM PASSENGER;

 TICKET_NO NAME                                                                 
---------- --------------------                                                 
       122 SARABETH                                                             
      1119 BAPHOMETH                                                            
      3489 LUCIFER                                                              

SQL> 
SQL> SELECT NAME FROM PASSENGER WHERE SEX='M';

NAME                                                                            
--------------------                                                            
BAPHOMETH                                                                       
LUCIFER                                                                         

SQL> 
SQL> SELECT NAME FROM PASSENGER WHERE AGE BETWEEN 20 AND 40;

NAME                                                                            
--------------------                                                            
SARABETH                                                                        
BAPHOMETH                                                                       

SQL> 
SQL> ALTER TABLE CANCELLATION
  2  ADD FOREIGN KEY(PNR_NO) REFERENCES RESERVATION(PNR_NO);

Table altered.

SQL> ALTER TABLE CANCELLATION MODIFY SEAT_NO NUMBER(12);

Table altered.

SQL> 
SQL> UPDATE RESERVATION
  2  SET BUS_NO = 202
  3  WHERE PNR_NO = 182;
1 row updated.

SQL> DELETE FROM BUS WHERE BUS_NO = 201;
1 row deleted.


SQL> SELECT * FROM BUS;

    BUS_NO SOURCE                    DESTINATION               COUCH_TYPE                                                                                                                               
---------- ------------------------- ------------------------- -------------------------                                                                                                                
       200 TVM                       KOCHI                     MINI-COACH                                                                                                                               
       202 PATNA                     COIMBATORE                VOLVO                                                                                                                                    

SQL> SELECT PNR_NO FROM PASSENGER
  2  INTERSECT
  3  SELECT PNR_NO FROM CANCELLATION WHERE JOURNEY_DATE = '10-OCT-2019';

    PNR_NO                                                                                                                                                                                              
----------                                                                                                                                                                                              
       182                                                                                                                                                                                              
       183                                                                                                                                                                                              

SQL> SELECT NAME FROM PASSENGER WHERE PNR_NO IN(182, 183);

NAME                                                                                                                                                                                                    
--------------------                                                                                                                                                                                    
BAPHOMETH                                                                                                                                                                                               
LUCIFER                                                                                                                                                                                                 

SQL> 
SQL> SELECT COUNT(SEX)
  2  FROM TICKET
  3  WHERE BUS_NO=200 AND SEX='F';

COUNT(SEX)                                                                                                                                                                                              
----------                                                                                                                                                                                              
         1                                                                                                                                                                                              

SQL> 
SQL> SELECT NAME FROM PASSENGER
  2  ORDER BY
  3  NAME;

NAME                                                                                                                                                                                                    
--------------------                                                                                                                                                                                    
BAPHOMETH                                                                                                                                                                                               
LUCIFER                                                                                                                                                                                                 
SARABETH                                                                                                                                                                                                

SQL> 
SQL> SELECT TICKET_NO
  2  FROM PASSENGER
  3  WHERE
  4  NAME LIKE 'S%H%';

 TICKET_NO                                                                                                                                                                                              
----------                                                                                                                                                                                              
       122                                                                                                                                                                                              

SQL> 

