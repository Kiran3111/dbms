-- creating a database for students
CREATE DATABASE STUDENTS_Info;

-- selecting the database
USE STUDENTS_Info;

-- creating a table for students
CREATE TABLE Students(Id int not null Primary Key, Name varchar(20), TotalMarks int);
CREATE TABLE Grades(Id int not null AUTO_INCREMENT Primary Key, grade varchar(10));

-- inserting table data

INSERT INTO Students VALUES (1,'Nitesh',90);
INSERT INTO Students VALUES (2,'Ajay',50);
INSERT INTO Students VALUES (3,'Vivek',70);
INSERT INTO Students VALUES (4,'Sanket',80);
INSERT INTO Students VALUES (5,'Yash',65);
INSERT INTO Students VALUES (6,'Prathamesh',55);
INSERT INTO Students VALUES (7,'Kiran',75);

INSERT INTO Grades(grade) VALUES ('A');
INSERT INTO Grades(grade) VALUES ('B');
INSERT INTO Grades(grade) VALUES ('A');
INSERT INTO Grades(grade) VALUES ('C');
INSERT INTO Grades(grade) VALUES ('B');
INSERT INTO Grades(grade) VALUES ('A');
INSERT INTO Grades(grade) VALUES ('B');
INSERT INTO Grades(grade) VALUES ('C');

-- creating a joint
SELECT Students.Id, Students.Name, Grades.grade FROM Students INNER JOIN Grades ON Students.Id=Grades.Id;
SELECT Students.Id, Students.Name, Grades.grade, Students.TotalMarks FROM Students INNER JOIN Grades ON Students.Id=Grades.Id;

-- creating views
CREATE VIEW Average_Students AS SELECT Name, TotalMarks FROM Students WHERE TotalMarks > (SELECT AVG(TotalMarks) FROM Students);
CREATE VIEW Topper_Students AS SELECT Name, TotalMarks FROM Students WHERE TotalMarks > 90;

-- Calling the created views
SELECT * FROM Average_Students;
SELECT * FROM Topper_Students;

-- Commands with subqueries
SELECT Name AS "FirstClass Students" FROM Students WHERE Id IN (SELECT Id FROM Students WHERE TotalMarks > 60);
SELECT Name AS "Distinction Students" FROM Students WHERE Id IN (SELECT Id FROM Students WHERE TotalMarks > 75);
