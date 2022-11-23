/*
   ⁜ Control Statements and Exception Handling

   » Write a PL/SQL block of code for the following requirements:-
   Schema:
   1. Borrower(Rollin, Name, DateofIssue, NameofBook, Status)
   2. Fine(Roll_no,Date,Amt)
   3. Accept roll_no & name of book from user.
   4. Check the number of days (from date of issue), if days are between 15 to 30 then fine
      amount will be Rs 5per day.
   5. If no. of days>30, per day fine will be Rs 50 per day & for days less than 30, Rs. 5 per
      day.
   6. After submitting the book, status will change from I to R.
   7. If condition of fine is true, then details will be stored into fine table.

*/

-- Query 1
CREATE TABLE borrower(roll_no int,name varchar(20),date_of_i date,name_of_book varchar(20),status varchar(10));

-- Query 2
CREATE TABLE fine(roll_no int,date_of_r date,amt int);

-- Query 3
INSERT INTO borrower values(1,'Nitesh','06-12-2022','Harry Potter','i');

-- Query 4
INSERT INTO borrower values(2,'Ajay','06-13-2022','Mahabharat','i');

-- Query 5
INSERT INTO borrower values(3,'Vivek','06-15-2022','Ramayan','i');

-- Query 6
INSERT INTO borrower values(4,'Sanket','07-25-2022','Bhagvadgita','i');

-- Query 7
INSERT INTO borrower values(5,'Yash','04-20-2022','Game Of Thrones','i');

-- Query 8
INSERT INTO borrower values(6,'Prathamesh','05-22-2022','AttitudeIsEverything','i');

-- Query 9
SELECT * FROM borrower;

-- Query 10
DECLARE
   roll INT:= :rollNo;
   b_name VARCHAR(20) := :bookname;
   mdays INT:=0;
   ndays DATE;
   fine_amt INT:=0;
BEGIN
   SELECT date_of_i INTO ndays FROM borrower WHERE roll_no=roll AND name_of_book=b_name;
   mdays:=sysdate-ndays;

   IF mdays>=15 AND mdays<30 THEN
      fine_amt:=(mdays-15)*5;
   ELSIF mdays>=30 THEN
      fine_amt:=15*5+(mdays-30)*50;
   END IF;

   UPDATE borrower SET status='r' WHERE roll_no=roll AND name_of_book=b_name;
   IF fine_amt>0 THEN
      INSERT INTO fine VALUES(roll,sysdate,fine_amt);
   END IF;
EXCEPTION
   WHEN no_data_found THEN
      dbms_output.put_line('No data found');
   WHEN others THEN
      dbms_output.put_line('Exception occurred');
END;

-- Query 11
SELECT * FROM borrower;

-- Query 12
SELECT * FROM fine;
