CREATE TABLE Students (
	StudentID INT PRIMARY KEY,
	StudentNumber INT,
	StudentName NVARCHAR(100),
	MajorID INT
)

CREATE TABLE Agenda (
	StudentID INT,	
	SubjectID INT,
	CONSTRAINT PK_Agenda PRIMARY KEY (StudentID, SubjectID)
)

CREATE TABLE Subjects (
	SubjectID INT PRIMARY KEY,
	SubjectName NVARCHAR(100)
)

CREATE TABLE Majors (
	MajorID INT PRIMARY KEY,
	Name NVARCHAR(100)
)

CREATE TABLE Payments (
	PaymentID INT PRIMARY KEY,
	PaymentDate DATE,
	PaymentAmount MONEY,
	StudentID INT
)

   ALTER TABLE Students
ADD CONSTRAINT FK_Students_Majors FOREIGN KEY (MajorID) REFERENCES Majors (MajorID)

   ALTER TABLE Payments
ADD CONSTRAINT FK_Payments_Students FOREIGN KEY (StudentID) REFERENCES Students (StudentID)

   ALTER TABLE Agenda
ADD CONSTRAINT FK_Agenda_Students FOREIGN KEY (StudentID) REFERENCES Students (StudentID),
    CONSTRAINT FK_Agenda_Subjects FOREIGN KEY (SubjectID) REFERENCES Subjects (SubjectID)