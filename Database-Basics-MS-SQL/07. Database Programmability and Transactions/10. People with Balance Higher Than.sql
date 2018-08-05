CREATE PROC usp_GetHoldersWithBalanceHigherThan @money DECIMAL (15, 2) AS
     SELECT FirstName, LastName
       FROM AccountHolders AS ah
 INNER JOIN Accounts AS a
		ON ah.Id = a.AccountHolderId
   GROUP BY FirstName, LastName
 HAVING SUM (a.Balance) > @money

EXEC dbo.usp_GetHoldersWithBalanceHigherThan 200