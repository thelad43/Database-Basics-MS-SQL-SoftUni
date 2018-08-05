CREATE TABLE Logs (
  LogId INT PRIMARY KEY IDENTITY,
  AccountId INT,
  OldSum DECIMAL (14, 2),
  NewSum DECIMAL (14, 2)
)

CREATE TRIGGER InsertNewEntryIntoLogs ON Accounts
  AFTER UPDATE
AS
  INSERT INTO Logs
  VALUES (
    (SELECT Id
     FROM inserted),
    (SELECT Balance
     FROM deleted),
    (SELECT Balance
     FROM inserted)
)