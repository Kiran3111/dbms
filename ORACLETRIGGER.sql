/*
    ⁜ PL/SQL Triggers
    
    » Write a database trigger on Library table. The System
    should keep track of the records that are being updated or
    deleted. The old value of updated or deleted records should
    be added in Library_Audit table.
*/

-- Query 1
CREATE TABLE librarynew(bookno number(5),bookname varchar(20),author varchar(20));


-- Query 2
INSERT INTO librarynew VALUES (1,'C','Nitesh');

-- Query 3
INSERT INTO librarynew VALUES (2,'C++','Ajay');

-- Query 4
INSERT INTO librarynew VALUES (3,'PHP','Vivek');

-- Query 5
SELECT * FROM librarynew;

-- Query 6
CREATE TABLE audit_new (bookno number(5),bookname varchar(20),author varchar(20),updationstatus varchar(20));

-- Query 7
CREATE OR REPLACE TRIGGER t1new
AFTER UPDATE OR DELETE ON
    librarynew
FOR EACH ROW

DECLARE
    op varchar(10);
BEGIN
    IF updating THEN
        op:='Update';
    END IF;
    IF deleting THEN
        op:='Delete';
    END IF;
    INSERT INTO audit_new VALUES(:old.bookno,:old.bookname,:old.author,op);
END;


-- Query 8
SELECT * FROM librarynew;

-- Query 9
UPDATE librarynew SET bookname = 'CPP' WHERE bookno = 2;

-- Query 10
SELECT * FROM audit_new;

-- Query 11
SELECT * FROM librarynew;

-- Query 12
DELETE FROM librarynew WHERE bookno = 2;

-- Query 13
SELECT * FROM audit_new;

-- Query 14
SELECT * FROM librarynew;
