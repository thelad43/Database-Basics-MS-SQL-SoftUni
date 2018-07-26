CREATE TABLE People (
	Id INT PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(200) NOT NULL,
	Picture VARBINARY(2048),
	Height DECIMAL(4, 2),
	[Weight] DECIMAL(4, 2),
	Gender CHAR(1) CHECK(Gender = 'm' OR Gender = 'f') NOT NULL,
	Birthdate DATETIME2 NOT NULL,
	Biography NVARCHAR(MAX) 
)

INSERT INTO People (Name, Picture, Height, Weight, Gender, Birthdate, Biography)
VALUES
('Pesho', 011010101, 1.74, 65.77, 'm', '1992/02/17', 'Pesho e mnogo qk pich.'),
('Gosho', 01111101, 1.88, 87.00, 'm', '1980/06/11', 'Gosho e senior dev'),
('Stamatka', 100000001, 1.64, 65.77, 'f', '1985/05/03', 'Stamatka e jenata na gosho'),
('Cat', 000011010, 0.20, 2.22, 'f', '2018/01/01', ''),
('Trevor Phillips', 101010101, 1.90, 85.7, 'm', '1995/08/08', 'He is from GTA V')