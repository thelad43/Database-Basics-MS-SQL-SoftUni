CREATE DATABASE Movies

CREATE TABLE Directors (
	Id INT PRIMARY KEY IDENTITY,
	DirectorName NVARCHAR(50) NOT NULL,
	Notes NVARCHAR(MAX)
)

CREATE TABLE Genres (
	Id INT PRIMARY KEY IDENTITY,
	GenreName NVARCHAR(50) NOT NULL,
	Notes NVARCHAR(MAX)
)

CREATE TABLE Categories (
	Id INT PRIMARY KEY IDENTITY,
	CategoryName NVARCHAR(50) NOT NULL,
	Notes NVARCHAR(MAX)
)

CREATE TABLE Movies (
	Id INT PRIMARY KEY IDENTITY,
	Title NVARCHAR(20) NOT NULL,
	DirectorId INT FOREIGN KEY REFERENCES Directors(Id),
	CopyrightYear INT NOT NULL,
	Length INT NOT NULL,
	GenreId INT FOREIGN KEY REFERENCES Genres(Id),
	CategoryId INT FOREIGN KEY REFERENCES Categories(Id),
	Rating INT NOT NULL,
	Notes NVARCHAR(MAX)
)

INSERT INTO Directors (DirectorName, Notes)
VALUES
('Pesho', 'Notes notes'),
('Christopher Nolan', 'Best known for his cerebral, often nonlinear story-telling'),
('Susanne Bier', 'Known for In a Better World (2010), After the Wedding (2006) and Brothers (2004).'),
('Kathryn Bigelow', 'Director of The Hurt Locker'),
('Ridley Scott', 'His reputation remains solidly intact.')

INSERT INTO Genres (GenreName)
VALUES
('Drama'), ('History'), ('Thriller'), ('Romance'), ('Sci-Fi')

INSERT INTO Categories (CategoryName)
VALUES
('R'), ('PG-13'), ('PG-18'), ('Avoid at all cost'), ('Hahahahh')

INSERT INTO Movies (Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Rating, Notes)
VALUES
('The Gods must be crazy', 5, 2004, 145, 1, 1, 8.5, NULL),
('The Prestige', 2, 2006, 130, 5, 2, 8.7, 'Good movie'),
('The movie', 4, 2007, 132, 3, 1, 7.4, NULL),
('Wrong turn', 3, 2002, 155, 1, 1, 7.8, 'LOL'),
('WTF', 1, 2011, 124, 1, 1, 7.4, NULL)