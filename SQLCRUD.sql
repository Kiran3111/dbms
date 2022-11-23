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

-- firstly run practical a2_1 file commands
SELECT * FROM Students;
SELECT * FROM Grades;

-- inserting values into tables
INSERT INTO Students VALUES (8,"Shubham",80);
INSERT INTO Grades(grade) VALUES ("B");
INSERT INTO Students VALUES (9,"Rohan",85);
INSERT INTO Grades(grade) VALUES ("A");

-- changing values of the records
UPDATE Students SET TotalMarks = 85 WHERE Id = 5;
UPDATE Students SET TotalMarks = 89 WHERE Id = 6;
UPDATE Students SET TotalMarks = 95 WHERE Id = 1;

-- deleting records
DELETE FROM Students WHERE Id=8;
DELETE FROM Students WHERE Name="Rohan";
DELETE FROM Students WHERE Name="Kiran";

-- viewing the records
SeLECT * FROM Students;
