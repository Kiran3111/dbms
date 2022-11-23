/*
    ⁜ Implicit Cursor

    » Write an anonymous code block which will update marks of students to 40 if he has
    scored between 35 to 39. Using IMPLICIT CURSOR parameters show database whether any
    records have been updated or not.If updated,display how many records have been
    updated.
*/

-- Query 1
CREATE TABLE student(roll_no int,name varchar(20),marks int);

-- Query 2
INSERT INTO student VALUES(1,'abc',39);

-- Query 3
INSERT INTO student VALUES(2,'pqr',35);

-- Query 4
INSERT INTO student VALUES(3,'xyz',41);

-- Query 5
INSERT INTO student VALUES(4,'cde',37);

-- Query 6
INSERT INTO student VALUES(5,'lmo',46);

-- Query 7
SELECT * FROM student;

-- Query 8
BEGIN
    UPDATE student SET marks=40 WHERE marks BETWEEN 35 AND 39;
    IF SQL%notfound THEN
        dbms_output.put_line('No records were updated');
    ELSE
        dbms_output.put_line('Total records updated : '||SQL%rowcount);
    END IF;
END;

-- Query 9
SELECT * FROM student;




/*
    ⁜ Explicit Cursor,FOR loop & Parametrized Explicit Cursor

    » Write an anonymous code block to demonstrate use of EXPLICIT CURSOR,FOR Loop &
    Parameterized Explicit Cursor.Copy the content of student table to another table. Before
    copying,check whether second table consists of same roll number record.If so,discard it
    otherwise copy it.
*/

-- Query 1
CREATE TABLE student2(roll_no int,name varchar(20),marks int);

-- Query 2 
INSERT INTO student2 values(1,'Nitesh',39);

-- Query 3
INSERT INTO student2 values(2,'Ajay',35);

-- Query 4
INSERT INTO student2 values(3,'Vivek',41);

-- Query 5
INSERT INTO student2 values(4,'Sanket',37);

-- Query 6
INSERT INTO student2 values(5,'Yash',46);


-- Query 7
CREATE TABLE newstudent2(roll_no int,name varchar(20),marks int);

-- Query 8
INSERT INTO newstudent2 values(1,'Nitesh',45);

-- Query 9
INSERT INTO newstudent2 values(3,'Vivek',45);

-- Query 10
INSERT INTO newstudent2 values(7,'Kiran',95);

-- Query 11
INSERT INTO newstudent2 values(8,'Prathamesh',65);

-- Query 12
select * from student2;

-- Query 13
select * from newstudent2;


-- Query 14
DECLARE
    CURSOR cur_s is select * from student2;
    CURSOR cur_new(a int) is select * from newstudent2 where roll_no =a;
    nrec newstudent2%rowtype;
BEGIN
    FOR srec in cur_s LOOP
        OPEN cur_new(srec.roll_no);
        FETCH cur_new INTO nrec;
        IF cur_new%notfound THEN
            INSERT INTO newstudent2 VALUES(srec.roll_no,srec.name,srec.marks);
        END IF;
        CLOSE cur_new;
    END LOOP;
END;

-- Query 15
SELECT * FROM newstudent2;
