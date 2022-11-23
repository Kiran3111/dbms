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


-- Viewing both the tables
SELECT * FROM Students;
SELECT * FROM Grades;

-- Finding average marks of students
SELECT AVG(TotalMarks) FROM Students;

-- Finding marks of a particular student
SELECT * FROM Students WHERE Name LIKE '%Nitesh%';

-- Finding students whose marks is above avg
SELECT Name AS "Students above AVG" FROM Students WHERE TotalMarks > (SELECT AVG(TotalMarks) FROM Students);
