CREATE TABLE Students (
	StudentID INT IDENTITY PRIMARY KEY,
	Name NVARCHAR(100)
)

CREATE TABLE Exams (
	ExamID INT PRIMARY KEY,
	Name NVARCHAR(100)
)

CREATE TABLE StudentsExams (
	StudentID INT,
	ExamID INT,
	CONSTRAINT PK_StudentsExams PRIMARY KEY (StudentID, ExamID),
	CONSTRAINT FK_StudentsExams_Students FOREIGN KEY (StudentID) REFERENCES Students (StudentID),
	CONSTRAINT FK_StudentsExams_Exams FOREIGN KEY (ExamID) REFERENCES Exams (ExamID)
)

INSERT INTO Students (Name)
VALUES
('Mila'),
('Toni'),
('Ron')

INSERT INTO Exams (ExamID, Name) 
VALUES
(101, 'Spring MVC'),
(102, 'Neo4j'),
(103, 'Oracle 11g')