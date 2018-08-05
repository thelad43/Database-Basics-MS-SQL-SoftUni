CREATE PROC usp_GetTownsStartingWith  @prefixName NVARCHAR(10) AS
	 SELECT Name AS Town
	   FROM Towns
	   WHERE LEFT(Name, LEN(@prefixName)) = @prefixName 

EXEC usp_GetTownsStartingWith 'B'