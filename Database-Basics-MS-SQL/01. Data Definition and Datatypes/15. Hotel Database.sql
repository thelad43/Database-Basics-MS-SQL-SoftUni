CREATE DATABASE Hotel

USE Hotel

CREATE TABLE Employees (
	Id INT PRIMARY KEY IDENTITY,
	FirstName NVARCHAR(20) NOT NULL,
	LastName NVARCHAR(20) NOT NULL,
	Title NVARCHAR(30) NOT NULL,
	Notes NVARCHAR(MAX)
)

CREATE TABLE Customers (
	AccountNumber INT PRIMARY KEY IDENTITY,
	FirstName NVARCHAR(20) NOT NULL,
	LastName NVARCHAR(20) NOT NULL,
	PhoneNumber CHAR(10) NOT NULL,
	EmergencyName NVARCHAR(20) NOT NULL,
	EmergencyNumber CHAR(10) NOT NULL,
	Notes NVARCHAR(MAX)
)

CREATE TABLE RoomStatus (
	Id INT PRIMARY KEY IDENTITY,
	RoomStatus NVARCHAR(20) NOT NULL,
	Notes NVARCHAR(MAX)
)

CREATE TABLE RoomTypes (
	Id INT PRIMARY KEY IDENTITY,
	RoomType NVARCHAR(20) NOT NULL,
	Notes NVARCHAR(MAX)
)

CREATE TABLE BedTypes (
	Id INT PRIMARY KEY IDENTITY,
	BedType NVARCHAR(20) NOT NULL,
	Notes NVARCHAR(MAX)
)

CREATE TABLE Rooms (
	RoomNumber INT PRIMARY KEY IDENTITY,
	RoomTypeId INT FOREIGN KEY REFERENCES RoomTypes(Id),
	BedTypeId INT FOREIGN KEY REFERENCES BedTypes(Id),
	Rate INT NOT NULL,
	RoomStatusId INT FOREIGN KEY REFERENCES RoomStatus(Id),
	Notes NVARCHAR(MAX)
)

CREATE TABLE Payments (
	Id INT PRIMARY KEY IDENTITY,
	EmployeeId INT FOREIGN KEY REFERENCES Employees(Id),
	PaymentDate DATETIME2 NOT NULL,
	AccountNumber CHAR(10) NOT NULL,
	FirstDateOccupied DATE NOT NULL,
	LastDateOccupied DATE NOT NULL,
	TotalDays INT NOT NULL,
	AmountCharged DECIMAL(10, 2) NOT NULL,
	TaxRate DECIMAL(10, 2) NOT NULL,
	TaxAmount DECIMAL(10, 2) NOT NULL,
	PaymentTotal DECIMAL(10, 2) NOT NULL,
	Notes NVARCHAR(MAX)
)

CREATE TABLE Occupancies (
	Id INT PRIMARY KEY IDENTITY,
	EmployeeId INT FOREIGN KEY REFERENCES Employees(Id),
	DateOccupied DATE NOT NULL,
	AccountNumber INT NOT NULL,
	RoomNumber INT FOREIGN KEY REFERENCES Rooms(RoomNumber),
	RateApplied INT NOT NULL,
	PhoneCharge INT NOT NULL,
	Notes NVARCHAR(MAX)
)

INSERT INTO Employees (FirstName, LastName, Title, Notes)
VALUES
('Pesho', 'Peshoov', 'title', 'some notes'), 
('Goshi', 'Goshov', 'title test', 'some more notes'), 
('MIsho', 'Stamaat', 'test test', '')

INSERT INTO Customers (FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber, Notes)
VALUES
('Peter', 'Ivanov', '1234567890', 'emergency', 'emergency1', 'no notes'),
('Sando', 'Petrov', '1535567890', 'emergencyy', 'emergency2', 'all the notes'),
('Peter', 'Ivanov', '1234567890', 'emergencyyy', 'emergency3', '')

INSERT INTO RoomStatus (RoomStatus, Notes)
VALUES
('ZAETO', 'ZAETO E'),
('NE ZAETO', 'NE E ZAETO'),
('SREDNO', 'SREDNO')

INSERT INTO RoomTypes (RoomType, Notes)
VALUES
('TYPE1', ''),
('TYPE2', ''),
('TYPE3', '')

INSERT INTO BedTypes (BedType, Notes)
VALUES
('TYPE11', '11'),
('TYPE12', '12'),
('TYPE13', '13')

INSERT INTO Rooms (RoomTypeId, BedTypeId, Rate, RoomStatusId, Notes)
VALUES
(1, 1, 5, 1, ''),
(2, 2, 7, 2, ''),
(3, 3, 10, 3, '')

INSERT INTO Payments (EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, LastDateOccupied, TotalDays, AmountCharged, TaxRate, TaxAmount, PaymentTotal)
VALUES
(1, '2017-01-20', '1234567890', '2017-01-21', '2017-01-22', 15, 25.2, 32.3, 65.3, 200),
(2, '2017-01-20', '1234467890', '2017-01-21', '2017-01-22', 15, 25.2, 32.3, 65.3, 200),
(3, '2017-01-20', '1234587890', '2017-01-21', '2017-01-22', 15, 25.2, 32.3, 65.3, 200)

INSERT INTO Occupancies (EmployeeId, DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge)
VALUES
(1, '2017-01-21', 2, 1, 5, 8),
(2, '2017-01-21', 2, 2, 6, 9),
(3, '2017-01-21', 2, 3, 7, 10)