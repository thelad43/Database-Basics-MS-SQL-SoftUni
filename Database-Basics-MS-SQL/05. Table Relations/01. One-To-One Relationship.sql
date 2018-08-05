CREATE DATABASE TableRelations

USE TableRelations

CREATE TABLE Persons (
	PersonId INT NOT NULL,
	FirstName NVARCHAR(25) NOT NULL,
	Salary DECIMAL(10, 2) NOT NULL,
	PassportID INT NOT NULL
)

CREATE TABLE Passports ( 
	PassportId INT NOT NULL,
	PassportNumber CHAR(8) NOT NULL
)

   ALTER TABLE Persons
ADD CONSTRAINT PK_PersonId PRIMARY KEY (PersonId)

   ALTER TABLE Passports
ADD CONSTRAINT PK_PassportId PRIMARY KEY (PassportId)

   ALTER TABLE Persons
ADD CONSTRAINT FK_Persons_Passports FOREIGN KEY (PassportId)
    REFERENCES Passports (PassportId)