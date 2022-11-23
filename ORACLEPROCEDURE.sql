/*
    ⁜ PL/SQL Stored Procedure

    » Write a Stored Procedure namely procGrade for the
    categorization of student. If marks scored by students in
    examination is <=1500 and marks >=990 then student will be
    placed in distinction category if marks scored are between 989
    and 900 category is first class, if marks 899 and 825 category is
    Higher Second Class
    Write a PL/SQL block for using procedure created with above
    requirement. Stud_Marks(name, total_marks) Result(Roll,
    Name, Class)


*/

-- Query 1
CREATE TABLE stud_marks(name varchar(20),total_marks number(5));

-- Query 2
CREATE TABLE result (roll number(3),name varchar(20),class varchar(20));


-- Query 3
CREATE OR REPLACE PROCEDURE procGrade(rno number,name varchar,marks number)
IS
    class varchar(20);
BEGIN
    IF(marks <=1500 and marks >=990) THEN
        class := 'Distinction';
    ELSIF(marks<=989 and marks>=900) THEN
        class := 'First';
    ELSIF(marks<=899 and marks>=825) THEN
        class := 'Higher second';
    END IF;

    INSERT INTO stud_marks values(name,marks);
    INSERT INTO result values(rno,name,class);
END;


-- Query 4
BEGIN
    procGrade(1,'Nitesh',877);
    procGrade(2,'Ajay',1450);
    procGrade(3,'Vivek',987);
END;


-- Query 5
SELECT * FROM stud_marks;

-- Query 6
SELECT * FROM result;
