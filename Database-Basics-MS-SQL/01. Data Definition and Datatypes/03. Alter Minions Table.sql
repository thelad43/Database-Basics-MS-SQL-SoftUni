ALTER TABLE Minions
ADD TownId INT FOREIGN KEY REFERENCES Towns(Id)
GO