CREATE DATABASE CarRental

USE CarRental

CREATE TABLE Categories (
	Id INT PRIMARY KEY IDENTITY,
	CategoryName NVARCHAR(25) NOT NULL,
	DailyRate DECIMAL(10, 2) NOT NULL CHECK (DailyRate >= 0),
	WeeklyRate DECIMAL(10, 2) NOT NULL CHECK (WeeklyRate >= 0),
	MonthlyRate DECIMAL(10, 2) NOT NULL CHECK (MonthlyRate >= 0),
	WeekendRate DECIMAL(10, 2) NOT NULL CHECK (WeekendRate >= 0)
)

CREATE TABLE Cars (
	Id INT PRIMARY KEY IDENTITY,
	PlateNumber NVARCHAR(8) NOT NULL UNIQUE,
	Manufacturer NVARCHAR(50) NOT NULL,
	Model NVARCHAR(30) NOT NULL,
	CarYear INT NOT NULL CHECK (CarYear >= 1857),
	CategoryId INT FOREIGN KEY REFERENCES Categories (Id),
	Doors INT NOT NULL CHECK (Doors > 0 AND Doors <= 5),
	Picture VARBINARY(5120),
	Condition NVARCHAR(200),
	Available BIT
)

CREATE TABLE Employees   
(
	Id INT PRIMARY KEY IDENTITY,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Title NVARCHAR(20) NOT NULL,
	Notes NVARCHAR(MAX) NOT NULL
)

CREATE TABLE Customers    
(
	Id INT PRIMARY KEY IDENTITY,
	DriverLicenceNumber CHAR(10) NOT NULL UNIQUE,
	FullName NVARCHAR(60) NOT NULL,
	Address NVARCHAR(55) NOT NULL,
	City NVARCHAR(50) NOT NULL,
	ZIPCode VARCHAR(4) NOT NULL,
	Notes NVARCHAR(MAX) NOT NULL,
)

CREATE TABLE RentalOrders   
(
	Id INT PRIMARY KEY IDENTITY,
	EmployeeId INT FOREIGN KEY REFERENCES Employees(Id),
	CustomerId INT FOREIGN KEY REFERENCES Customers(Id),
	CarId INT FOREIGN KEY REFERENCES Cars(Id),
	TankLevel INT NOT NULL CHECK (TankLevel >= 20),
	KilometrageStart INT NOT NULL,
	KilometrageEnd INT NOT NULL,
	TotalKilometrage INT NOT NULL,
	Condition NVARCHAR(200),
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL,
	TotalDays INT NOT NULL,
	RateApplied INT NOT NULL,
	TaxRate DECIMAL(10, 2),
	OrderStatus BIT,
	Notes NVARCHAR(MAX)
)

INSERT INTO Categories (CategoryName, DailyRate, WeeklyRate, MonthlyRate, WeekendRate)
VALUES
('Economy', 15, 50, 1000, 40),
('Standard', 80, 500, 2000, 200),
('Premium', 100, 200, 180, 450)

INSERT INTO Cars (PlateNumber, Manufacturer, Model, CarYear, CategoryId, Doors, Picture, Condition, Available)
VALUES
('CA1234XB', 'Sedan', 'Renault', 2016, 1, 4, 0101010, 'Excellent', 1),
('TT4444TT', 'SUV', 'VW', 2016, 1, 4, 111000, 'Outstanding', 1),
('VV5555HH', 'Sedan', 'Mercedes', 2016, 3, 4, 01111, 'Excellent', 0)

INSERT INTO Employees (FirstName, LastName, Title, Notes)
 VALUES
('Tom', 'Barnes', 'Sales Representative', 'He is the real Barnes'),
('David', 'Jones', 'CEO', 'Chief executive officer'),
('Eva', 'Michado', 'Software developer', 'One of the best developer in the world')

INSERT INTO Customers (DriverLicenceNumber, FullName, Address, City, ZIPCode, Notes)
VALUES
('1234567890', 'Angela MErkel', 'Willy-Brandt-Strasse 1', 'Berlin', '1057', 'New leader of the free world'),
('1324567890', 'Barack Obama', '1600 Pennsylvania Ave NW', 'Washington', '2500', 'Previous leader of the free world'),
('3216549870', 'Bill Clinton', '555 Bloomberg Avenue', 'New York', '1000', 'Bill CLONTON BABY')

INSERT INTO RentalOrders (EmployeeId, CustomerId, CarId, Condition, TankLevel, KilometrageStart, KilometrageEnd, TotalKilometrage, StartDate, EndDate, TotalDays, RateApplied, TaxRate, OrderStatus, Notes)
VALUES
(1, 1, 1, 'Excellent', 100, 30100, 30200, 100, '2017-01-22', '2017-01-22', 1, 15, 30, 1, 'WoW'),
(2, 2, 2, 'Returned with damages', 100, 30100, 30250, 150, '2017-01-20', '2017-01-22', 3, 80, 27, 0, 'TBD'),
(3, 3, 3, 'Excellent', 100, 30000, 30200, 200, '2017-01-21', '2017-01-22', 2, 110, 20, 0, 'LoL')