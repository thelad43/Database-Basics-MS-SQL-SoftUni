CREATE TABLE Users (
	Id INT PRIMARY KEY IDENTITY,
	Username VARCHAR(30) NOT NULL UNIQUE,
	Password VARCHAR(26) NOT NULL,
	ProfilePicture VARBINARY(900),
	LastLoginTime DATETIME2,
	IsDeleted BIT DEFAULT 0
)

INSERT INTO Users (Username, Password, ProfilePicture, LastLoginTime, IsDeleted)
VALUES 
('Pesho', 'parola123', 0000, '2016/01/17 18:40:15', 'False'),
('Gosho', 'nonUnicodePass', 1203, '2018/11/14 18:08:25', 'False'),
('Ivan', 'website', 0111, '2014/07/03 12:10:35', 'True'),
('Stamat', 'c# is the best', 6702, '2000/06/08 15:50:45', 'False'),
('Daniela', 'franklin', 1234, '1987/02/26 19:20:55', 'True')